(define (domain Mining)
	(:requirements :typing :equality :action-costs :conditional-effects)
	(:types
		state activity - object
		trace_state automaton_state - state
		ActivityC_activity ActivityD_activity ActivityE_activity ActivityF_activity ActivityA_activity ActivityB_activity ActivityK_activity ActivityL_activity ActivityN_activity ActivityI_activity ActivityJ_activity ActivityS_activity ActivityT_activity ActivityU_activity ActivityAA_activity ActivityV_activity ActivityO_activity ActivityP_activity ActivityQ_activity ActivityR_activity n61_activity n41_activity ActivityW_activity n64_activity ActivityX_activity n45_activity n67_activity ActivityY_activity ActivityZ_activity n66_activity ActivityAF_activity ActivityAC_activity ActivityAB_activity ActivityAE_activity ActivityAD_activity - activity
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

	(:action add_ActivityC_activity
		:parameters (?s1 - automaton_state ?e - ActivityC_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityC_activity
		:parameters (?t1 - trace_state ?e - ActivityC_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
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
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityD_activity
		:parameters (?t1 - trace_state ?e - ActivityD_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
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

	(:action add_ActivityE_activity
		:parameters (?s1 - automaton_state ?e - ActivityE_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityE_activity
		:parameters (?t1 - trace_state ?e - ActivityE_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityE_activity
		:parameters (?t1 - trace_state ?e1 - ActivityE_activity ?e2 - ActivityE_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityE_missing
		:parameters (?t1 - trace_state ?e1 - ActivityE_activity ?e2 - ActivityE_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityE_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityE_activity ?e2 - ActivityE_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityF_activity
		:parameters (?s1 - automaton_state ?e - ActivityF_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityF_activity
		:parameters (?t1 - trace_state ?e - ActivityF_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
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
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityA_activity
		:parameters (?t1 - trace_state ?e - ActivityA_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
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

	(:action add_ActivityB_activity
		:parameters (?s1 - automaton_state ?e - ActivityB_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityB_activity
		:parameters (?t1 - trace_state ?e - ActivityB_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityB_activity
		:parameters (?t1 - trace_state ?e1 - ActivityB_activity ?e2 - ActivityB_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityB_missing
		:parameters (?t1 - trace_state ?e1 - ActivityB_activity ?e2 - ActivityB_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityB_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityB_activity ?e2 - ActivityB_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityK_activity
		:parameters (?s1 - automaton_state ?e - ActivityK_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityK_activity
		:parameters (?t1 - trace_state ?e - ActivityK_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityK_activity
		:parameters (?t1 - trace_state ?e1 - ActivityK_activity ?e2 - ActivityK_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityK_missing
		:parameters (?t1 - trace_state ?e1 - ActivityK_activity ?e2 - ActivityK_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityK_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityK_activity ?e2 - ActivityK_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityL_activity
		:parameters (?s1 - automaton_state ?e - ActivityL_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityL_activity
		:parameters (?t1 - trace_state ?e - ActivityL_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityL_activity
		:parameters (?t1 - trace_state ?e1 - ActivityL_activity ?e2 - ActivityL_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityL_missing
		:parameters (?t1 - trace_state ?e1 - ActivityL_activity ?e2 - ActivityL_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityL_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityL_activity ?e2 - ActivityL_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityN_activity
		:parameters (?s1 - automaton_state ?e - ActivityN_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityN_activity
		:parameters (?t1 - trace_state ?e - ActivityN_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
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

	(:action add_ActivityI_activity
		:parameters (?s1 - automaton_state ?e - ActivityI_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityI_activity
		:parameters (?t1 - trace_state ?e - ActivityI_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityI_activity
		:parameters (?t1 - trace_state ?e1 - ActivityI_activity ?e2 - ActivityI_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityI_missing
		:parameters (?t1 - trace_state ?e1 - ActivityI_activity ?e2 - ActivityI_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityI_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityI_activity ?e2 - ActivityI_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityJ_activity
		:parameters (?s1 - automaton_state ?e - ActivityJ_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityJ_activity
		:parameters (?t1 - trace_state ?e - ActivityJ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
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

	(:action add_ActivityS_activity
		:parameters (?s1 - automaton_state ?e - ActivityS_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityS_activity
		:parameters (?t1 - trace_state ?e - ActivityS_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityS_activity
		:parameters (?t1 - trace_state ?e1 - ActivityS_activity ?e2 - ActivityS_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityS_missing
		:parameters (?t1 - trace_state ?e1 - ActivityS_activity ?e2 - ActivityS_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityS_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityS_activity ?e2 - ActivityS_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityT_activity
		:parameters (?s1 - automaton_state ?e - ActivityT_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityT_activity
		:parameters (?t1 - trace_state ?e - ActivityT_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityT_activity
		:parameters (?t1 - trace_state ?e1 - ActivityT_activity ?e2 - ActivityT_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityT_missing
		:parameters (?t1 - trace_state ?e1 - ActivityT_activity ?e2 - ActivityT_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityT_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityT_activity ?e2 - ActivityT_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityU_activity
		:parameters (?s1 - automaton_state ?e - ActivityU_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityU_activity
		:parameters (?t1 - trace_state ?e - ActivityU_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityU_activity
		:parameters (?t1 - trace_state ?e1 - ActivityU_activity ?e2 - ActivityU_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityU_missing
		:parameters (?t1 - trace_state ?e1 - ActivityU_activity ?e2 - ActivityU_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityU_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityU_activity ?e2 - ActivityU_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityAA_activity
		:parameters (?s1 - automaton_state ?e - ActivityAA_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityAA_activity
		:parameters (?t1 - trace_state ?e - ActivityAA_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityAA_activity
		:parameters (?t1 - trace_state ?e1 - ActivityAA_activity ?e2 - ActivityAA_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityAA_missing
		:parameters (?t1 - trace_state ?e1 - ActivityAA_activity ?e2 - ActivityAA_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityAA_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityAA_activity ?e2 - ActivityAA_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityV_activity
		:parameters (?s1 - automaton_state ?e - ActivityV_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityV_activity
		:parameters (?t1 - trace_state ?e - ActivityV_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityV_activity
		:parameters (?t1 - trace_state ?e1 - ActivityV_activity ?e2 - ActivityV_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityV_missing
		:parameters (?t1 - trace_state ?e1 - ActivityV_activity ?e2 - ActivityV_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityV_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityV_activity ?e2 - ActivityV_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityO_activity
		:parameters (?s1 - automaton_state ?e - ActivityO_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityO_activity
		:parameters (?t1 - trace_state ?e - ActivityO_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
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
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityP_activity
		:parameters (?t1 - trace_state ?e - ActivityP_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
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
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityQ_activity
		:parameters (?t1 - trace_state ?e - ActivityQ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
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

	(:action add_ActivityR_activity
		:parameters (?s1 - automaton_state ?e - ActivityR_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityR_activity
		:parameters (?t1 - trace_state ?e - ActivityR_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityR_activity
		:parameters (?t1 - trace_state ?e1 - ActivityR_activity ?e2 - ActivityR_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityR_missing
		:parameters (?t1 - trace_state ?e1 - ActivityR_activity ?e2 - ActivityR_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityR_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityR_activity ?e2 - ActivityR_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_n61_activity
		:parameters (?s1 - automaton_state ?e - n61_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_n61_activity
		:parameters (?t1 - trace_state ?e - n61_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_n61_activity
		:parameters (?t1 - trace_state ?e1 - n61_activity ?e2 - n61_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_n61_missing
		:parameters (?t1 - trace_state ?e1 - n61_activity ?e2 - n61_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_n61_wrong
		:parameters (?t1 - trace_state ?e1 - n61_activity ?e2 - n61_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_n41_activity
		:parameters (?s1 - automaton_state ?e - n41_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_n41_activity
		:parameters (?t1 - trace_state ?e - n41_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_n41_activity
		:parameters (?t1 - trace_state ?e1 - n41_activity ?e2 - n41_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_n41_missing
		:parameters (?t1 - trace_state ?e1 - n41_activity ?e2 - n41_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_n41_wrong
		:parameters (?t1 - trace_state ?e1 - n41_activity ?e2 - n41_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityW_activity
		:parameters (?s1 - automaton_state ?e - ActivityW_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityW_activity
		:parameters (?t1 - trace_state ?e - ActivityW_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityW_activity
		:parameters (?t1 - trace_state ?e1 - ActivityW_activity ?e2 - ActivityW_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityW_missing
		:parameters (?t1 - trace_state ?e1 - ActivityW_activity ?e2 - ActivityW_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityW_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityW_activity ?e2 - ActivityW_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_n64_activity
		:parameters (?s1 - automaton_state ?e - n64_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_n64_activity
		:parameters (?t1 - trace_state ?e - n64_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_n64_activity
		:parameters (?t1 - trace_state ?e1 - n64_activity ?e2 - n64_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_n64_missing
		:parameters (?t1 - trace_state ?e1 - n64_activity ?e2 - n64_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_n64_wrong
		:parameters (?t1 - trace_state ?e1 - n64_activity ?e2 - n64_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityX_activity
		:parameters (?s1 - automaton_state ?e - ActivityX_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityX_activity
		:parameters (?t1 - trace_state ?e - ActivityX_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityX_activity
		:parameters (?t1 - trace_state ?e1 - ActivityX_activity ?e2 - ActivityX_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityX_missing
		:parameters (?t1 - trace_state ?e1 - ActivityX_activity ?e2 - ActivityX_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityX_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityX_activity ?e2 - ActivityX_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_n45_activity
		:parameters (?s1 - automaton_state ?e - n45_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_n45_activity
		:parameters (?t1 - trace_state ?e - n45_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_n45_activity
		:parameters (?t1 - trace_state ?e1 - n45_activity ?e2 - n45_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_n45_missing
		:parameters (?t1 - trace_state ?e1 - n45_activity ?e2 - n45_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_n45_wrong
		:parameters (?t1 - trace_state ?e1 - n45_activity ?e2 - n45_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_n67_activity
		:parameters (?s1 - automaton_state ?e - n67_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_n67_activity
		:parameters (?t1 - trace_state ?e - n67_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_n67_activity
		:parameters (?t1 - trace_state ?e1 - n67_activity ?e2 - n67_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_n67_missing
		:parameters (?t1 - trace_state ?e1 - n67_activity ?e2 - n67_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_n67_wrong
		:parameters (?t1 - trace_state ?e1 - n67_activity ?e2 - n67_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityY_activity
		:parameters (?s1 - automaton_state ?e - ActivityY_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityY_activity
		:parameters (?t1 - trace_state ?e - ActivityY_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityY_activity
		:parameters (?t1 - trace_state ?e1 - ActivityY_activity ?e2 - ActivityY_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityY_missing
		:parameters (?t1 - trace_state ?e1 - ActivityY_activity ?e2 - ActivityY_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityY_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityY_activity ?e2 - ActivityY_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityZ_activity
		:parameters (?s1 - automaton_state ?e - ActivityZ_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityZ_activity
		:parameters (?t1 - trace_state ?e - ActivityZ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityZ_activity
		:parameters (?t1 - trace_state ?e1 - ActivityZ_activity ?e2 - ActivityZ_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityZ_missing
		:parameters (?t1 - trace_state ?e1 - ActivityZ_activity ?e2 - ActivityZ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityZ_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityZ_activity ?e2 - ActivityZ_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_n66_activity
		:parameters (?s1 - automaton_state ?e - n66_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_n66_activity
		:parameters (?t1 - trace_state ?e - n66_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_n66_activity
		:parameters (?t1 - trace_state ?e1 - n66_activity ?e2 - n66_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_n66_missing
		:parameters (?t1 - trace_state ?e1 - n66_activity ?e2 - n66_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_n66_wrong
		:parameters (?t1 - trace_state ?e1 - n66_activity ?e2 - n66_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityAF_activity
		:parameters (?s1 - automaton_state ?e - ActivityAF_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityAF_activity
		:parameters (?t1 - trace_state ?e - ActivityAF_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityAF_activity
		:parameters (?t1 - trace_state ?e1 - ActivityAF_activity ?e2 - ActivityAF_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityAF_missing
		:parameters (?t1 - trace_state ?e1 - ActivityAF_activity ?e2 - ActivityAF_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityAF_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityAF_activity ?e2 - ActivityAF_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityAC_activity
		:parameters (?s1 - automaton_state ?e - ActivityAC_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityAC_activity
		:parameters (?t1 - trace_state ?e - ActivityAC_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityAC_activity
		:parameters (?t1 - trace_state ?e1 - ActivityAC_activity ?e2 - ActivityAC_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityAC_missing
		:parameters (?t1 - trace_state ?e1 - ActivityAC_activity ?e2 - ActivityAC_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityAC_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityAC_activity ?e2 - ActivityAC_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityAB_activity
		:parameters (?s1 - automaton_state ?e - ActivityAB_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityAB_activity
		:parameters (?t1 - trace_state ?e - ActivityAB_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityAB_activity
		:parameters (?t1 - trace_state ?e1 - ActivityAB_activity ?e2 - ActivityAB_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityAB_missing
		:parameters (?t1 - trace_state ?e1 - ActivityAB_activity ?e2 - ActivityAB_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityAB_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityAB_activity ?e2 - ActivityAB_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityAE_activity
		:parameters (?s1 - automaton_state ?e - ActivityAE_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityAE_activity
		:parameters (?t1 - trace_state ?e - ActivityAE_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityAE_activity
		:parameters (?t1 - trace_state ?e1 - ActivityAE_activity ?e2 - ActivityAE_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityAE_missing
		:parameters (?t1 - trace_state ?e1 - ActivityAE_activity ?e2 - ActivityAE_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityAE_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityAE_activity ?e2 - ActivityAE_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_ActivityAD_activity
		:parameters (?s1 - automaton_state ?e - ActivityAD_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_ActivityAD_activity
		:parameters (?t1 - trace_state ?e - ActivityAD_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 2) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_ActivityAD_activity
		:parameters (?t1 - trace_state ?e1 - ActivityAD_activity ?e2 - ActivityAD_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_ActivityAD_missing
		:parameters (?t1 - trace_state ?e1 - ActivityAD_activity ?e2 - ActivityAD_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_ActivityAD_wrong
		:parameters (?t1 - trace_state ?e1 - ActivityAD_activity ?e2 - ActivityAD_activity ?t2 - trace_state)
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