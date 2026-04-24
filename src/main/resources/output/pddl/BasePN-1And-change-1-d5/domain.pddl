(define (domain Mining)
	(:requirements :typing :equality :action-costs :conditional-effects)
	(:types
		state activity - object
		trace_state automaton_state - state
		ActivityO_activity ActivityP_activity ActivityQ_activity ActivityC_activity ActivityD_activity ActivityF_activity ActivityA_activity ActivityM_activity ActivityN_activity ActivityEl_activity ActivityG_activity ActivityH_activity ActivityJ_activity - activity
	)

	(:predicates
		(trace ?t1 - trace_state ?e - activity ?t2 - trace_state)
		(automaton ?s1 - automaton_state ?e - activity ?s2 - automaton_state)
		(atoms ?e1 - activity ?e2 - activity)
		(missing ?e1 - activity ?e2 - activity)
		(wrong ?e1 - activity ?e2 - activity)
		(valid ?e1 - activity)
		(cur_state ?s - state)
		(final_state ?s - state)
	)

	(:functions
		(total-cost) - number
	)

	(:action add_ActivityO_activity
		:parameters (?s1 - automaton_state ?e - ActivityO_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityO_activity
		:parameters (?t1 - trace_state ?e - ActivityO_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityO_activity
		:parameters (?t1 - trace_state ?e1 - ActivityO_activity ?e2 - ActivityO_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityO_missing
		:parameters (?t1 - trace_state ?e1 - ActivityO_activity ?e2 - ActivityO_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityO_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityO_activity ?e2 - ActivityO_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityP_activity
		:parameters (?s1 - automaton_state ?e - ActivityP_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityP_activity
		:parameters (?t1 - trace_state ?e - ActivityP_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityP_activity
		:parameters (?t1 - trace_state ?e1 - ActivityP_activity ?e2 - ActivityP_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityP_missing
		:parameters (?t1 - trace_state ?e1 - ActivityP_activity ?e2 - ActivityP_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityP_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityP_activity ?e2 - ActivityP_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityQ_activity
		:parameters (?s1 - automaton_state ?e - ActivityQ_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityQ_activity
		:parameters (?t1 - trace_state ?e - ActivityQ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityQ_activity
		:parameters (?t1 - trace_state ?e1 - ActivityQ_activity ?e2 - ActivityQ_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityQ_missing
		:parameters (?t1 - trace_state ?e1 - ActivityQ_activity ?e2 - ActivityQ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityQ_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityQ_activity ?e2 - ActivityQ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityC_activity
		:parameters (?s1 - automaton_state ?e - ActivityC_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityC_activity
		:parameters (?t1 - trace_state ?e - ActivityC_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityC_activity
		:parameters (?t1 - trace_state ?e1 - ActivityC_activity ?e2 - ActivityC_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityC_missing
		:parameters (?t1 - trace_state ?e1 - ActivityC_activity ?e2 - ActivityC_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityC_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityC_activity ?e2 - ActivityC_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityD_activity
		:parameters (?s1 - automaton_state ?e - ActivityD_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityD_activity
		:parameters (?t1 - trace_state ?e - ActivityD_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityD_activity
		:parameters (?t1 - trace_state ?e1 - ActivityD_activity ?e2 - ActivityD_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityD_missing
		:parameters (?t1 - trace_state ?e1 - ActivityD_activity ?e2 - ActivityD_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityD_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityD_activity ?e2 - ActivityD_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityF_activity
		:parameters (?s1 - automaton_state ?e - ActivityF_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityF_activity
		:parameters (?t1 - trace_state ?e - ActivityF_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityF_activity
		:parameters (?t1 - trace_state ?e1 - ActivityF_activity ?e2 - ActivityF_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityF_missing
		:parameters (?t1 - trace_state ?e1 - ActivityF_activity ?e2 - ActivityF_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityF_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityF_activity ?e2 - ActivityF_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityA_activity
		:parameters (?s1 - automaton_state ?e - ActivityA_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityA_activity
		:parameters (?t1 - trace_state ?e - ActivityA_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityA_activity
		:parameters (?t1 - trace_state ?e1 - ActivityA_activity ?e2 - ActivityA_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityA_missing
		:parameters (?t1 - trace_state ?e1 - ActivityA_activity ?e2 - ActivityA_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityA_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityA_activity ?e2 - ActivityA_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityM_activity
		:parameters (?s1 - automaton_state ?e - ActivityM_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityM_activity
		:parameters (?t1 - trace_state ?e - ActivityM_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityM_activity
		:parameters (?t1 - trace_state ?e1 - ActivityM_activity ?e2 - ActivityM_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityM_missing
		:parameters (?t1 - trace_state ?e1 - ActivityM_activity ?e2 - ActivityM_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityM_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityM_activity ?e2 - ActivityM_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityN_activity
		:parameters (?s1 - automaton_state ?e - ActivityN_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityN_activity
		:parameters (?t1 - trace_state ?e - ActivityN_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityN_activity
		:parameters (?t1 - trace_state ?e1 - ActivityN_activity ?e2 - ActivityN_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityN_missing
		:parameters (?t1 - trace_state ?e1 - ActivityN_activity ?e2 - ActivityN_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityN_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityN_activity ?e2 - ActivityN_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityEl_activity
		:parameters (?s1 - automaton_state ?e - ActivityEl_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityEl_activity
		:parameters (?t1 - trace_state ?e - ActivityEl_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityEl_activity
		:parameters (?t1 - trace_state ?e1 - ActivityEl_activity ?e2 - ActivityEl_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityEl_missing
		:parameters (?t1 - trace_state ?e1 - ActivityEl_activity ?e2 - ActivityEl_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityEl_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityEl_activity ?e2 - ActivityEl_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityG_activity
		:parameters (?s1 - automaton_state ?e - ActivityG_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityG_activity
		:parameters (?t1 - trace_state ?e - ActivityG_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityG_activity
		:parameters (?t1 - trace_state ?e1 - ActivityG_activity ?e2 - ActivityG_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityG_missing
		:parameters (?t1 - trace_state ?e1 - ActivityG_activity ?e2 - ActivityG_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityG_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityG_activity ?e2 - ActivityG_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityH_activity
		:parameters (?s1 - automaton_state ?e - ActivityH_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityH_activity
		:parameters (?t1 - trace_state ?e - ActivityH_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityH_activity
		:parameters (?t1 - trace_state ?e1 - ActivityH_activity ?e2 - ActivityH_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityH_missing
		:parameters (?t1 - trace_state ?e1 - ActivityH_activity ?e2 - ActivityH_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityH_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityH_activity ?e2 - ActivityH_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityJ_activity
		:parameters (?s1 - automaton_state ?e - ActivityJ_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityJ_activity
		:parameters (?t1 - trace_state ?e - ActivityJ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityJ_activity
		:parameters (?t1 - trace_state ?e1 - ActivityJ_activity ?e2 - ActivityJ_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityJ_missing
		:parameters (?t1 - trace_state ?e1 - ActivityJ_activity ?e2 - ActivityJ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityJ_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityJ_activity ?e2 - ActivityJ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action sync
		:parameters (?t1 - trace_state ?e - activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2) (valid ?e))
		:effect (and (increase (total-cost) 0) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action goto
		:parameters (?s1 - automaton_state ?s2 - automaton_state ?t1 - trace_state)
		:precondition (and (final_state ?s1) (cur_state ?s1) (final_state ?t1) (cur_state ?t1))
		:effect (and (increase (total-cost) 0) (not (cur_state ?s1)) (cur_state ?s2))
	)
)