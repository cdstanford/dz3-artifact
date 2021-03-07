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



(declare-fun I0_13 () Int)
(declare-fun I0_6 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun T0_13 () String)
(declare-fun T0_6 () String)
(declare-fun T1_13 () String)
(declare-fun T1_6 () String)
(declare-fun T2_13 () String)
(declare-fun T2_6 () String)
(declare-fun T3_13 () String)
(declare-fun T3_6 () String)
(declare-fun T4_13 () String)
(declare-fun T4_6 () String)
(declare-fun T5_13 () String)
(declare-fun T5_6 () String)
(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () Bool)
(declare-fun T_8 () Bool)
(declare-fun T_9 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun T_a () Bool)
(declare-fun T_c () Bool)
(declare-fun T_d () Bool)
(declare-fun T_e () Bool)
(declare-fun var_0xINPUT_27511 () String)
(assert (= T_1 (not (= "" var_0xINPUT_27511))))
(assert T_1)
(assert (= T_2 (= "-" var_0xINPUT_27511)))
(assert (= T_3 (not T_2)))
(assert T_3)
(assert (= T_4 (= "" var_0xINPUT_27511)))
(assert T_4)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_6 0)) (= var_0xINPUT_27511 (str.++ T0_6 T1_6)) (= I0_6 (str.len T4_6)) (= 0 (str.len T0_6)) (= T1_6 (str.++ T2_6 T3_6)) (= T2_6 (str.++ T4_6 T5_6)) (= T5_6 "__utma=16886264.") (not (str.in_re T4_6 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4") (str.to_re "."))))) (and (= PCTEMP_LHS_1 (- 1)) (= var_0xINPUT_27511 (str.++ T0_6 T1_6)) (= 0 (str.len T0_6)) (not (str.in_re T1_6 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4") (str.to_re ".")))))))
(assert (= T_6 (< (- 1) PCTEMP_LHS_1)))
(assert (= T_7 (not T_6)))
(assert T_7)
(assert (= T_8 (= "-" var_0xINPUT_27511)))
(assert (= T_9 (not T_8)))
(assert T_9)
(assert (= T_a (= "" var_0xINPUT_27511)))
(assert T_a)
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert (ite T_SELECT_2 (and (= PCTEMP_LHS_2 (+ I0_13 0)) (= var_0xINPUT_27511 (str.++ T0_13 T1_13)) (= I0_13 (str.len T4_13)) (= 0 (str.len T0_13)) (= T1_13 (str.++ T2_13 T3_13)) (= T2_13 (str.++ T4_13 T5_13)) (= T5_13 "__utmb=16886264") (not (str.in_re T4_13 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "b") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4"))))) (and (= PCTEMP_LHS_2 (- 1)) (= var_0xINPUT_27511 (str.++ T0_13 T1_13)) (= 0 (str.len T0_13)) (not (str.in_re T1_13 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "b") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4")))))))
(assert (= T_c (< (- 1) PCTEMP_LHS_2)))
(assert (= T_d (not T_c)))
(assert T_d)
(assert (= T_e (= "-" var_0xINPUT_27511)))
(assert T_e)
(check-sat)

