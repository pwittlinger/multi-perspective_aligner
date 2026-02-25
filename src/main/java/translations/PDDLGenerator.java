package translations;

import model.Activity;
import model.DeclareModel;
import org.processmining.ltl2automaton.plugins.LTL2Automaton;
import org.processmining.ltl2automaton.plugins.automaton.Automaton;
import org.processmining.ltl2automaton.plugins.automaton.DeterministicAutomaton;
import org.processmining.ltl2automaton.plugins.automaton.State;
import org.processmining.ltl2automaton.plugins.automaton.Transition;
import org.processmining.ltl2automaton.plugins.formula.DefaultParser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class PDDLGenerator {

    private final HashMap<String, Activity> activities;
    private Automaton automaton;
    private ArrayList<State> acceptingStates;
    private ArrayList<Transition> relevantTransitions;


    public PDDLGenerator(DeclareModel model, String ltlString) throws Exception {
        this.activities = model.getActivities();
        this.automaton = LTL2Automaton.getInstance().translate(new DefaultParser(ltlString).parse());
        this.acceptingStates = findAcceptingStates();
        this.relevantTransitions = findRelevantTransitions();
        //IOManager.getInstance().exportToDot(automaton);
    }


    private ArrayList<Transition> findRelevantTransitions() {
        ArrayList<Transition> relevantTransitions = new ArrayList<>();
        for (Transition transition : automaton.transitions()) {
            if (transition.getSource().getId() != transition.getTarget().getId()) {
                relevantTransitions.add(transition);
            }
        }
        return relevantTransitions;
    }

    private ArrayList<State> findAcceptingStates() {
        ArrayList<State> acceptingS = new ArrayList<>();
        for (State state : automaton) {
            if (state.isAccepting()) {
                acceptingS.add(state);
            }
        }
        return acceptingS;
    }


    //Section: Define domain PDDL
    public String defineDomain() {
        StringBuilder builder = new StringBuilder(defineDomainDescription(new ArrayList<>(activities.keySet())));
        for (Map.Entry<String, Activity> activityEntry : activities.entrySet()) {
            Activity activity = activityEntry.getValue();
            builder.append(defineAddition(activity)).append(defineDeletion(activity)).append(defineReplacement(activity))
                    .append(defineMissingReplacement(activity)).append(defineWrongReplacement(activity));
        }
        builder.append(defineSync()).append(defineGoTo()).append(")");
        return builder.toString();
    }

    private String defineDomainDescription(ArrayList<String> activityNames) {
        return "(define (domain Mining)\n" +
                "\t(:requirements :typing :equality :action-costs :conditional-effects)\n" +
                "\t(:types\n" +
                "\t\tstate activity - object\n" +
                "\t\ttrace_state automaton_state - state\n" +
                "\t\t" + defineActivityTypes(activityNames) + "\n\t)\n\n" +
                "\t(:predicates\n" +
                "\t\t(trace ?t1 - trace_state ?e - activity ?t2 - trace_state)\n" +
                "\t\t(automaton ?s1 - automaton_state ?e - activity ?s2 - automaton_state)\n" +
                "\t\t(atoms ?e1 - activity ?e2 - activity)\n" +
                "\t\t(missing ?e1 - activity ?e2 - activity)\n" +
                "\t\t(wrong ?e1 - activity ?e2 - activity)\n" +
                "\t\t(valid ?e1 - activity)\n" +
                "\t\t(cur_state ?s - state)\n" + "\t\t(final_state ?s - state)\n\t)\n\n" +
                "\t(:functions\n" + "\t\t(total-cost) - number\n\t)\n\n";
    }

    private String defineActivityTypes(ArrayList<String> activityNames) {
        StringBuilder builder = new StringBuilder();
        for (String string : activityNames) {
            builder.append(string).append("_activity ");
        }
        builder.append("- activity");
        return builder.toString();
    }

    private String defineAddition(Activity activity) {
        String activityName = activity.getName();
        return "\t(:action add_" + activityName + "_activity\n" +
                "\t\t:parameters (?s1 - automaton_state ?e - " + activityName + "_activity ?s2 - automaton_state)\n" +
                "\t\t:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))\n" +
                "\t\t:effect (and (increase (total-cost) " + activity.getAddCost() + ") " +
                "(not (cur_state ?s1)) (cur_state ?s2)\n\t))\n\n";
    }

    private String defineDeletion(Activity activity) {
        String activityName = activity.getName();
        return "\t(:action del_" + activityName + "_activity\n" +
                "\t\t:parameters (?t1 - trace_state ?e - " + activityName + "_activity ?t2 - trace_state)\n" +
                "\t\t:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))\n" +
                "\t\t:effect (and (increase (total-cost) " + activity.getRemoveCost() + ") " +
                "(not (cur_state ?t1)) (cur_state ?t2))\n\t)\n\n";
    }

    private String defineSync() {
        return """
                    \t(:action sync
                    \t\t:parameters (?t1 - trace_state ?e - activity ?t2 - trace_state)
                    \t\t:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2) (valid ?e))
                    \t\t:effect (and (increase (total-cost) 0) (not (cur_state ?t1)) (cur_state ?t2)
                    \t\t\t(forall (?s1 ?s2 - automaton_state)
                    \t\t\t\t(when (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
                    \t\t\t\t\t(and (not (cur_state ?s1)) (cur_state ?s2))
                    \t))))
                    
                    """;
    }

    private String defineReplacement(Activity activity) {
        String activityName = activity.getName();
        return "\t(:action repl_" + activityName + "_activity\n" +
                "\t\t:parameters (?t1 - trace_state ?e1 - " + activityName + "_activity ?e2 - " +
                activityName + "_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)\n" +
                "\t\t:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) " +
                "(cur_state ?s1) (automaton ?s1 ?e2 ?s2))\n" +
                "\t\t:effect (and (increase (total-cost) " + activity.getReplaceCost() + ") " +
                "(not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)\n\t))\n\n";
    }

    private String defineMissingReplacement(Activity activity) {
        String activityName = activity.getName();
        return "\t(:action repl_" + activityName + "_missing\n" +
                "\t\t:parameters (?t1 - trace_state ?e1 - " + activityName + "_activity ?e2 - " +
                activityName + "_activity ?t2 - trace_state)\n" +
                "\t\t:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))\n" +
                "\t\t:effect (and (increase (total-cost) " + activity.getMissingCost() + ") " +
                "(not (cur_state ?t1)) (cur_state ?t2)\n" +
                automatonIterationString();
    }

    private String defineWrongReplacement(Activity activity) {
        String activityName = activity.getName();
        return "\t(:action repl_" + activityName + "_wrong\n" +
                "\t\t:parameters (?t1 - trace_state ?e1 - " + activityName + "_activity ?e2 - " +
                activityName + "_activity ?t2 - trace_state)\n" +
                "\t\t:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))\n" +
                "\t\t:effect (and (increase (total-cost) " + activity.getWrongCost() + ") " +
                "(not (cur_state ?t1)) (cur_state ?t2)\n" +
                automatonIterationString();
    }

    private String automatonIterationString() {
        return "\t\t\t(forall (?s1 ?s2 - automaton_state)\n" +
                "\t\t\t\t(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))\n" +
                "\t\t\t\t\t(and (not (cur_state ?s1)) (cur_state ?s2))\n\t))))\n\n";
    }

    private String defineGoTo() {
        return """             
                \t(:action goto
                \t\t:parameters (?s1 - automaton_state ?s2 - automaton_state ?t1 - trace_state)
                \t\t:precondition (and (final_state ?s1) (cur_state ?s1) (final_state ?t1) (cur_state ?t1))
                \t\t:effect (and (increase (total-cost) 0) (not (cur_state ?s1)) (cur_state ?s2))
                \t)
                """;
    }


    //Section: Generate problem PDDL based on trace
    public String generateProblem(ArrayList<String> sequence) {
        return "(define (problem Align)\n(:domain Mining)\n" + defineObjects(sequence.size()) +
                defineInit(sequence) + defineGoal(sequence.size()) + ")";
    }

    private String defineObjects(int traceSize) {
        return "(:objects\n" + defineTraceObjects(traceSize) + defineAutomataObjects() + defineActivityObjects() + ")\n";
    }

    private String defineTraceObjects(int traceSize) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i <= traceSize; i++) {
            builder.append("t").append(i).append(" ");
        }
        builder.append("- trace_state\n");
        return builder.toString();
    }

    private String defineAutomataObjects() {
        StringBuilder builder = new StringBuilder();
        for (State state : automaton) {
            builder.append(state).append(" ");
        }
        builder.append("s_abstract - automaton_state\n");
        return builder.toString();
    }

    private String defineActivityObjects() {
        StringBuilder builder = new StringBuilder();
        for (Map.Entry<String, Activity> activity : activities.entrySet()) {
            if (activity.getValue().getPartitions().isEmpty()) {
                builder.append(activity.getKey()).append(" - ").append(activity.getKey()).append("_activity\n");
            } else {
                for (String partition : activity.getValue().getPartitions().keySet()) {
                    builder.append(partition).append(" ");
                }
                builder.append(activity.getKey()).append("_missing ").append(activity.getKey()).append("_wrong ")
                        .append("- ").append(activity.getKey()).append("_activity\n");
            }
        }
        return builder.toString();
    }

    private String defineInit(ArrayList<String> sequence) {
        return "(:init\n(cur_state " + automaton.getInit() + ") (cur_state t0)\n" + defineFinalStates(sequence.size()) +
                defineTraceTransitions(sequence) + defineAutomataTransitions() + defineValidityBasedPredicates() +
                defineAtomsPredicates() + "(= (total-cost) 0)\n)\n";
    }

    private String defineFinalStates(int traceSize) {
        StringBuilder builder = new StringBuilder();
        for (State state : acceptingStates) {
            builder.append("(final_state ").append(state).append(") ");
        }
        builder.append("(final_state t").append(traceSize).append(")\n");
        return builder.toString();
    }

    private String defineTraceTransitions(ArrayList<String> sequence) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < sequence.size(); i++) {
            builder.append("(trace t").append(i).append(" ").append(sequence.get(i)).append(" t").append(i + 1).append(")\n");
        }
        return builder.toString();
    }

    private String defineAutomataTransitions() {
        StringBuilder builder = new StringBuilder();
        for (Transition transition : relevantTransitions) {
            if (!transition.isNegative()) {
                builder.append("(automaton ").append(transition.getSource()).append(" ")
                        .append(transition.getPositiveLabel()).append(" ").append(transition.getTarget()).append(")\n");
            } else {
                for (Map.Entry<String, Activity> activity : activities.entrySet()) {
                    if (activity.getValue().getPartitions().isEmpty()) {
                        builder.append("(automaton ").append(transition.getSource()).append(" ")
                                .append(activity.getKey()).append(" ").append(transition.getTarget()).append(")\n");
                    }
                    for (String partitionKey : activity.getValue().getPartitions().keySet()) {
                        if (!transition.getNegativeLabels().contains(partitionKey)) {
                            builder.append("(automaton ").append(transition.getSource()).append(" ")
                                    .append(partitionKey).append(" ").append(transition.getTarget()).append(")\n");
                        }
                    }
                }
            }
        }
        return builder.toString();
    }

    private String defineValidityBasedPredicates() {
        StringBuilder builder = new StringBuilder();
        StringBuilder validAtoms = new StringBuilder();
        StringBuilder wrongReplacements = new StringBuilder();
        StringBuilder missingReplacements = new StringBuilder();
        for (Map.Entry<String, Activity> activity : activities.entrySet()) {
            if (activity.getValue().getPartitions().isEmpty()) {
                validAtoms.append("(valid ").append(activity.getKey()).append(")\n");
            } else if (activity.getValue().getPartitions().size() == 1) {
                validAtoms.append("(valid ").append(activity.getKey()).append("_p1)\n");
            } else {
                for (String partition : activity.getValue().getPartitions().keySet()) {
                    validAtoms.append("(valid ").append(partition).append(") ");
                    wrongReplacements.append("(missing ").append(activity.getKey()).append("_missing ").append(partition).append(") ");
                    missingReplacements.append("(wrong ").append(activity.getKey()).append("_wrong ").append(partition).append(") ");
                }
                wrongReplacements.append("\n");
                missingReplacements.append("\n");
                validAtoms.append("\n");
            }
        }
        return builder.append(validAtoms).append(missingReplacements).append(wrongReplacements).toString();
    }

    private String defineAtomsPredicates() {
        StringBuilder builder = new StringBuilder();
        for (Map.Entry<String, Activity> activity : activities.entrySet()) {
            if (activity.getValue().getPartitions().size() > 1) {
                for (String partitionSource : activity.getValue().getPartitions().keySet()) {
                    for (String partitionTarget : activity.getValue().getPartitions().keySet()) {
                        if (!partitionSource.equals(partitionTarget)) {
                            builder.append("(atoms ").append(partitionSource).append(" ").append(partitionTarget).append(") ");
                        }
                    }
                    builder.append("\n");
                }
            }
        }
        return builder.toString();
    }



    private String defineGoal(int traceSize) {
        return "(:goal\n" + "(and " + "(cur_state t" + traceSize + ") " +
                "(cur_state s_abstract)\n" + "))\n" +
                "(:metric minimize (total-cost))\n";
    }


    public void setAutomaton(Automaton aut) {
        this.automaton = aut;
        this.acceptingStates = findAcceptingStates();
        this.relevantTransitions = findRelevantTransitions();

    }

}