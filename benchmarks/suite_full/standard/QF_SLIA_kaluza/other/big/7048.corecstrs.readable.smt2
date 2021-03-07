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



(declare-fun I0_127 () Int)
(declare-fun I0_15 () Int)
(declare-fun I0_18 () Int)
(declare-fun I0_2 () Int)
(declare-fun I0_23 () Int)
(declare-fun I0_39 () Int)
(declare-fun I0_4 () Int)
(declare-fun I0_6 () Int)
(declare-fun I0_82 () Int)
(declare-fun I0_97 () Int)
(declare-fun I1_127 () Int)
(declare-fun I1_23 () Int)
(declare-fun I2_127 () Int)
(declare-fun I2_23 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun PCTEMP_LHS_10 () String)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun PCTEMP_LHS_3 () Int)
(declare-fun PCTEMP_LHS_4 () Int)
(declare-fun PCTEMP_LHS_5 () Int)
(declare-fun PCTEMP_LHS_6 () String)
(declare-fun PCTEMP_LHS_7 () Int)
(declare-fun PCTEMP_LHS_8 () Int)
(declare-fun PCTEMP_LHS_9 () Int)
(declare-fun T0_15 () String)
(declare-fun T0_18 () String)
(declare-fun T0_2 () String)
(declare-fun T0_39 () String)
(declare-fun T0_4 () String)
(declare-fun T0_6 () String)
(declare-fun T0_82 () String)
(declare-fun T0_97 () String)
(declare-fun T1_127 () String)
(declare-fun T1_15 () String)
(declare-fun T1_18 () String)
(declare-fun T1_2 () String)
(declare-fun T1_23 () String)
(declare-fun T1_39 () String)
(declare-fun T1_4 () String)
(declare-fun T1_6 () String)
(declare-fun T1_82 () String)
(declare-fun T1_97 () String)
(declare-fun T2_127 () String)
(declare-fun T2_15 () String)
(declare-fun T2_18 () String)
(declare-fun T2_2 () String)
(declare-fun T2_23 () String)
(declare-fun T2_39 () String)
(declare-fun T2_4 () String)
(declare-fun T2_6 () String)
(declare-fun T2_82 () String)
(declare-fun T2_97 () String)
(declare-fun T3_127 () String)
(declare-fun T3_15 () String)
(declare-fun T3_18 () String)
(declare-fun T3_2 () String)
(declare-fun T3_23 () String)
(declare-fun T3_39 () String)
(declare-fun T3_4 () String)
(declare-fun T3_6 () String)
(declare-fun T3_82 () String)
(declare-fun T3_97 () String)
(declare-fun T4_15 () String)
(declare-fun T4_18 () String)
(declare-fun T4_2 () String)
(declare-fun T4_39 () String)
(declare-fun T4_4 () String)
(declare-fun T4_6 () String)
(declare-fun T4_82 () String)
(declare-fun T4_97 () String)
(declare-fun T5_15 () String)
(declare-fun T5_18 () String)
(declare-fun T5_2 () String)
(declare-fun T5_39 () String)
(declare-fun T5_4 () String)
(declare-fun T5_6 () String)
(declare-fun T5_82 () String)
(declare-fun T5_97 () String)
(declare-fun T_10 () Int)
(declare-fun T_12 () Bool)
(declare-fun T_13 () Bool)
(declare-fun T_14 () String)
(declare-fun T_15 () String)
(declare-fun T_16 () String)
(declare-fun T_17 () String)
(declare-fun T_18 () String)
(declare-fun T_19 () String)
(declare-fun T_1b () Bool)
(declare-fun T_1c () String)
(declare-fun T_1d () String)
(declare-fun T_1e () String)
(declare-fun T_1f () String)
(declare-fun T_20 () String)
(declare-fun T_21 () String)
(declare-fun T_22 () Bool)
(declare-fun T_23 () Bool)
(declare-fun T_24 () String)
(declare-fun T_25 () String)
(declare-fun T_26 () String)
(declare-fun T_27 () String)
(declare-fun T_28 () String)
(declare-fun T_29 () String)
(declare-fun T_2a () Bool)
(declare-fun T_2b () Bool)
(declare-fun T_2c () String)
(declare-fun T_2d () String)
(declare-fun T_2e () String)
(declare-fun T_2f () String)
(declare-fun T_30 () String)
(declare-fun T_31 () String)
(declare-fun T_33 () Bool)
(declare-fun T_34 () String)
(declare-fun T_35 () String)
(declare-fun T_36 () String)
(declare-fun T_37 () String)
(declare-fun T_38 () String)
(declare-fun T_39 () String)
(declare-fun T_3b () Bool)
(declare-fun T_3c () String)
(declare-fun T_3d () String)
(declare-fun T_3e () String)
(declare-fun T_3f () String)
(declare-fun T_4 () Bool)
(declare-fun T_40 () String)
(declare-fun T_41 () String)
(declare-fun T_42 () Int)
(declare-fun T_43 () String)
(declare-fun T_44 () String)
(declare-fun T_45 () String)
(declare-fun T_46 () String)
(declare-fun T_47 () String)
(declare-fun T_48 () String)
(declare-fun T_49 () Int)
(declare-fun T_4b () Bool)
(declare-fun T_4c () Bool)
(declare-fun T_4d () Bool)
(declare-fun T_4e () Bool)
(declare-fun T_4f () Bool)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () Bool)
(declare-fun T_8 () Bool)
(declare-fun T_9 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun T_SELECT_3 () Bool)
(declare-fun T_SELECT_4 () Bool)
(declare-fun T_SELECT_5 () Bool)
(declare-fun T_SELECT_6 () Bool)
(declare-fun T_SELECT_7 () Bool)
(declare-fun T_SELECT_8 () Bool)
(declare-fun T_a () Bool)
(declare-fun T_c () Bool)
(declare-fun T_e () Bool)
(declare-fun T_f () Bool)
(declare-fun var_0xINPUT_14693 () String)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_2 0)) (= var_0xINPUT_14693 (str.++ T0_2 T1_2)) (= I0_2 (str.len T4_2)) (= 0 (str.len T0_2)) (= T1_2 (str.++ T2_2 T3_2)) (= T2_2 (str.++ T4_2 T5_2)) (= T5_2 "__utma=169413169.") (not (str.in_re T4_2 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "."))))) (and (= PCTEMP_LHS_1 (- 1)) (= var_0xINPUT_14693 (str.++ T0_2 T1_2)) (= 0 (str.len T0_2)) (not (str.in_re T1_2 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re ".")))))))
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert (ite T_SELECT_2 (and (= PCTEMP_LHS_2 (+ I0_4 0)) (= var_0xINPUT_14693 (str.++ T0_4 T1_4)) (= I0_4 (str.len T4_4)) (= 0 (str.len T0_4)) (= T1_4 (str.++ T2_4 T3_4)) (= T2_4 (str.++ T4_4 T5_4)) (= T5_4 "__utmb=169413169") (not (str.in_re T4_4 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "b") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9"))))) (and (= PCTEMP_LHS_2 (- 1)) (= var_0xINPUT_14693 (str.++ T0_4 T1_4)) (= 0 (str.len T0_4)) (not (str.in_re T1_4 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "b") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9")))))))
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_3 (- 1)))))
(assert (ite T_SELECT_3 (and (= PCTEMP_LHS_3 (+ I0_6 0)) (= var_0xINPUT_14693 (str.++ T0_6 T1_6)) (= I0_6 (str.len T4_6)) (= 0 (str.len T0_6)) (= T1_6 (str.++ T2_6 T3_6)) (= T2_6 (str.++ T4_6 T5_6)) (= T5_6 "__utmc=169413169") (not (str.in_re T4_6 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "c") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9"))))) (and (= PCTEMP_LHS_3 (- 1)) (= var_0xINPUT_14693 (str.++ T0_6 T1_6)) (= 0 (str.len T0_6)) (not (str.in_re T1_6 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "c") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9")))))))
(assert (= T_4 (<= 0 PCTEMP_LHS_1)))
(assert T_4)
(assert (= T_5 (<= 0 PCTEMP_LHS_2)))
(assert T_5)
(assert (= T_6 (<= 0 PCTEMP_LHS_3)))
(assert T_6)
(assert (= T_7 (= "" var_0xINPUT_14693)))
(assert (= T_8 (not T_7)))
(assert T_8)
(assert (= T_9 (= var_0xINPUT_14693 "")))
(assert (= T_a (not T_9)))
(assert T_a)
(assert (= T_SELECT_4 (not (= PCTEMP_LHS_4 (- 1)))))
(assert (ite T_SELECT_4 (and (= PCTEMP_LHS_4 (+ I0_15 0)) (= var_0xINPUT_14693 (str.++ T0_15 T1_15)) (= I0_15 (str.len T4_15)) (= 0 (str.len T0_15)) (= T1_15 (str.++ T2_15 T3_15)) (= T2_15 (str.++ T4_15 T5_15)) (= T5_15 "__utmb=169413169") (not (str.in_re T4_15 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "b") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9"))))) (and (= PCTEMP_LHS_4 (- 1)) (= var_0xINPUT_14693 (str.++ T0_15 T1_15)) (= 0 (str.len T0_15)) (not (str.in_re T1_15 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "b") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9")))))))
(assert (= T_c (< (- 1) PCTEMP_LHS_4)))
(assert T_c)
(assert (= T_SELECT_5 (not (= PCTEMP_LHS_5 (- 1)))))
(assert (ite T_SELECT_5 (and (= PCTEMP_LHS_5 (+ I0_18 PCTEMP_LHS_4)) (= var_0xINPUT_14693 (str.++ T0_18 T1_18)) (= I0_18 (str.len T4_18)) (= PCTEMP_LHS_4 (str.len T0_18)) (= T1_18 (str.++ T2_18 T3_18)) (= T2_18 (str.++ T4_18 T5_18)) (= T5_18 ";") (not (str.in_re T4_18 (str.to_re ";")))) (and (= PCTEMP_LHS_5 (- 1)) (= var_0xINPUT_14693 (str.++ T0_18 T1_18)) (= PCTEMP_LHS_4 (str.len T0_18)) (not (str.in_re T1_18 (str.to_re ";"))))))
(assert (= T_e (< PCTEMP_LHS_5 0)))
(assert (= T_f (not T_e)))
(assert T_f)
(assert (= T_10 (+ PCTEMP_LHS_4 7)))
(assert (= I0_23 (- PCTEMP_LHS_5 T_10)))
(assert (>= T_10 0))
(assert (>= PCTEMP_LHS_5 T_10))
(assert (<= PCTEMP_LHS_5 I1_23))
(assert (= I2_23 I1_23))
(assert (= I0_23 (str.len PCTEMP_LHS_6)))
(assert (= var_0xINPUT_14693 (str.++ T1_23 T2_23)))
(assert (= T2_23 (str.++ PCTEMP_LHS_6 T3_23)))
(assert (= T_10 (str.len T1_23)))
(assert (= I1_23 (str.len var_0xINPUT_14693)))
(assert (= T_12 (= "-" PCTEMP_LHS_6)))
(assert (= T_13 (not T_12)))
(assert T_13)
(assert (= T_14 (str.++ "__utmb=" PCTEMP_LHS_6)))
(assert (= T_15 (str.++ T_14 ";")))
(assert (= T_16 (str.++ T_15 "/")))
(assert (= T_17 (str.++ T_16 ";")))
(assert (= T_18 (str.++ T_17 "")))
(assert (= T_19 (str.++ T_18 "")))
(assert (= T_SELECT_6 (not (= PCTEMP_LHS_7 (- 1)))))
(assert (ite T_SELECT_6 (and (= PCTEMP_LHS_7 (+ I0_39 0)) (= T_19 (str.++ T0_39 T1_39)) (= I0_39 (str.len T4_39)) (= 0 (str.len T0_39)) (= T1_39 (str.++ T2_39 T3_39)) (= T2_39 (str.++ T4_39 T5_39)) (= T5_39 "__utmz=169413169.") (not (str.in_re T4_39 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "."))))) (and (= PCTEMP_LHS_7 (- 1)) (= T_19 (str.++ T0_39 T1_39)) (= 0 (str.len T0_39)) (not (str.in_re T1_39 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re ".")))))))
(assert (= T_1b (< (- 1) PCTEMP_LHS_7)))
(assert T_1b)
(assert (= T_1c (str.++ "__utmb=" PCTEMP_LHS_6)))
(assert (= T_1d (str.++ T_1c ";")))
(assert (= T_1e (str.++ T_1d "/")))
(assert (= T_1f (str.++ T_1e ";")))
(assert (= T_20 (str.++ T_1f "")))
(assert (= T_21 (str.++ T_20 "")))
(assert (= T_22 (= "" T_21)))
(assert (= T_23 (not T_22)))
(assert T_23)
(assert (= T_24 (str.++ "__utmb=" PCTEMP_LHS_6)))
(assert (= T_25 (str.++ T_24 ";")))
(assert (= T_26 (str.++ T_25 "/")))
(assert (= T_27 (str.++ T_26 ";")))
(assert (= T_28 (str.++ T_27 "")))
(assert (= T_29 (str.++ T_28 "")))
(assert (= T_2a (= T_29 "")))
(assert (= T_2b (not T_2a)))
(assert T_2b)
(assert (= T_2c (str.++ "__utmb=" PCTEMP_LHS_6)))
(assert (= T_2d (str.++ T_2c ";")))
(assert (= T_2e (str.++ T_2d "/")))
(assert (= T_2f (str.++ T_2e ";")))
(assert (= T_30 (str.++ T_2f "")))
(assert (= T_31 (str.++ T_30 "")))
(assert (= T_SELECT_7 (not (= PCTEMP_LHS_8 (- 1)))))
(assert (ite T_SELECT_7 (and (= PCTEMP_LHS_8 (+ I0_82 0)) (= T_31 (str.++ T0_82 T1_82)) (= I0_82 (str.len T4_82)) (= 0 (str.len T0_82)) (= T1_82 (str.++ T2_82 T3_82)) (= T2_82 (str.++ T4_82 T5_82)) (= T5_82 "__utmz=169413169.") (not (str.in_re T4_82 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "."))))) (and (= PCTEMP_LHS_8 (- 1)) (= T_31 (str.++ T0_82 T1_82)) (= 0 (str.len T0_82)) (not (str.in_re T1_82 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re "4") (str.to_re "1") (str.to_re "3") (str.to_re "1") (str.to_re "6") (str.to_re "9") (str.to_re ".")))))))
(assert (= T_33 (< (- 1) PCTEMP_LHS_8)))
(assert T_33)
(assert (= T_34 (str.++ "__utmb=" PCTEMP_LHS_6)))
(assert (= T_35 (str.++ T_34 ";")))
(assert (= T_36 (str.++ T_35 "/")))
(assert (= T_37 (str.++ T_36 ";")))
(assert (= T_38 (str.++ T_37 "")))
(assert (= T_39 (str.++ T_38 "")))
(assert (= T_SELECT_8 (not (= PCTEMP_LHS_9 (- 1)))))
(assert (ite T_SELECT_8 (and (= PCTEMP_LHS_9 (+ I0_97 PCTEMP_LHS_8)) (= T_39 (str.++ T0_97 T1_97)) (= I0_97 (str.len T4_97)) (= PCTEMP_LHS_8 (str.len T0_97)) (= T1_97 (str.++ T2_97 T3_97)) (= T2_97 (str.++ T4_97 T5_97)) (= T5_97 ";") (not (str.in_re T4_97 (str.to_re ";")))) (and (= PCTEMP_LHS_9 (- 1)) (= T_39 (str.++ T0_97 T1_97)) (= PCTEMP_LHS_8 (str.len T0_97)) (not (str.in_re T1_97 (str.to_re ";"))))))
(assert (= T_3b (< PCTEMP_LHS_9 0)))
(assert T_3b)
(assert (= T_3c (str.++ "__utmb=" PCTEMP_LHS_6)))
(assert (= T_3d (str.++ T_3c ";")))
(assert (= T_3e (str.++ T_3d "/")))
(assert (= T_3f (str.++ T_3e ";")))
(assert (= T_40 (str.++ T_3f "")))
(assert (= T_41 (str.++ T_40 "")))
(assert (= T_42 (+ PCTEMP_LHS_8 7)))
(assert (= T_43 (str.++ "__utmb=" PCTEMP_LHS_6)))
(assert (= T_44 (str.++ T_43 ";")))
(assert (= T_45 (str.++ T_44 "/")))
(assert (= T_46 (str.++ T_45 ";")))
(assert (= T_47 (str.++ T_46 "")))
(assert (= T_48 (str.++ T_47 "")))
(assert (= T_49 (str.len T_48)))
(assert (= I0_127 (- T_49 T_42)))
(assert (>= T_42 0))
(assert (>= T_49 T_42))
(assert (<= T_49 I1_127))
(assert (= I2_127 I1_127))
(assert (= I0_127 (str.len PCTEMP_LHS_10)))
(assert (= T_41 (str.++ T1_127 T2_127)))
(assert (= T2_127 (str.++ PCTEMP_LHS_10 T3_127)))
(assert (= T_42 (str.len T1_127)))
(assert (= I1_127 (str.len T_41)))
(assert (= T_4b (not (= PCTEMP_LHS_10 "-"))))
(assert T_4b)
(assert (= T_4c (not (= PCTEMP_LHS_10 "-"))))
(assert T_4c)
(assert (= T_4d (= PCTEMP_LHS_10 "-")))
(assert (= T_4e (not T_4d)))
(assert T_4e)
(assert (= T_4f (= PCTEMP_LHS_10 "-")))
(assert T_4f)
(check-sat)

