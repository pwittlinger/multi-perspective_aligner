package utils;

import java.util.List;

import org.processmining.ltl2automaton.plugins.LTL2Automaton;
import org.processmining.ltl2automaton.plugins.automaton.Automaton;
import org.processmining.ltl2automaton.plugins.automaton.DeterministicAutomaton;
import org.processmining.ltl2automaton.plugins.formula.DefaultParser;
import org.processmining.plugins.declareminer.ExecutableAutomaton;

import de.invation.code.toval.graphic.mvc.AbstractModel;
import model.DeclareModel;

import translations.IOManager;

public class AutomatonUtils {

    private AutomatonUtils() {
		//Private constructor to avoid unnecessary instantiation of the class
	}

public static DeterministicAutomaton createMinimizedIntersection(List<DeterministicAutomaton> automata) {
		//TODO: Check if the automata library allows to intersect multiple automata in one operation

		DeterministicAutomaton automataIntersection = null;
		for (DeterministicAutomaton automaton : automata) {
			if (automataIntersection == null) {
				automataIntersection = automaton;
				//automataIntersection = automaton.op.determinize().op.complete();
			} else {
				//automaton = automaton.op.renumber();
				//automaton = automaton.op.determinize().op.complete();
				automataIntersection = automataIntersection.op.intersect(automaton).op.determinize().op.minimize();
				
			}
		}
		automataIntersection = automataIntersection.op.determinize().op.complete();
		//automataIntersection = automataIntersection.op.determinize().op.complete().op.renumber().op.minimize();
		return automataIntersection;
	}

	public static ExecutableAutomaton createGlobalAutomaton(List<DeterministicAutomaton> automata) {
		DeterministicAutomaton globalAutomaton = null;

		for (DeterministicAutomaton automaton : automata) {
			if (globalAutomaton == null) {
					globalAutomaton =  new DeterministicAutomaton(automaton, automaton.isCompleted());
				} else {
					globalAutomaton = globalAutomaton.op.intersect(automaton);
				}

		}
		
		return new ExecutableAutomaton(globalAutomaton);
	}
}
