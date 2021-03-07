(set-info :smt-lib-version 2.6)
(set-logic QF_SLIA)
(set-info :source |
Generated by: Andrew Reynolds
Generated on: 2018-04-25
Generator: Kudzu, converted to v2.6 by CVC4
Application: Symbolic Execution of Javascript
Target solver: Kaluza
Publications: "A symbolic execution framework for JavaScript" by P. Saxena, D. Akhawe, S. Hanna, F. Mao, S. McCamant, and D. Song, 2010.
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)



(declare-fun I0_11 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun T0_11 () String)
(declare-fun T1_10 () String)
(declare-fun T1_11 () String)
(declare-fun T1_17 () String)
(declare-fun T1_21 () String)
(declare-fun T1_4 () String)
(declare-fun T1_7 () String)
(declare-fun T2_10 () String)
(declare-fun T2_11 () String)
(declare-fun T2_17 () String)
(declare-fun T2_21 () String)
(declare-fun T2_4 () String)
(declare-fun T2_7 () String)
(declare-fun T3_11 () String)
(declare-fun T4_11 () String)
(declare-fun T5_11 () String)
(declare-fun T_1 () String)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () String)
(declare-fun T_5 () Bool)
(declare-fun T_6 () String)
(declare-fun T_8 () Bool)
(declare-fun T_9 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_a () String)
(declare-fun T_b () Bool)
(declare-fun T_c () Bool)
(declare-fun T_d () String)
(declare-fun T_e () Bool)
(declare-fun T_f () Bool)
(declare-fun var_0xINPUT_101104 () String)
(assert (= T_1 (str.++ T1_4 T2_4)))
(assert (= T2_4 var_0xINPUT_101104))
(assert (= T1_4 ""))
(assert (= T_2 (= "-" T_1)))
(assert (= T_3 (not T_2)))
(assert T_3)
(assert (= T_4 (str.++ T1_7 T2_7)))
(assert (= T2_7 var_0xINPUT_101104))
(assert (= T1_7 ""))
(assert (= T_5 (= "" T_4)))
(assert T_5)
(assert (= T_6 (str.++ T1_10 T2_10)))
(assert (= T2_10 var_0xINPUT_101104))
(assert (= T1_10 ""))
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_11 0)) (= T_6 (str.++ T0_11 T1_11)) (= I0_11 (str.len T4_11)) (= 0 (str.len T0_11)) (= T1_11 (str.++ T2_11 T3_11)) (= T2_11 (str.++ T4_11 T5_11)) (= T5_11 "utm_id=") (not (str.in_re T4_11 (re.++ (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "_") (str.to_re "i") (str.to_re "d") (str.to_re "="))))) (and (= PCTEMP_LHS_1 (- 1)) (= T_6 (str.++ T0_11 T1_11)) (= 0 (str.len T0_11)) (not (str.in_re T1_11 (re.++ (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "_") (str.to_re "i") (str.to_re "d") (str.to_re "=")))))))
(assert (= T_8 (< (- 1) PCTEMP_LHS_1)))
(assert (= T_9 (not T_8)))
(assert T_9)
(assert (= T_a (str.++ T1_17 T2_17)))
(assert (= T2_17 var_0xINPUT_101104))
(assert (= T1_17 ""))
(assert (= T_b (= "-" T_a)))
(assert (= T_c (not T_b)))
(assert T_c)
(assert (= T_d (str.++ T1_21 T2_21)))
(assert (= T2_21 var_0xINPUT_101104))
(assert (= T1_21 ""))
(assert (= T_e (= "" T_d)))
(assert (= T_f (not T_e)))
(assert T_f)
(check-sat)

