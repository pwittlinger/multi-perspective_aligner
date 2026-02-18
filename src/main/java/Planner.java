import fr.uga.pddl4j.encoding.CodedProblem;
import fr.uga.pddl4j.heuristics.relaxation.CriticalPath;
import fr.uga.pddl4j.heuristics.relaxation.Heuristic;
import fr.uga.pddl4j.parser.ErrorManager;
import fr.uga.pddl4j.planners.ProblemFactory;
import fr.uga.pddl4j.planners.Statistics;
import fr.uga.pddl4j.planners.statespace.AbstractStateSpacePlanner;
import fr.uga.pddl4j.planners.statespace.search.strategy.AStar;
import fr.uga.pddl4j.planners.statespace.search.strategy.AStarAnytime;
import fr.uga.pddl4j.planners.statespace.search.strategy.StateSpaceStrategy;
import fr.uga.pddl4j.util.BitOp;
import fr.uga.pddl4j.util.Plan;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

public class Planner extends AbstractStateSpacePlanner {

    private final String domain;
    private final ArrayList<String> problems;

    public Planner(String domain, ArrayList<String> problems) {
        super();
        this.domain = domain;
        this.problems = problems;
    }

    public ArrayList<String> readProblems() {
        ArrayList<String> alignments = new ArrayList<>();
        for (String problem : problems) {
            CodedProblem encodedProblem = readProblem(problem);
            if (encodedProblem != null && encodedProblem.isSolvable()) {
                Plan plan = search(encodedProblem);
                alignments.add(encodedProblem.toString(plan));
            } else{
                System.out.println("Problem not solvable");
            }
        }
        return alignments;
    }


    public CodedProblem readProblem(String problem)  {
        ProblemFactory factory = ProblemFactory.getInstance();
        ErrorManager errorManager = new ErrorManager();
        try {
            errorManager = factory.parseFromString(domain, problem);
            System.out.println("Parsing domain and problem completed");
            return factory.encode();
        } catch (IOException e) {
            errorManager.printAll();
            System.out.println(e.toString());
            return null;
        }
    }

    @Override
    public Plan search(CodedProblem encodedProblem) {
        StateSpaceStrategy ehc = new AStar(Integer.MAX_VALUE, Heuristic.Type.MAX, 0);
        return ehc.searchPlan(encodedProblem);
    }
}