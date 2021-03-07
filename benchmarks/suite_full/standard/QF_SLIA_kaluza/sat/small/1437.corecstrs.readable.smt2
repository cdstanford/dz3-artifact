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
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun T0_12 () String)
(declare-fun T1_11 () String)
(declare-fun T1_12 () String)
(declare-fun T1_4 () String)
(declare-fun T1_8 () String)
(declare-fun T2_11 () String)
(declare-fun T2_12 () String)
(declare-fun T2_4 () String)
(declare-fun T2_8 () String)
(declare-fun T3_12 () String)
(declare-fun T4_12 () String)
(declare-fun T5_12 () String)
(declare-fun T_1 () String)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () String)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () String)
(declare-fun T_9 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun var_0xINPUT_16071 () String)
(assert (= T_1 (str.++ T1_4 T2_4)))
(assert (= T2_4 var_0xINPUT_16071))
(assert (= T1_4 ""))
(assert (= T_2 (= "" T_1)))
(assert (= T_3 (not T_2)))
(assert T_3)
(assert (= T_4 (str.++ T1_8 T2_8)))
(assert (= T2_8 var_0xINPUT_16071))
(assert (= T1_8 ""))
(assert (= T_5 (= T_4 "")))
(assert (= T_6 (not T_5)))
(assert T_6)
(assert (= T_7 (str.++ T1_11 T2_11)))
(assert (= T2_11 var_0xINPUT_16071))
(assert (= T1_11 ""))
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_12 0)) (= T_7 (str.++ T0_12 T1_12)) (= I0_12 (str.len T4_12)) (= 0 (str.len T0_12)) (= T1_12 (str.++ T2_12 T3_12)) (= T2_12 (str.++ T4_12 T5_12)) (= T5_12 "utm_id=") (not (str.in_re T4_12 (re.++ (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "_") (str.to_re "i") (str.to_re "d") (str.to_re "="))))) (and (= PCTEMP_LHS_1 (- 1)) (= T_7 (str.++ T0_12 T1_12)) (= 0 (str.len T0_12)) (not (str.in_re T1_12 (re.++ (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "_") (str.to_re "i") (str.to_re "d") (str.to_re "=")))))))
(assert (= T_9 (< (- 1) PCTEMP_LHS_1)))
(assert T_9)
(check-sat)

