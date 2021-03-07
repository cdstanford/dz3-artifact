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
(declare-fun I0_4 () Int)
(declare-fun I0_6 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun PCTEMP_LHS_3 () Int)
(declare-fun T0_2 () String)
(declare-fun T0_4 () String)
(declare-fun T0_6 () String)
(declare-fun T1_2 () String)
(declare-fun T1_4 () String)
(declare-fun T1_6 () String)
(declare-fun T2_2 () String)
(declare-fun T2_4 () String)
(declare-fun T2_6 () String)
(declare-fun T3_2 () String)
(declare-fun T3_4 () String)
(declare-fun T3_6 () String)
(declare-fun T4_2 () String)
(declare-fun T4_4 () String)
(declare-fun T4_6 () String)
(declare-fun T5_2 () String)
(declare-fun T5_4 () String)
(declare-fun T5_6 () String)
(declare-fun T_4 () Bool)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () Bool)
(declare-fun T_8 () Bool)
(declare-fun T_9 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun T_SELECT_3 () Bool)
(declare-fun var_0xINPUT_107651 () String)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_2 0)) (= var_0xINPUT_107651 (str.++ T0_2 T1_2)) (= I0_2 (str.len T4_2)) (= 0 (str.len T0_2)) (= T1_2 (str.++ T2_2 T3_2)) (= T2_2 (str.++ T4_2 T5_2)) (= T5_2 "__utma=16886264.") (not (str.in_re T4_2 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4") (str.to_re "."))))) (and (= PCTEMP_LHS_1 (- 1)) (= var_0xINPUT_107651 (str.++ T0_2 T1_2)) (= 0 (str.len T0_2)) (not (str.in_re T1_2 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4") (str.to_re ".")))))))
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert (ite T_SELECT_2 (and (= PCTEMP_LHS_2 (+ I0_4 0)) (= var_0xINPUT_107651 (str.++ T0_4 T1_4)) (= I0_4 (str.len T4_4)) (= 0 (str.len T0_4)) (= T1_4 (str.++ T2_4 T3_4)) (= T2_4 (str.++ T4_4 T5_4)) (= T5_4 "__utmb=16886264") (not (str.in_re T4_4 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "b") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4"))))) (and (= PCTEMP_LHS_2 (- 1)) (= var_0xINPUT_107651 (str.++ T0_4 T1_4)) (= 0 (str.len T0_4)) (not (str.in_re T1_4 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "b") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4")))))))
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_3 (- 1)))))
(assert (ite T_SELECT_3 (and (= PCTEMP_LHS_3 (+ I0_6 0)) (= var_0xINPUT_107651 (str.++ T0_6 T1_6)) (= I0_6 (str.len T4_6)) (= 0 (str.len T0_6)) (= T1_6 (str.++ T2_6 T3_6)) (= T2_6 (str.++ T4_6 T5_6)) (= T5_6 "__utmc=16886264") (not (str.in_re T4_6 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "c") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4"))))) (and (= PCTEMP_LHS_3 (- 1)) (= var_0xINPUT_107651 (str.++ T0_6 T1_6)) (= 0 (str.len T0_6)) (not (str.in_re T1_6 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "c") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4")))))))
(assert (= T_4 (= "-" var_0xINPUT_107651)))
(assert (= T_5 (not T_4)))
(assert T_5)
(assert (= T_6 (= "" var_0xINPUT_107651)))
(assert (= T_7 (not T_6)))
(assert T_7)
(assert (= T_8 (< (- 1) PCTEMP_LHS_1)))
(assert (= T_9 (not T_8)))
(assert T_9)
(check-sat)

