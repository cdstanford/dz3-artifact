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



(declare-fun M0_2 () String)
(declare-fun M1_2 () String)
(declare-fun M2_2 () String)
(declare-fun M3_2 () String)
(declare-fun M4_2 () String)
(declare-fun M5_2 () String)
(declare-fun M6_2 () String)
(declare-fun M7_2 () String)
(declare-fun P0_2 () String)
(declare-fun P1_2 () String)
(declare-fun P2_2 () String)
(declare-fun P3_2 () String)
(declare-fun P4_2 () String)
(declare-fun P5_2 () String)
(declare-fun P6_2 () String)
(declare-fun P7_2 () String)
(declare-fun PCTEMP_LHS_1 () String)
(declare-fun PCTEMP_LHS_1_idx_0 () String)
(declare-fun PCTEMP_LHS_1_idx_1 () String)
(declare-fun PCTEMP_LHS_1_idx_2 () String)
(declare-fun PCTEMP_LHS_1_idx_3 () String)
(declare-fun PCTEMP_LHS_1_idx_4 () String)
(declare-fun PCTEMP_LHS_1_idx_5 () String)
(declare-fun PCTEMP_LHS_1_idx_6 () String)
(declare-fun PCTEMP_LHS_1_idx_7 () String)
(declare-fun PCTEMP_LHS_1_idx_8 () String)
(declare-fun T0_2 () String)
(declare-fun T1_2 () String)
(declare-fun T2_2 () String)
(declare-fun T3_2 () String)
(declare-fun T4_2 () String)
(declare-fun T5_2 () String)
(declare-fun T6_2 () String)
(declare-fun T7_2 () String)
(declare-fun T8_2 () String)
(declare-fun T_2 () Int)
(declare-fun T_3 () Bool)
(declare-fun T_4 () Bool)
(declare-fun var_0xINPUT_180326 () String)
(assert (= T8_2 PCTEMP_LHS_1_idx_8))
(assert (= T0_2 var_0xINPUT_180326))
(assert (= M7_2 ";"))
(assert (not (str.in_re PCTEMP_LHS_1_idx_7 (str.to_re ";"))))
(assert (= P7_2 (str.++ PCTEMP_LHS_1_idx_7 M7_2)))
(assert (= T7_2 (str.++ P7_2 T8_2)))
(assert (= M6_2 ";"))
(assert (not (str.in_re PCTEMP_LHS_1_idx_6 (str.to_re ";"))))
(assert (= P6_2 (str.++ PCTEMP_LHS_1_idx_6 M6_2)))
(assert (= T6_2 (str.++ P6_2 T7_2)))
(assert (= M5_2 ";"))
(assert (not (str.in_re PCTEMP_LHS_1_idx_5 (str.to_re ";"))))
(assert (= P5_2 (str.++ PCTEMP_LHS_1_idx_5 M5_2)))
(assert (= T5_2 (str.++ P5_2 T6_2)))
(assert (= M4_2 ";"))
(assert (not (str.in_re PCTEMP_LHS_1_idx_4 (str.to_re ";"))))
(assert (= P4_2 (str.++ PCTEMP_LHS_1_idx_4 M4_2)))
(assert (= T4_2 (str.++ P4_2 T5_2)))
(assert (= M3_2 ";"))
(assert (not (str.in_re PCTEMP_LHS_1_idx_3 (str.to_re ";"))))
(assert (= P3_2 (str.++ PCTEMP_LHS_1_idx_3 M3_2)))
(assert (= T3_2 (str.++ P3_2 T4_2)))
(assert (= M2_2 ";"))
(assert (not (str.in_re PCTEMP_LHS_1_idx_2 (str.to_re ";"))))
(assert (= P2_2 (str.++ PCTEMP_LHS_1_idx_2 M2_2)))
(assert (= T2_2 (str.++ P2_2 T3_2)))
(assert (= M1_2 ";"))
(assert (not (str.in_re PCTEMP_LHS_1_idx_1 (str.to_re ";"))))
(assert (= P1_2 (str.++ PCTEMP_LHS_1_idx_1 M1_2)))
(assert (= T1_2 (str.++ P1_2 T2_2)))
(assert (= M0_2 ";"))
(assert (not (str.in_re PCTEMP_LHS_1_idx_0 (str.to_re ";"))))
(assert (= P0_2 (str.++ PCTEMP_LHS_1_idx_0 M0_2)))
(assert (= T0_2 (str.++ P0_2 T1_2)))
(assert (= T_2 (str.len PCTEMP_LHS_1)))
(assert (= T_3 (< 0 T_2)))
(assert (= T_4 (not T_3)))
(assert T_4)
(check-sat)

