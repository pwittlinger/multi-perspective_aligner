package translations;

import log.LogFile;
import model.DeclareModel;
import org.deckfour.xes.in.XesXmlParser;
import org.deckfour.xes.model.XLog;
import org.processmining.ltl2automaton.plugins.automaton.Automaton;
import org.processmining.ltl2automaton.plugins.automaton.DOTExporter;
import org.processmining.ltl2automaton.plugins.automaton.DeterministicAutomaton;
import org.processmining.plugins.declareminer.ExecutableAutomaton;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IOManager {

    private static IOManager ioManager;
    private final String resourcesFolder = "src" + File.separator + "main" + File.separator + "resources" + File.separator;
    private final String inputFolder = resourcesFolder + "input" + File.separator;
    private final String outputFolder = resourcesFolder + "output" + File.separator;
    private final String pddlFolder = outputFolder + "pddl" + File.separator;
    //private String alignmentFolder = outputFolder + "alignments" + File.separator;

    private IOManager() {}

    public static IOManager getInstance() {
        if (ioManager == null) {
            ioManager = new IOManager();
        }
        return ioManager;
    }

    //Section: Reading declare model
    public DeclareModel readDeclareModel(String modelFileName) {
        File declareFile = new File(inputFolder + modelFileName);
        HashMap<String, ArrayList<String[]>> parsedLines = readFile(declareFile);
        return new DeclareModel(parsedLines);
    }

    private HashMap<String, ArrayList<String[]>> readFile(File declareFile) {
        HashMap<String, ArrayList<String[]>> lines = initializeSortingMap();
        Pattern[] declarePatterns = getCompiledPatterns();
        try (Scanner scanner = new Scanner(declareFile)) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                addToMap(line, lines, declarePatterns);
            }
        } catch (IOException e) {
            System.out.println("Error reading the declare file");
        }
        return lines;
    }

    private HashMap<String, ArrayList<String[]>> initializeSortingMap() {
        HashMap<String, ArrayList<String[]>> lines = new HashMap<>();
        String[] lineDefinitions = {"activityLines", "bindingLines", "intAttributeLines", "floatAttributeLines", "enumAttributeLines", "unaryConstraintLines", "binaryConstraintLines"};
        for (String container : lineDefinitions) {
            lines.put(container, new ArrayList<>());
        }
        return lines;
    }

    private Pattern[] getCompiledPatterns() {
        Pattern activityPattern = Pattern.compile("^\\s*activity\\s+([a-zA-Z]+[a-zA-Z\\d]*)\\s*$");
        Pattern bindingPattern = Pattern.compile("^\\s*bind\\s+([a-zA-Z]+[a-zA-Z\\d]*(,\\s+[a-zA-Z]+[a-zA-Z\\d]*)*)\\s*:\\s+([a-zA-Z]+[a-zA-Z\\d]*(,\\s+[a-zA-Z]+[a-zA-Z\\d]*)*)\\s*$");
        
        Pattern intPattern = Pattern.compile("^\\s*([a-zA-Z]+[a-zA-Z\\d]*(,\\s+[a-zA-Z]+[a-zA-Z\\d]*)*)\\s*:\\s+integer\\s+between\\s+(-?\\d+)\\s+and\\s+(-?\\d+)\\s*$");
        Pattern floatPattern = Pattern.compile("^\\s*([a-zA-Z]+[a-zA-Z\\d]*(,\\s+[a-zA-Z]+[a-zA-Z\\d]*)*)\\s*:\\s+float\\s+between\\s+(-?\\d+\\.?\\d*)\\s+and\\s+(-?\\d+\\.?\\d*)\\s*$");
        Pattern enumPattern = Pattern.compile("^\\s*([a-zA-Z]+[a-zA-Z\\d]*(,\\s+[a-zA-Z]+[a-zA-Z\\d]*)*)\\s*:\\s+([a-zA-Z]+[a-zA-Z\\d]*(,\\s+[a-zA-Z]+[a-zA-Z\\d]*)*)\\s*$");
        
        Pattern unaryPattern = Pattern.compile("^([A-Za-z\\d]+)\\[([a-zA-Z]+[a-zA-Z\\d]*)]\\s+\\|\\s*([Aa-z\\d!=(),.<> -]*)\\|\\s*$");
        //Pattern binaryPattern = Pattern.compile("^([A-Za-z\\d -]+)\\[([a-zA-Z]+[a-zA-Z\\d]*),\\s*([a-zA-Z]+[a-zA-Z\\d]*)]\\s+\\|\\s*([Aa-zA-Z\\d!=(),.<> -]*)\\|\\s*([Ta-zA-Z\\d!=(),.<> -]*)\\|\\s*$");
        Pattern binaryPattern = Pattern.compile("^([A-Za-z\\d -]+)\\[([a-zA-Z]+[a-zA-Z\\d]*),\\s*([a-zA-Z]+[a-zA-Z\\d]*)]\\s+\\|\\s*([Aa-zA-Z\\d!=(),.<> -]*)\\|\\s*([Ta-zA-Z\\d!=(),.<> -]*)\\|\\s*$");
        
        Pattern numericConditionPattern = Pattern.compile("^\\s*[atAT].[a-zA-Z]+[a-zA-Z\\d]*\\s+(>=|<=|>|<|=|!=)\\s+-?\\d+.?\\d*\\s*$");
        Pattern enumConditionPattern = Pattern.compile("^\\s*[atAT].[a-zA-Z]+[a-zA-Z\\d]*\\s+(is not|is)\\s+[a-zA-Z]+[a-zA-Z\\d]*\\s*$*");
        Pattern listConditionPattern = Pattern.compile("^\\s*[atAT].[a-zA-Z]+[a-zA-Z\\d]*\\s+(not in|in)\\s+[a-zA-Z]+[a-zA-Z\\d]*(,\\s+[a-zA-Z]+[a-zA-Z\\d]*)*\\s*$");
        /*
        Pattern activityPattern = Pattern.compile("^\\s*activity\\s+([a-z]+[a-z\\d]*)\\s*$");
        Pattern bindingPattern = Pattern.compile("^\\s*bind\\s+([a-z]+[a-z\\d]*(,\\s+[a-z]+[a-z\\d]*)*)\\s*:\\s+([a-z]+[a-z\\d]*(,\\s+[a-z]+[a-z\\d]*)*)\\s*$");

        Pattern intPattern = Pattern.compile("^\\s*([a-z]+[a-z\\d]*(,\\s+[a-z]+[a-z\\d]*)*)\\s*:\\s+integer\\s+between\\s+(-?\\d+)\\s+and\\s+(-?\\d+)\\s*$");
        Pattern floatPattern = Pattern.compile("^\\s*([a-z]+[a-z\\d]*(,\\s+[a-z]+[a-z\\d]*)*)\\s*:\\s+float\\s+between\\s+(-?\\d+\\.?\\d*)\\s+and\\s+(-?\\d+\\.?\\d*)\\s*$");
        Pattern enumPattern = Pattern.compile("^\\s*([a-z]+[a-z\\d]*(,\\s+[a-z]+[a-z\\d]*)*)\\s*:\\s+([a-z]+[a-z\\d]*(,\\s+[a-z]+[a-z\\d]*)*)\\s*$");

        Pattern unaryPattern = Pattern.compile("^([A-Za-z\\d]+)\\[([a-z]+[a-z\\d]*)]\\s+\\|\\s*([Aa-z\\d!=(),.<> -]*)\\|\\s*$");
        Pattern binaryPattern = Pattern.compile("^([A-Za-z\\d -]+)\\[([a-z]+[a-z\\d]*),\\s*([a-z]+[a-z\\d]*)]\\s+\\|\\s*([Aa-z\\d!=(),.<> -]*)\\|\\s*([Ta-z\\d!=(),.<> -]*)\\|\\s*$");

        Pattern numericConditionPattern = Pattern.compile("^\\s*[atAT].[a-z]+[a-z\\d]*\\s+(>=|<=|>|<|=|!=)\\s+-?\\d+.?\\d*\\s*$");
        Pattern enumConditionPattern = Pattern.compile("^\\s*[atAT].[a-z]+[a-z\\d]*\\s+(is not|is)\\s+[a-z]+[a-z\\d]*\\s*$*");
        Pattern listConditionPattern = Pattern.compile("^\\s*[atAT].[a-z]+[a-z\\d]*\\s+(not in|in)\\s+[a-z]+[a-z\\d]*(,\\s+[a-z]+[a-z\\d]*)*\\s*$");
        */
        return new Pattern[] {activityPattern, bindingPattern, intPattern, floatPattern, enumPattern, unaryPattern, binaryPattern,
                numericConditionPattern, enumConditionPattern, listConditionPattern};
    }


    //Section: Lines validation and addition
    private void addToMap(String line, HashMap<String, ArrayList<String[]>> lines, Pattern[] patterns) {
        Matcher activityMatcher = patterns[0].matcher(line);
        Matcher bindingMatcher = patterns[1].matcher(line);
        Matcher intMatcher = patterns[2].matcher(line);
        Matcher floatMatcher = patterns[3].matcher(line);
        Matcher enumMatcher = patterns[4].matcher(line);
        Matcher unaryMatcher = patterns[5].matcher(line);
        Matcher binaryMatcher = patterns[6].matcher(line);

        if (activityMatcher.find()) {
            lines.get("activityLines").add(new String[] {activityMatcher.group(1)});
        } else if (bindingMatcher.find()) {
            lines.get("bindingLines").add(tokenizeBinding(bindingMatcher));
        } else if (enumMatcher.find()) {
            lines.get("enumAttributeLines").add(tokenizeEnumAttribute(enumMatcher));
        } else if (floatMatcher.find()) {
            lines.get("floatAttributeLines").add(tokenizeNumericAttribute(floatMatcher));
        } else if (intMatcher.find()) {
            lines.get("intAttributeLines").add(tokenizeNumericAttribute(intMatcher));
        } else if (binaryMatcher.find()) {
            if (isConditionValid(binaryMatcher.group(4), patterns) && isConditionValid(binaryMatcher.group(5), patterns)) {
                lines.get("binaryConstraintLines").add(tokenizeBinaryConstraint(binaryMatcher));
            } else {
                System.out.println("Error parsing condition: " + binaryMatcher.group(4) + " or " + binaryMatcher.group(5));
            }
        } else if (unaryMatcher.find()) {
            if (isConditionValid(unaryMatcher.group(3), patterns)) {
                lines.get("unaryConstraintLines").add(tokenizeUnaryConstraint(unaryMatcher));
            } else {
                System.out.println("Error parsing condition: " + unaryMatcher.group(3));
            }
        } else {
            System.out.println("Error parsing line: " + line);
        }
    }


    //Section: Tokenization of valid lines
    private String[] tokenizeBinding(Matcher matcher) {
        return new String[] {matcher.group(1), matcher.group(3)};
    }

    private String[] tokenizeEnumAttribute(Matcher matcher) {
        return new String[] {matcher.group(1), matcher.group(3)};
    }

    private String[] tokenizeNumericAttribute(Matcher matcher) {
        return new String[] {matcher.group(1), matcher.group(3), matcher.group(4)};
    }

    private String[] tokenizeUnaryConstraint(Matcher matcher) {
        return new String[] {matcher.group(1), matcher.group(2), matcher.group(3)};
    }

    private String[] tokenizeBinaryConstraint(Matcher matcher) {
        return new String[] {matcher.group(1), matcher.group(2), matcher.group(3), matcher.group(4), matcher.group(5)};
    }


    //Section: Condition syntax validation
    private boolean isConditionValid(String condition, Pattern[] patterns) {
        if (condition != null && !condition.isBlank()) {
            String conditionToCheck = condition.replaceAll("[)(]", "");
            String[] singleConditions = conditionToCheck.split(" and | or | AND | OR ");
            for (String subCondition : singleConditions) {
                if (!isSubConditionValid(subCondition, patterns)) {
                    return false;
                }
            }
            return true;
        }
        return true;
    }

    private boolean isSubConditionValid(String condition, Pattern[] patterns) {
        Matcher numericMatcher = patterns[7].matcher(condition);
        Matcher enumMatcher = patterns[8].matcher(condition);
        Matcher listMatcher = patterns[9].matcher(condition);
        return numericMatcher.find() || enumMatcher.find() || listMatcher.find();
    }















    //Section: Exporting model
    public void exportModel(DeclareModel model) {
        try (FileWriter fileWriter = new FileWriter(outputFolder + "model.txt")) {
            fileWriter.write(model.toString());
        } catch (IOException e) {
            System.out.println("Error creating the model file");
        }
    }


    //Section: Reading log file
    public LogFile readLog(String logFileName, DeclareModel model) {
        File logFile = new File(inputFolder + logFileName);
        XLog xlog = null;
        XesXmlParser parser = new XesXmlParser();
        if (parser.canParse(logFile)) {
            try {
                xlog = parser.parse(logFile).get(0);
            } catch (Exception e) {
                System.out.println("Error reading the log file");
            }
        }
        return new LogFile(xlog, model);
    }


    //Section: Exporting log file
    public void exportLog(LogFile log) {
        try (FileWriter fileWriter = new FileWriter(outputFolder + "log.txt")) {
            fileWriter.write(log.toString());
        } catch (IOException e) {
            System.out.println("Error creating the model file");
        }
    }


    //Section: Exporting PDDL files
    public void exportProblemPDDL(String pddlContent, int traceNr) {
        try (FileWriter fileWriter = new FileWriter(pddlFolder + "problem" + traceNr + ".pddl")) {
            fileWriter.write(pddlContent);
        } catch (IOException e) {
            System.out.println("Error creating the problem pddl");
        }
    }

    public void exportDomainPDDL(String pddlContent) {
        try (FileWriter fileWriter = new FileWriter(pddlFolder + "domain.pddl")) {
            fileWriter.write(pddlContent);
        } catch (IOException e) {
            System.out.println("Error creating the domain pddl");
        }
    }


    //Section: Reading cost model
    public Map<String, int[]> readCostModel(String costsFileName) {
        File costModel = new File(inputFolder + costsFileName);
        Map<String, int[]> costs = new HashMap<>();
        try (Scanner scanner = new Scanner(costModel)) {
            while (scanner.hasNextLine()) {
                String[] costsLine = readCostsLine(scanner.nextLine());
                if (costsLine != null) {
                    costs.put(costsLine[0], parseCosts(costsLine));
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading the cost model");
        }
        return costs;
    }

    private String[] readCostsLine(String line) {
        Matcher matcher = Pattern.compile("^\\s*([a-zA-Z]+[a-zA-Z\\d]*)+\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s+(\\d+)\\s*$").matcher(line);
        if (matcher.find()) {
            String[] costs = new String[6];
            for (int i = 0; i < 6; i++) {
                costs[i] = matcher.group(i + 1);
            }
            return costs;
        }
        return null;
    }

    private int[] parseCosts(String[] costStrings) {
        int[] costsValues = new int[5];
        for (int i = 0; i < 5; i++) {
            costsValues[i] = Integer.parseInt(costStrings[i + 1]);
        }
        return costsValues;
    }

    public void exportEquivalenceClasses(HashMap<String, ArrayList<String>> classes) {
        StringBuilder builder = new StringBuilder();
        for (Map.Entry<String, ArrayList<String>> eqClass : classes.entrySet()) {
            builder.append(eqClass.getKey()).append(" ");
            for (String classPart : eqClass.getValue()) {
                builder.append(classPart).append(" ");
            }
            builder.append("\n");
        }

        try (FileWriter fileWriter = new FileWriter(outputFolder + "equivalenceClasses.txt")) {
            fileWriter.write(builder.toString());
        } catch (IOException e) {
            System.out.println("Error creating the model file");
        }
    }

    public void exportToDot(Automaton automaton) throws IOException {
        DOTExporter.exportToDot(automaton, "MyAutomata", new FileWriter(outputFolder + File.separator + "automaton.dot"));
    }

    public void exportToDot(DeterministicAutomaton automaton) throws IOException {
        DOTExporter.exportToDot(automaton, "MyAutomata", new FileWriter(outputFolder + File.separator + "automaton.dot"));
    }
}