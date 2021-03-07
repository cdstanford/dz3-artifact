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
(declare-fun I0_16 () Int)
(declare-fun I0_3 () Int)
(declare-fun I0_7 () Int)
(declare-fun I1_11 () Int)
(declare-fun I2_11 () Int)
(declare-fun M0_13 () String)
(declare-fun M10_13 () String)
(declare-fun M11_13 () String)
(declare-fun M12_13 () String)
(declare-fun M13_13 () String)
(declare-fun M14_13 () String)
(declare-fun M1_13 () String)
(declare-fun M2_13 () String)
(declare-fun M3_13 () String)
(declare-fun M4_13 () String)
(declare-fun M5_13 () String)
(declare-fun M6_13 () String)
(declare-fun M7_13 () String)
(declare-fun M8_13 () String)
(declare-fun M9_13 () String)
(declare-fun P0_13 () String)
(declare-fun P10_13 () String)
(declare-fun P11_13 () String)
(declare-fun P12_13 () String)
(declare-fun P13_13 () String)
(declare-fun P14_13 () String)
(declare-fun P1_13 () String)
(declare-fun P2_13 () String)
(declare-fun P3_13 () String)
(declare-fun P4_13 () String)
(declare-fun P5_13 () String)
(declare-fun P6_13 () String)
(declare-fun P7_13 () String)
(declare-fun P8_13 () String)
(declare-fun P9_13 () String)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun PCTEMP_LHS_3 () String)
(declare-fun PCTEMP_LHS_4_idx_0 () String)
(declare-fun PCTEMP_LHS_4_idx_1 () String)
(declare-fun PCTEMP_LHS_4_idx_10 () String)
(declare-fun PCTEMP_LHS_4_idx_11 () String)
(declare-fun PCTEMP_LHS_4_idx_12 () String)
(declare-fun PCTEMP_LHS_4_idx_13 () String)
(declare-fun PCTEMP_LHS_4_idx_14 () String)
(declare-fun PCTEMP_LHS_4_idx_15 () String)
(declare-fun PCTEMP_LHS_4_idx_2 () String)
(declare-fun PCTEMP_LHS_4_idx_3 () String)
(declare-fun PCTEMP_LHS_4_idx_4 () String)
(declare-fun PCTEMP_LHS_4_idx_5 () String)
(declare-fun PCTEMP_LHS_4_idx_6 () String)
(declare-fun PCTEMP_LHS_4_idx_7 () String)
(declare-fun PCTEMP_LHS_4_idx_8 () String)
(declare-fun PCTEMP_LHS_4_idx_9 () String)
(declare-fun PCTEMP_LHS_5 () Int)
(declare-fun T0_13 () String)
(declare-fun T0_16 () String)
(declare-fun T0_3 () String)
(declare-fun T0_7 () String)
(declare-fun T10_13 () String)
(declare-fun T11_13 () String)
(declare-fun T12_13 () String)
(declare-fun T13_13 () String)
(declare-fun T14_13 () String)
(declare-fun T15_13 () String)
(declare-fun T1_11 () String)
(declare-fun T1_13 () String)
(declare-fun T1_16 () String)
(declare-fun T1_3 () String)
(declare-fun T1_7 () String)
(declare-fun T2_11 () String)
(declare-fun T2_13 () String)
(declare-fun T2_16 () String)
(declare-fun T2_3 () String)
(declare-fun T2_7 () String)
(declare-fun T3_11 () String)
(declare-fun T3_13 () String)
(declare-fun T3_16 () String)
(declare-fun T3_3 () String)
(declare-fun T3_7 () String)
(declare-fun T4_13 () String)
(declare-fun T4_16 () String)
(declare-fun T4_3 () String)
(declare-fun T4_7 () String)
(declare-fun T5_13 () String)
(declare-fun T5_16 () String)
(declare-fun T5_3 () String)
(declare-fun T5_7 () String)
(declare-fun T6_13 () String)
(declare-fun T7_13 () String)
(declare-fun T8_13 () String)
(declare-fun T9_13 () String)
(declare-fun T_1 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () Int)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun T_SELECT_3 () Bool)
(declare-fun T_a () String)
(declare-fun T_c () Bool)
(declare-fun T_d () Bool)
(declare-fun var_0xINPUT_6552 () String)
(assert (= T_1 (not (= "" var_0xINPUT_6552))))
(assert T_1)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_3 0)) (= var_0xINPUT_6552 (str.++ T0_3 T1_3)) (= I0_3 (str.len T4_3)) (= 0 (str.len T0_3)) (= T1_3 (str.++ T2_3 T3_3)) (= T2_3 (str.++ T4_3 T5_3)) (= T5_3 "?") (not (str.in_re T4_3 (str.to_re "?")))) (and (= PCTEMP_LHS_1 (- 1)) (= var_0xINPUT_6552 (str.++ T0_3 T1_3)) (= 0 (str.len T0_3)) (not (str.in_re T1_3 (str.to_re "?"))))))
(assert (= T_3 (= PCTEMP_LHS_1 (- 1))))
(assert (= T_4 (not T_3)))
(assert T_4)
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert (ite T_SELECT_2 (and (= PCTEMP_LHS_2 (+ I0_7 0)) (= var_0xINPUT_6552 (str.++ T0_7 T1_7)) (= I0_7 (str.len T4_7)) (= 0 (str.len T0_7)) (= T1_7 (str.++ T2_7 T3_7)) (= T2_7 (str.++ T4_7 T5_7)) (= T5_7 "#") (not (str.in_re T4_7 (str.to_re "#")))) (and (= PCTEMP_LHS_2 (- 1)) (= var_0xINPUT_6552 (str.++ T0_7 T1_7)) (= 0 (str.len T0_7)) (not (str.in_re T1_7 (str.to_re "#"))))))
(assert (= T_6 (= PCTEMP_LHS_2 (- 1))))
(assert T_6)
(assert (= T_7 (+ PCTEMP_LHS_1 1)))
(assert (= I0_11 (- I2_11 T_7)))
(assert (>= T_7 0))
(assert (>= I2_11 T_7))
(assert (<= I2_11 I1_11))
(assert (= I2_11 I1_11))
(assert (= I0_11 (str.len PCTEMP_LHS_3)))
(assert (= var_0xINPUT_6552 (str.++ T1_11 T2_11)))
(assert (= T2_11 (str.++ PCTEMP_LHS_3 T3_11)))
(assert (= T_7 (str.len T1_11)))
(assert (= I1_11 (str.len var_0xINPUT_6552)))
(assert (= T15_13 PCTEMP_LHS_4_idx_15))
(assert (= T0_13 PCTEMP_LHS_3))
(assert (= M14_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_14 (str.to_re "&"))))
(assert (= P14_13 (str.++ PCTEMP_LHS_4_idx_14 M14_13)))
(assert (= T14_13 (str.++ P14_13 T15_13)))
(assert (= M13_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_13 (str.to_re "&"))))
(assert (= P13_13 (str.++ PCTEMP_LHS_4_idx_13 M13_13)))
(assert (= T13_13 (str.++ P13_13 T14_13)))
(assert (= M12_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_12 (str.to_re "&"))))
(assert (= P12_13 (str.++ PCTEMP_LHS_4_idx_12 M12_13)))
(assert (= T12_13 (str.++ P12_13 T13_13)))
(assert (= M11_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_11 (str.to_re "&"))))
(assert (= P11_13 (str.++ PCTEMP_LHS_4_idx_11 M11_13)))
(assert (= T11_13 (str.++ P11_13 T12_13)))
(assert (= M10_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_10 (str.to_re "&"))))
(assert (= P10_13 (str.++ PCTEMP_LHS_4_idx_10 M10_13)))
(assert (= T10_13 (str.++ P10_13 T11_13)))
(assert (= M9_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_9 (str.to_re "&"))))
(assert (= P9_13 (str.++ PCTEMP_LHS_4_idx_9 M9_13)))
(assert (= T9_13 (str.++ P9_13 T10_13)))
(assert (= M8_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_8 (str.to_re "&"))))
(assert (= P8_13 (str.++ PCTEMP_LHS_4_idx_8 M8_13)))
(assert (= T8_13 (str.++ P8_13 T9_13)))
(assert (= M7_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_7 (str.to_re "&"))))
(assert (= P7_13 (str.++ PCTEMP_LHS_4_idx_7 M7_13)))
(assert (= T7_13 (str.++ P7_13 T8_13)))
(assert (= M6_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_6 (str.to_re "&"))))
(assert (= P6_13 (str.++ PCTEMP_LHS_4_idx_6 M6_13)))
(assert (= T6_13 (str.++ P6_13 T7_13)))
(assert (= M5_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_5 (str.to_re "&"))))
(assert (= P5_13 (str.++ PCTEMP_LHS_4_idx_5 M5_13)))
(assert (= T5_13 (str.++ P5_13 T6_13)))
(assert (= M4_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_4 (str.to_re "&"))))
(assert (= P4_13 (str.++ PCTEMP_LHS_4_idx_4 M4_13)))
(assert (= T4_13 (str.++ P4_13 T5_13)))
(assert (= M3_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_3 (str.to_re "&"))))
(assert (= P3_13 (str.++ PCTEMP_LHS_4_idx_3 M3_13)))
(assert (= T3_13 (str.++ P3_13 T4_13)))
(assert (= M2_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_2 (str.to_re "&"))))
(assert (= P2_13 (str.++ PCTEMP_LHS_4_idx_2 M2_13)))
(assert (= T2_13 (str.++ P2_13 T3_13)))
(assert (= M1_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_1 (str.to_re "&"))))
(assert (= P1_13 (str.++ PCTEMP_LHS_4_idx_1 M1_13)))
(assert (= T1_13 (str.++ P1_13 T2_13)))
(assert (= M0_13 "&"))
(assert (not (str.in_re PCTEMP_LHS_4_idx_0 (str.to_re "&"))))
(assert (= P0_13 (str.++ PCTEMP_LHS_4_idx_0 M0_13)))
(assert (= T0_13 (str.++ P0_13 T1_13)))
(assert (= T_a PCTEMP_LHS_4_idx_0))
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_5 (- 1)))))
(assert (ite T_SELECT_3 (and (= PCTEMP_LHS_5 (+ I0_16 0)) (= T_a (str.++ T0_16 T1_16)) (= I0_16 (str.len T4_16)) (= 0 (str.len T0_16)) (= T1_16 (str.++ T2_16 T3_16)) (= T2_16 (str.++ T4_16 T5_16)) (= T5_16 "=") (not (str.in_re T4_16 (str.to_re "=")))) (and (= PCTEMP_LHS_5 (- 1)) (= T_a (str.++ T0_16 T1_16)) (= 0 (str.len T0_16)) (not (str.in_re T1_16 (str.to_re "="))))))
(assert (= T_c (not (= PCTEMP_LHS_5 (- 1)))))
(assert (= T_d (not T_c)))
(assert T_d)
(check-sat)

