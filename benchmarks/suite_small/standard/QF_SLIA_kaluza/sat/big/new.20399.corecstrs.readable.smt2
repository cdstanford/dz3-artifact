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



(declare-fun I0_12 () Int)
(declare-fun I0_2 () Int)
(declare-fun I0_6 () Int)
(declare-fun I1_12 () Int)
(declare-fun I2_12 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun PCTEMP_LHS_3 () String)
(declare-fun T0_2 () String)
(declare-fun T0_6 () String)
(declare-fun T1_12 () String)
(declare-fun T1_2 () String)
(declare-fun T1_6 () String)
(declare-fun T2_12 () String)
(declare-fun T2_2 () String)
(declare-fun T2_6 () String)
(declare-fun T3_12 () String)
(declare-fun T3_2 () String)
(declare-fun T3_6 () String)
(declare-fun T4_2 () String)
(declare-fun T4_6 () String)
(declare-fun T5_2 () String)
(declare-fun T5_6 () String)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Int)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Int)
(declare-fun T_7 () Int)
(declare-fun T_9 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun T_a () Bool)
(declare-fun var_0xINPUT_15284 () String)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_2 0)) (= var_0xINPUT_15284 (str.++ T0_2 T1_2)) (= I0_2 (str.len T4_2)) (= 0 (str.len T0_2)) (= T1_2 (str.++ T2_2 T3_2)) (= T2_2 (str.++ T4_2 T5_2)) (= T5_2 "GoogleAdServingTest=") (not (str.in_re T4_2 (re.++ (str.to_re "G") (str.to_re "o") (str.to_re "o") (str.to_re "g") (str.to_re "l") (str.to_re "e") (str.to_re "A") (str.to_re "d") (str.to_re "S") (str.to_re "e") (str.to_re "r") (str.to_re "v") (str.to_re "i") (str.to_re "n") (str.to_re "g") (str.to_re "T") (str.to_re "e") (str.to_re "s") (str.to_re "t") (str.to_re "="))))) (and (= PCTEMP_LHS_1 (- 1)) (= var_0xINPUT_15284 (str.++ T0_2 T1_2)) (= 0 (str.len T0_2)) (not (str.in_re T1_2 (re.++ (str.to_re "G") (str.to_re "o") (str.to_re "o") (str.to_re "g") (str.to_re "l") (str.to_re "e") (str.to_re "A") (str.to_re "d") (str.to_re "S") (str.to_re "e") (str.to_re "r") (str.to_re "v") (str.to_re "i") (str.to_re "n") (str.to_re "g") (str.to_re "T") (str.to_re "e") (str.to_re "s") (str.to_re "t") (str.to_re "=")))))))
(assert (= T_2 (not (= PCTEMP_LHS_1 (- 1)))))
(assert T_2)
(assert (= T_3 (+ PCTEMP_LHS_1 20)))
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert (ite T_SELECT_2 (and (= PCTEMP_LHS_2 (+ I0_6 T_3)) (= var_0xINPUT_15284 (str.++ T0_6 T1_6)) (= I0_6 (str.len T4_6)) (= T_3 (str.len T0_6)) (= T1_6 (str.++ T2_6 T3_6)) (= T2_6 (str.++ T4_6 T5_6)) (= T5_6 ";") (not (str.in_re T4_6 (str.to_re ";")))) (and (= PCTEMP_LHS_2 (- 1)) (= var_0xINPUT_15284 (str.++ T0_6 T1_6)) (= T_3 (str.len T0_6)) (not (str.in_re T1_6 (str.to_re ";"))))))
(assert (= T_5 (= PCTEMP_LHS_2 (- 1))))
(assert T_5)
(assert (= T_6 (+ PCTEMP_LHS_1 20)))
(assert (= T_7 (str.len var_0xINPUT_15284)))
(assert (= I0_12 (- T_7 T_6)))
(assert (>= T_6 0))
(assert (>= T_7 T_6))
(assert (<= T_7 I1_12))
(assert (= I2_12 I1_12))
(assert (= I0_12 (str.len PCTEMP_LHS_3)))
(assert (= var_0xINPUT_15284 (str.++ T1_12 T2_12)))
(assert (= T2_12 (str.++ PCTEMP_LHS_3 T3_12)))
(assert (= T_6 (str.len T1_12)))
(assert (= I1_12 (str.len var_0xINPUT_15284)))
(assert (= T_9 (= PCTEMP_LHS_3 "Good")))
(assert T_9)
(assert (= T_a (= PCTEMP_LHS_3 "Good")))
(assert T_a)
(check-sat)

