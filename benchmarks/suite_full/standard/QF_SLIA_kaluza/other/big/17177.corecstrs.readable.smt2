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



(declare-fun I0_10 () Int)
(declare-fun I0_13 () Int)
(declare-fun I0_2 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun PCTEMP_LHS_3 () Int)
(declare-fun T0_10 () String)
(declare-fun T0_13 () String)
(declare-fun T0_2 () String)
(declare-fun T1_10 () String)
(declare-fun T1_13 () String)
(declare-fun T1_2 () String)
(declare-fun T2_10 () String)
(declare-fun T2_13 () String)
(declare-fun T2_2 () String)
(declare-fun T3_10 () String)
(declare-fun T3_13 () String)
(declare-fun T3_2 () String)
(declare-fun T4_10 () String)
(declare-fun T4_13 () String)
(declare-fun T4_2 () String)
(declare-fun T5_10 () String)
(declare-fun T5_13 () String)
(declare-fun T5_2 () String)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () Bool)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () Bool)
(declare-fun T_9 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun T_SELECT_3 () Bool)
(declare-fun T_b () Bool)
(declare-fun var_0xINPUT_36716 () String)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_2 0)) (= var_0xINPUT_36716 (str.++ T0_2 T1_2)) (= I0_2 (str.len T4_2)) (= 0 (str.len T0_2)) (= T1_2 (str.++ T2_2 T3_2)) (= T2_2 (str.++ T4_2 T5_2)) (= T5_2 "__utmz=218069774.") (not (str.in_re T4_2 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "2") (str.to_re "1") (str.to_re "8") (str.to_re "0") (str.to_re "6") (str.to_re "9") (str.to_re "7") (str.to_re "7") (str.to_re "4") (str.to_re "."))))) (and (= PCTEMP_LHS_1 (- 1)) (= var_0xINPUT_36716 (str.++ T0_2 T1_2)) (= 0 (str.len T0_2)) (not (str.in_re T1_2 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "2") (str.to_re "1") (str.to_re "8") (str.to_re "0") (str.to_re "6") (str.to_re "9") (str.to_re "7") (str.to_re "7") (str.to_re "4") (str.to_re ".")))))))
(assert (= T_2 (< (- 1) PCTEMP_LHS_1)))
(assert (= T_3 (not T_2)))
(assert T_3)
(assert (= T_4 (= "" var_0xINPUT_36716)))
(assert (= T_5 (not T_4)))
(assert T_5)
(assert (= T_6 (= var_0xINPUT_36716 "")))
(assert (= T_7 (not T_6)))
(assert T_7)
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert (ite T_SELECT_2 (and (= PCTEMP_LHS_2 (+ I0_10 0)) (= var_0xINPUT_36716 (str.++ T0_10 T1_10)) (= I0_10 (str.len T4_10)) (= 0 (str.len T0_10)) (= T1_10 (str.++ T2_10 T3_10)) (= T2_10 (str.++ T4_10 T5_10)) (= T5_10 "__utma=218069774.") (not (str.in_re T4_10 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "2") (str.to_re "1") (str.to_re "8") (str.to_re "0") (str.to_re "6") (str.to_re "9") (str.to_re "7") (str.to_re "7") (str.to_re "4") (str.to_re "."))))) (and (= PCTEMP_LHS_2 (- 1)) (= var_0xINPUT_36716 (str.++ T0_10 T1_10)) (= 0 (str.len T0_10)) (not (str.in_re T1_10 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "2") (str.to_re "1") (str.to_re "8") (str.to_re "0") (str.to_re "6") (str.to_re "9") (str.to_re "7") (str.to_re "7") (str.to_re "4") (str.to_re ".")))))))
(assert (= T_9 (< (- 1) PCTEMP_LHS_2)))
(assert T_9)
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_3 (- 1)))))
(assert (ite T_SELECT_3 (and (= PCTEMP_LHS_3 (+ I0_13 PCTEMP_LHS_2)) (= var_0xINPUT_36716 (str.++ T0_13 T1_13)) (= I0_13 (str.len T4_13)) (= PCTEMP_LHS_2 (str.len T0_13)) (= T1_13 (str.++ T2_13 T3_13)) (= T2_13 (str.++ T4_13 T5_13)) (= T5_13 ";") (not (str.in_re T4_13 (str.to_re ";")))) (and (= PCTEMP_LHS_3 (- 1)) (= var_0xINPUT_36716 (str.++ T0_13 T1_13)) (= PCTEMP_LHS_2 (str.len T0_13)) (not (str.in_re T1_13 (str.to_re ";"))))))
(assert (= T_b (< PCTEMP_LHS_3 0)))
(assert T_b)
(check-sat)

