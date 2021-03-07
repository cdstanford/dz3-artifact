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



(declare-fun I0_38 () Int)
(declare-fun I0_41 () Int)
(declare-fun I0_47 () Int)
(declare-fun I0_5 () Int)
(declare-fun I1_47 () Int)
(declare-fun I2_47 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun PCTEMP_LHS_3 () Int)
(declare-fun PCTEMP_LHS_4 () String)
(declare-fun PCTEMP_LHS_5 () Int)
(declare-fun T0_38 () String)
(declare-fun T0_41 () String)
(declare-fun T0_5 () String)
(declare-fun T1_38 () String)
(declare-fun T1_41 () String)
(declare-fun T1_47 () String)
(declare-fun T1_5 () String)
(declare-fun T2_38 () String)
(declare-fun T2_41 () String)
(declare-fun T2_47 () String)
(declare-fun T2_5 () String)
(declare-fun T3_38 () String)
(declare-fun T3_41 () String)
(declare-fun T3_47 () String)
(declare-fun T3_5 () String)
(declare-fun T4_38 () String)
(declare-fun T4_41 () String)
(declare-fun T4_5 () String)
(declare-fun T5_38 () String)
(declare-fun T5_41 () String)
(declare-fun T5_5 () String)
(declare-fun T_1 () Bool)
(declare-fun T_10 () Bool)
(declare-fun T_11 () String)
(declare-fun T_12 () Bool)
(declare-fun T_13 () Bool)
(declare-fun T_14 () String)
(declare-fun T_15 () Bool)
(declare-fun T_16 () String)
(declare-fun T_17 () Bool)
(declare-fun T_18 () String)
(declare-fun T_19 () Bool)
(declare-fun T_1a () String)
(declare-fun T_1b () Bool)
(declare-fun T_1c () String)
(declare-fun T_1d () Bool)
(declare-fun T_1e () String)
(declare-fun T_1f () Bool)
(declare-fun T_2 () Bool)
(declare-fun T_20 () Bool)
(declare-fun T_21 () Bool)
(declare-fun T_22 () Bool)
(declare-fun T_23 () Bool)
(declare-fun T_25 () Bool)
(declare-fun T_27 () Bool)
(declare-fun T_28 () Bool)
(declare-fun T_29 () Int)
(declare-fun T_2a () Int)
(declare-fun T_2d () Bool)
(declare-fun T_2e () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () String)
(declare-fun T_8 () Bool)
(declare-fun T_9 () String)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun T_SELECT_3 () Bool)
(declare-fun T_a () Bool)
(declare-fun T_b () String)
(declare-fun T_c () Bool)
(declare-fun T_d () String)
(declare-fun T_e () Bool)
(declare-fun T_f () String)
(declare-fun var_0xINPUT_14928 () String)
(assert (= T_1 (= "-" var_0xINPUT_14928)))
(assert (= T_2 (not T_1)))
(assert T_2)
(assert (= T_3 (= "" var_0xINPUT_14928)))
(assert T_3)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_5 0)) (= var_0xINPUT_14928 (str.++ T0_5 T1_5)) (= I0_5 (str.len T4_5)) (= 0 (str.len T0_5)) (= T1_5 (str.++ T2_5 T3_5)) (= T2_5 (str.++ T4_5 T5_5)) (= T5_5 "__utmz=16886264.") (not (str.in_re T4_5 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4") (str.to_re "."))))) (and (= PCTEMP_LHS_1 (- 1)) (= var_0xINPUT_14928 (str.++ T0_5 T1_5)) (= 0 (str.len T0_5)) (not (str.in_re T1_5 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4") (str.to_re ".")))))))
(assert (= T_5 (< (- 1) PCTEMP_LHS_1)))
(assert (= T_6 (not T_5)))
(assert T_6)
(assert (= T_8 (= "-" T_7)))
(assert T_8)
(assert (= T_a (= "-" T_9)))
(assert T_a)
(assert (= T_c (= "-" T_b)))
(assert T_c)
(assert (= T_e (= "-" T_d)))
(assert T_e)
(assert (= T_10 (= "-" T_f)))
(assert T_10)
(assert (= T_12 (= "-" T_11)))
(assert (= T_13 (not T_12)))
(assert T_13)
(assert (= T_15 (= "-" T_14)))
(assert T_15)
(assert (= T_17 (= "-" T_16)))
(assert T_17)
(assert (= T_19 (= "-" T_18)))
(assert T_19)
(assert (= T_1b (= "-" T_1a)))
(assert T_1b)
(assert (= T_1d (= "-" T_1c)))
(assert T_1d)
(assert (= T_1f (= "-" T_1e)))
(assert (= T_20 (not T_1f)))
(assert T_20)
(assert (= T_21 (= "-" var_0xINPUT_14928)))
(assert (= T_22 (not T_21)))
(assert T_22)
(assert (= T_23 (= "" var_0xINPUT_14928)))
(assert T_23)
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert (ite T_SELECT_2 (and (= PCTEMP_LHS_2 (+ I0_38 0)) (= var_0xINPUT_14928 (str.++ T0_38 T1_38)) (= I0_38 (str.len T4_38)) (= 0 (str.len T0_38)) (= T1_38 (str.++ T2_38 T3_38)) (= T2_38 (str.++ T4_38 T5_38)) (= T5_38 "__utma=16886264.") (not (str.in_re T4_38 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4") (str.to_re "."))))) (and (= PCTEMP_LHS_2 (- 1)) (= var_0xINPUT_14928 (str.++ T0_38 T1_38)) (= 0 (str.len T0_38)) (not (str.in_re T1_38 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4") (str.to_re ".")))))))
(assert (= T_25 (< (- 1) PCTEMP_LHS_2)))
(assert T_25)
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_3 (- 1)))))
(assert (ite T_SELECT_3 (and (= PCTEMP_LHS_3 (+ I0_41 PCTEMP_LHS_2)) (= var_0xINPUT_14928 (str.++ T0_41 T1_41)) (= I0_41 (str.len T4_41)) (= PCTEMP_LHS_2 (str.len T0_41)) (= T1_41 (str.++ T2_41 T3_41)) (= T2_41 (str.++ T4_41 T5_41)) (= T5_41 ";") (not (str.in_re T4_41 (str.to_re ";")))) (and (= PCTEMP_LHS_3 (- 1)) (= var_0xINPUT_14928 (str.++ T0_41 T1_41)) (= PCTEMP_LHS_2 (str.len T0_41)) (not (str.in_re T1_41 (str.to_re ";"))))))
(assert (= T_27 (< PCTEMP_LHS_3 0)))
(assert (= T_28 (not T_27)))
(assert T_28)
(assert (= T_29 (+ PCTEMP_LHS_2 6)))
(assert (= T_2a (+ T_29 1)))
(assert (= I0_47 (- PCTEMP_LHS_3 T_2a)))
(assert (>= T_2a 0))
(assert (>= PCTEMP_LHS_3 T_2a))
(assert (<= PCTEMP_LHS_3 I1_47))
(assert (= I2_47 I1_47))
(assert (= I0_47 (str.len PCTEMP_LHS_4)))
(assert (= var_0xINPUT_14928 (str.++ T1_47 T2_47)))
(assert (= T2_47 (str.++ PCTEMP_LHS_4 T3_47)))
(assert (= T_2a (str.len T1_47)))
(assert (= I1_47 (str.len var_0xINPUT_14928)))
(assert (= T_2d (< 9 PCTEMP_LHS_5)))
(assert (= T_2e (not T_2d)))
(assert T_2e)
(check-sat)

