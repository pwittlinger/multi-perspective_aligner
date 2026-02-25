import log.LogFile;
import model.DataPetriNet;
import model.DeclareModel;
import org.deckfour.xes.model.XTrace;
import org.processmining.datapetrinets.io.DPNIOException;
import org.processmining.ltl2automaton.plugins.LTL2Automaton;
import org.processmining.ltl2automaton.plugins.automaton.Automaton;
import org.processmining.ltl2automaton.plugins.formula.DefaultParser;
import org.processmining.ltl2automaton.plugins.ltl.SyntaxParserException;
import org.processmining.plugins.declareminer.ExecutableAutomaton;
import org.processmining.ltl2automaton.plugins.automaton.DeterministicAutomaton;
import org.processmining.ltl2automaton.plugins.automaton.DOTExporter;

import translations.DeclareToLTL;
import translations.IOManager;
import translations.PDDLGenerator;
import utils.AutomatonUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Scanner;

public class Runner {

    public static void main(String[] args) throws Exception {


       //findAlignments(args[0], args[1], args[2], args[3], args[4]);

       //readDataPetriNet();

       findAlignments(args[0], args[1], args[2], args[3], args[4], args[5]);

    }

    public static void findAlignments(String modelString,
            String traceString, 
            String variablesString, 
            String substitutionsString, 
            String costsString) throws Exception {
        IOManager ioManager = IOManager.getInstance();

        DeclareModel model = ioManager.readDeclareModel(modelString);
        model.assignCosts(ioManager.readCostModel(costsString));
        LogFile log = ioManager.readLog(traceString, model);
        //System.out.println(log);


        ioManager.exportModel(model);
        String ltlFormula = new DeclareToLTL(model).translateModelToLTL();

        if (!ltlFormula.isBlank()) {
            System.out.println(ltlFormula);
            PDDLGenerator pddlGenerator = new PDDLGenerator(model, ltlFormula);
            String domain = pddlGenerator.defineDomain();
            IOManager.getInstance().exportDomainPDDL(domain);
            ArrayList<String> problems = log.defineProblems(pddlGenerator);
            int i = 1;
            for (String problem : problems) {
                IOManager.getInstance().exportProblemPDDL(problem, i);
                i++;
            }
            /* 
            Planner planner = new Planner(domain, problems);
            
            ArrayList<String> alignments = planner.readProblems();
            log.repairTraces(alignments, model.getActivities());

            IOManager.getInstance().exportLog(log);
            */
        }
    }

    public static void findAlignments(String modelString,
            String traceString, 
            String variablesString, 
            String substitutionsString, 
            String costsString,
            String petriNetName) throws Exception {

        ArrayList<DeterministicAutomaton> allAutomata = new ArrayList<DeterministicAutomaton>();

        System.out.println( "THIS IS GETTING EXECUTED");


        IOManager ioManager = IOManager.getInstance();

        DeclareModel model = ioManager.readDeclareModel(modelString);
        model.assignCosts(ioManager.readCostModel(costsString));
        LogFile log = ioManager.readLog(traceString, model);
        //System.out.println(log);

        DataPetriNet dpn = new DataPetriNet(petriNetName, model);

        

           
        //System.out.println(dpn.createAutomatonVisualizationString(dpn.getAutomaton(), false));
            
        
            


        ioManager.exportModel(model);
        String ltlFormula = new DeclareToLTL(model).translateModelToLTL();

        if (!ltlFormula.isBlank()) {
            Automaton declAutomaton = LTL2Automaton.getInstance().translate(new DefaultParser(ltlFormula).parse());

            allAutomata.add(dpn.getAutomaton());
            allAutomata.add(declAutomaton.op.determinize());

            DeterministicAutomaton globalAutomaton = AutomatonUtils.createMinimizedIntersection(allAutomata);

           // ExecutableAutomaton globAut = AutomatonUtils.createGlobalAutomaton(allAutomata);

            ioManager.exportToDot(globalAutomaton);

            System.out.println(ltlFormula);
            PDDLGenerator pddlGenerator = new PDDLGenerator(model, ltlFormula);

            pddlGenerator.setAutomaton(globalAutomaton);
            String domain = pddlGenerator.defineDomain();
            IOManager.getInstance().exportDomainPDDL(domain);
            ArrayList<String> problems = log.defineProblems(pddlGenerator);
            int i = 1;
            for (String problem : problems) {
                IOManager.getInstance().exportProblemPDDL(problem, i);
                i++;
            }
            /* 
            Planner planner = new Planner(domain, problems);
            
            ArrayList<String> alignments = planner.readProblems();
            log.repairTraces(alignments, model.getActivities());

            IOManager.getInstance().exportLog(log);
            
           */
        }
        
    }


    public static void readDataPetriNet() throws SyntaxParserException, Exception {
        String path = "C:\\Users\\paulw\\OneDrive - Scientific Network South Tyrol\\trace-alignment\\petrinet\\a29g9AND.pnml";
        DataPetriNet dpn = null;

        IOManager ioManager = IOManager.getInstance();
        String modelString = "a29g9AND_7_parsed.decl";

        DeclareModel model = ioManager.readDeclareModel(modelString);

        String ltlFormula = new DeclareToLTL(model).translateModelToLTL();


        try {
            dpn = new DataPetriNet(path, model);

            Automaton declAutomaton = LTL2Automaton.getInstance().translate(new DefaultParser(ltlFormula).parse());


            ArrayList<DeterministicAutomaton> allAutomata = new ArrayList<DeterministicAutomaton>();

            allAutomata.add(dpn.getAutomaton());
            //allAutomata.add(declAutomaton.op.determinize());

            DeterministicAutomaton globalAutomaton = AutomatonUtils.createMinimizedIntersection(allAutomata);

            ioManager.exportToDot(globalAutomaton);

        
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (DPNIOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}




/* - Extras
    public static void modifyLog(int length) {
        StringBuilder newLog = new StringBuilder();

        File log = new File(inputFolder + "length_"+ length +".xes");
        try (Scanner scanner = new Scanner(log)) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                if (line.contains("activity ")) {
                    String[] tokens = line.split("activity ");
                    newLog.append(tokens[0]).append("activity").append(tokens[1]).append("\n");
                } else {
                    newLog.append(line).append("\n");
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error reading the cost model");
        }

        String result = newLog.toString();
        result = result.replaceAll("activity17", "activity7");
        result = result.replaceAll("activity16", "activity6");
        result = result.replaceAll("activity15", "activity5");
        result = result.replaceAll("activity14", "activity4");
        result = result.replaceAll("activity13", "activity3");
        result = result.replaceAll("activity12", "activity2");
        result = result.replaceAll("activity11", "activity1");

        try (FileWriter fileWriter = new FileWriter(outputFolder + "length_" + length + ".xes")) {
            fileWriter.write(result);
        } catch (IOException e) {
            System.out.println("Error creating the model file");
        }
    }

    private static void createLog() {
        StringBuilder builder = new StringBuilder();
        builder.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n" +
                "<!-- This file has been generated with the OpenXES library. It conforms -->\n" +
                "<!-- to the XML serialization of the XES standard for log storage and -->\n" +
                "<!-- management. -->\n" +
                "<!-- XES standard version: 1.0 -->\n" +
                "<!-- OpenXES library version: 1.0RC7 -->\n" +
                "<!-- OpenXES is available from http://www.openxes.org/ -->\n" +
                "<log xes.version=\"1.0\" xes.features=\"nested-attributes\" openxes.version=\"1.0RC7\">\n" +
                "\t<extension name=\"Organizational\" prefix=\"org\" uri=\"http://www.xes-standard.org/org.xesext\"/>\n" +
                "\t<extension name=\"Time\" prefix=\"time\" uri=\"http://www.xes-standard.org/time.xesext\"/>\n" +
                "\t<extension name=\"Lifecycle\" prefix=\"lifecycle\" uri=\"http://www.xes-standard.org/lifecycle.xesext\"/>\n" +
                "\t<extension name=\"Semantic\" prefix=\"semantic\" uri=\"http://www.xes-standard.org/semantic.xesext\"/>\n" +
                "\t<extension name=\"Concept\" prefix=\"concept\" uri=\"http://www.xes-standard.org/concept.xesext\"/>\n" +
                "\t<string key=\"concept:name\" value=\"MyLog\"/>\n" +
                "\t<string key=\"lifecycle:model\" value=\"standard\"/>\n");
        builder.append("\t<trace>\n");
        builder.append("\t\t<string key=\"concept:name\" value=\"Test\"/>\n");
        for (int i = 0; i < 100; i++) {
            String activityName = getActivityName();
            builder.append(getActivityByName(activityName));
        }
        builder.append("\t</trace>\n");
        builder.append("</log>");
        //System.out.println(builder.toString());
        try (FileWriter fileWriter = new FileWriter("test100log.xes")) {
            fileWriter.write(builder.toString());
        } catch (IOException e) {
            System.out.println("Error creating the logg file");
        }
    }

    private static  String getActivityByName(String activityName) {
        StringBuilder builder = new StringBuilder("\t\t<event>\n");
        builder.append("\t\t\t<string key=\"concept:name\" value=\"").append(activityName).append("\"/>\n");
        if (activityName.equals("a")) {
            int randAx = (int) (Math.random() * 1050);
            int randAy = (int) (Math.random() * 1050);
            builder.append("\t\t\t<string key=\"ax\" value=\"").append(randAx).append("\"/>\n");
            builder.append("\t\t\t<string key=\"ay\" value=\"").append(randAy).append("\"/>\n");
        } else if (activityName.equals("b")) {
            double randBs = (Math.random() * 510.75) + -510.25;
            double randBt = (Math.random() * 510) + -510.25;
            builder.append("\t\t\t<string key=\"bs\" value=\"").append(randBs).append("\"/>\n");
            builder.append("\t\t\t<string key=\"bt\" value=\"").append(randBt).append("\"/>\n");
        } else if (activityName.equals("c")) {
            String[] names = new String[]{"axel", "susi", "csaba", "empty"};
            String[] surs = new String[]{"mezini", "loddi", "toth"};
            int randNam = (int) (Math.random() * 4);
            int randSur = (int) (Math.random() * 3);
            builder.append("\t\t\t<string key=\"name\" value=\"").append(names[randNam]).append("\"/>\n");
            builder.append("\t\t\t<string key=\"surname\" value=\"").append(surs[randSur]).append("\"/>\n");
        } else if (activityName.equals("d")) {
            String[] bool = new String[]{"true", "false", "maybe"};
            int gradRand = (int) (Math.random() * 10);
            int boolRand = (int) (Math.random() * 3);
            builder.append("\t\t\t<string key=\"grade\" value=\"").append(gradRand).append("\"/>\n");
            builder.append("\t\t\t<string key=\"boolean\" value=\"").append(bool[boolRand]).append("\"/>\n");
        }
        return builder.append("\t\t</event>\n").toString();
    }

    private static String getActivityName() {
        String[] names = new String[]{"a", "b", "c", "d", "e"};
        int rand = (int) (Math.random() * 5) ;
        return names[rand];
    }
 */
