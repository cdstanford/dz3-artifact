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



(declare-fun I0_2 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun T0_2 () String)
(declare-fun T1_2 () String)
(declare-fun T2_2 () String)
(declare-fun T3_2 () String)
(declare-fun T4_2 () String)
(declare-fun T5_2 () String)
(declare-fun T_2 () Int)
(declare-fun T_3 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun var_0xINPUT_72254 () String)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_2 0)) (= var_0xINPUT_72254 (str.++ T0_2 T1_2)) (= I0_2 (str.len T4_2)) (= 0 (str.len T0_2)) (= T1_2 (str.++ T2_2 T3_2)) (= T2_2 (str.++ T4_2 T5_2)) (= T5_2 "debug=alert") (not (str.in_re T4_2 (re.++ (str.to_re "d") (str.to_re "e") (str.to_re "b") (str.to_re "u") (str.to_re "g") (str.to_re "=") (str.to_re "a") (str.to_re "l") (str.to_re "e") (str.to_re "r") (str.to_re "t"))))) (and (= PCTEMP_LHS_1 (- 1)) (= var_0xINPUT_72254 (str.++ T0_2 T1_2)) (= 0 (str.len T0_2)) (not (str.in_re T1_2 (re.++ (str.to_re "d") (str.to_re "e") (str.to_re "b") (str.to_re "u") (str.to_re "g") (str.to_re "=") (str.to_re "a") (str.to_re "l") (str.to_re "e") (str.to_re "r") (str.to_re "t")))))))
(assert (= T_2 (+ PCTEMP_LHS_1 1)))
(assert (= T_3 (not (= 0 T_2))))
(assert T_3)
(check-sat)

