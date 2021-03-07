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



(declare-fun I0_14 () Int)
(declare-fun I0_5 () Int)
(declare-fun I0_8 () Int)
(declare-fun I1_14 () Int)
(declare-fun I2_14 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun PCTEMP_LHS_3 () String)
(declare-fun T0_5 () String)
(declare-fun T0_8 () String)
(declare-fun T1_14 () String)
(declare-fun T1_5 () String)
(declare-fun T1_8 () String)
(declare-fun T2_14 () String)
(declare-fun T2_5 () String)
(declare-fun T2_8 () String)
(declare-fun T3_14 () String)
(declare-fun T3_5 () String)
(declare-fun T3_8 () String)
(declare-fun T4_5 () String)
(declare-fun T4_8 () String)
(declare-fun T5_5 () String)
(declare-fun T5_8 () String)
(declare-fun T_1 () Bool)
(declare-fun T_10 () String)
(declare-fun T_11 () Bool)
(declare-fun T_12 () String)
(declare-fun T_13 () Bool)
(declare-fun T_14 () String)
(declare-fun T_15 () Bool)
(declare-fun T_16 () String)
(declare-fun T_17 () Bool)
(declare-fun T_18 () Bool)
(declare-fun T_19 () String)
(declare-fun T_1a () Bool)
(declare-fun T_1b () String)
(declare-fun T_1c () Bool)
(declare-fun T_1d () String)
(declare-fun T_1e () Bool)
(declare-fun T_1f () String)
(declare-fun T_2 () Bool)
(declare-fun T_20 () Bool)
(declare-fun T_21 () String)
(declare-fun T_22 () Bool)
(declare-fun T_23 () String)
(declare-fun T_24 () Bool)
(declare-fun T_25 () Bool)
(declare-fun T_26 () Bool)
(declare-fun T_27 () Bool)
(declare-fun T_28 () Bool)
(declare-fun T_29 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_5 () Bool)
(declare-fun T_7 () Bool)
(declare-fun T_8 () Bool)
(declare-fun T_9 () Int)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun T_a () Int)
(declare-fun T_c () String)
(declare-fun T_d () Bool)
(declare-fun T_e () String)
(declare-fun T_f () Bool)
(declare-fun var_0xINPUT_100818 () String)
(assert (= T_1 (= "-" var_0xINPUT_100818)))
(assert (= T_2 (not T_1)))
(assert T_2)
(assert (= T_3 (= "" var_0xINPUT_100818)))
(assert T_3)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_5 0)) (= var_0xINPUT_100818 (str.++ T0_5 T1_5)) (= I0_5 (str.len T4_5)) (= 0 (str.len T0_5)) (= T1_5 (str.++ T2_5 T3_5)) (= T2_5 (str.++ T4_5 T5_5)) (= T5_5 "__utmz=16886264.") (not (str.in_re T4_5 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4") (str.to_re "."))))) (and (= PCTEMP_LHS_1 (- 1)) (= var_0xINPUT_100818 (str.++ T0_5 T1_5)) (= 0 (str.len T0_5)) (not (str.in_re T1_5 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "8") (str.to_re "8") (str.to_re "6") (str.to_re "2") (str.to_re "6") (str.to_re "4") (str.to_re ".")))))))
(assert (= T_5 (< (- 1) PCTEMP_LHS_1)))
(assert T_5)
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert (ite T_SELECT_2 (and (= PCTEMP_LHS_2 (+ I0_8 PCTEMP_LHS_1)) (= var_0xINPUT_100818 (str.++ T0_8 T1_8)) (= I0_8 (str.len T4_8)) (= PCTEMP_LHS_1 (str.len T0_8)) (= T1_8 (str.++ T2_8 T3_8)) (= T2_8 (str.++ T4_8 T5_8)) (= T5_8 ";") (not (str.in_re T4_8 (str.to_re ";")))) (and (= PCTEMP_LHS_2 (- 1)) (= var_0xINPUT_100818 (str.++ T0_8 T1_8)) (= PCTEMP_LHS_1 (str.len T0_8)) (not (str.in_re T1_8 (str.to_re ";"))))))
(assert (= T_7 (< PCTEMP_LHS_2 0)))
(assert (= T_8 (not T_7)))
(assert T_8)
(assert (= T_9 (+ PCTEMP_LHS_1 6)))
(assert (= T_a (+ T_9 1)))
(assert (= I0_14 (- PCTEMP_LHS_2 T_a)))
(assert (>= T_a 0))
(assert (>= PCTEMP_LHS_2 T_a))
(assert (<= PCTEMP_LHS_2 I1_14))
(assert (= I2_14 I1_14))
(assert (= I0_14 (str.len PCTEMP_LHS_3)))
(assert (= var_0xINPUT_100818 (str.++ T1_14 T2_14)))
(assert (= T2_14 (str.++ PCTEMP_LHS_3 T3_14)))
(assert (= T_a (str.len T1_14)))
(assert (= I1_14 (str.len var_0xINPUT_100818)))
(assert (= T_d (= "-" T_c)))
(assert T_d)
(assert (= T_f (= "-" T_e)))
(assert T_f)
(assert (= T_11 (= "-" T_10)))
(assert T_11)
(assert (= T_13 (= "-" T_12)))
(assert T_13)
(assert (= T_15 (= "-" T_14)))
(assert T_15)
(assert (= T_17 (= "-" T_16)))
(assert (= T_18 (not T_17)))
(assert T_18)
(assert (= T_1a (= "-" T_19)))
(assert T_1a)
(assert (= T_1c (= "-" T_1b)))
(assert T_1c)
(assert (= T_1e (= "-" T_1d)))
(assert T_1e)
(assert (= T_20 (= "-" T_1f)))
(assert T_20)
(assert (= T_22 (= "-" T_21)))
(assert T_22)
(assert (= T_24 (= "-" T_23)))
(assert (= T_25 (not T_24)))
(assert T_25)
(assert (= T_26 (= "-" PCTEMP_LHS_3)))
(assert (= T_27 (not T_26)))
(assert T_27)
(assert (= T_28 (= "" PCTEMP_LHS_3)))
(assert (= T_29 (not T_28)))
(assert T_29)
(check-sat)

