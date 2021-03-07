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



(declare-fun I0_24 () Int)
(declare-fun I0_68 () Int)
(declare-fun I0_83 () Int)
(declare-fun M0_2 () String)
(declare-fun M0_5 () String)
(declare-fun M0_8 () String)
(declare-fun M1_5 () String)
(declare-fun M1_8 () String)
(declare-fun M2_5 () String)
(declare-fun M2_8 () String)
(declare-fun M3_8 () String)
(declare-fun P0_2 () String)
(declare-fun P0_5 () String)
(declare-fun P0_8 () String)
(declare-fun P1_5 () String)
(declare-fun P1_8 () String)
(declare-fun P2_5 () String)
(declare-fun P2_8 () String)
(declare-fun P3_8 () String)
(declare-fun PCTEMP_LHS_1_idx_0 () String)
(declare-fun PCTEMP_LHS_1_idx_1 () String)
(declare-fun PCTEMP_LHS_2_idx_0 () String)
(declare-fun PCTEMP_LHS_2_idx_1 () String)
(declare-fun PCTEMP_LHS_2_idx_2 () String)
(declare-fun PCTEMP_LHS_2_idx_3 () String)
(declare-fun PCTEMP_LHS_3_idx_0 () String)
(declare-fun PCTEMP_LHS_3_idx_1 () String)
(declare-fun PCTEMP_LHS_3_idx_2 () String)
(declare-fun PCTEMP_LHS_3_idx_3 () String)
(declare-fun PCTEMP_LHS_3_idx_4 () String)
(declare-fun PCTEMP_LHS_4 () String)
(declare-fun PCTEMP_LHS_5 () Int)
(declare-fun PCTEMP_LHS_6 () Int)
(declare-fun PCTEMP_LHS_7 () Int)
(declare-fun T0_2 () String)
(declare-fun T0_24 () String)
(declare-fun T0_5 () String)
(declare-fun T0_68 () String)
(declare-fun T0_8 () String)
(declare-fun T0_83 () String)
(declare-fun T1_2 () String)
(declare-fun T1_24 () String)
(declare-fun T1_5 () String)
(declare-fun T1_68 () String)
(declare-fun T1_8 () String)
(declare-fun T1_83 () String)
(declare-fun T2_24 () String)
(declare-fun T2_5 () String)
(declare-fun T2_68 () String)
(declare-fun T2_8 () String)
(declare-fun T2_83 () String)
(declare-fun T3_24 () String)
(declare-fun T3_5 () String)
(declare-fun T3_68 () String)
(declare-fun T3_8 () String)
(declare-fun T3_83 () String)
(declare-fun T4_24 () String)
(declare-fun T4_68 () String)
(declare-fun T4_8 () String)
(declare-fun T4_83 () String)
(declare-fun T5_24 () String)
(declare-fun T5_68 () String)
(declare-fun T5_83 () String)
(declare-fun T_10 () String)
(declare-fun T_11 () String)
(declare-fun T_12 () String)
(declare-fun T_13 () String)
(declare-fun T_14 () String)
(declare-fun T_15 () String)
(declare-fun T_16 () Bool)
(declare-fun T_17 () Bool)
(declare-fun T_18 () String)
(declare-fun T_19 () String)
(declare-fun T_1a () String)
(declare-fun T_1b () String)
(declare-fun T_1c () String)
(declare-fun T_1d () String)
(declare-fun T_1e () Bool)
(declare-fun T_1f () Bool)
(declare-fun T_2 () String)
(declare-fun T_20 () String)
(declare-fun T_21 () String)
(declare-fun T_22 () String)
(declare-fun T_23 () String)
(declare-fun T_24 () String)
(declare-fun T_25 () String)
(declare-fun T_27 () Bool)
(declare-fun T_28 () String)
(declare-fun T_29 () String)
(declare-fun T_2a () String)
(declare-fun T_2b () String)
(declare-fun T_2c () String)
(declare-fun T_2d () String)
(declare-fun T_2f () Bool)
(declare-fun T_4 () String)
(declare-fun T_7 () String)
(declare-fun T_8 () String)
(declare-fun T_9 () String)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun T_SELECT_3 () Bool)
(declare-fun T_a () String)
(declare-fun T_b () String)
(declare-fun T_c () String)
(declare-fun T_e () Bool)
(declare-fun T_f () Bool)
(declare-fun var_0xINPUT_35868 () String)
(assert (= T1_2 PCTEMP_LHS_1_idx_1))
(assert (= T0_2 var_0xINPUT_35868))
(assert (= M0_2 "__utma=218069774\\."))
(assert (not (str.in_re PCTEMP_LHS_1_idx_0 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "2") (str.to_re "1") (str.to_re "8") (str.to_re "0") (str.to_re "6") (str.to_re "9") (str.to_re "7") (str.to_re "7") (str.to_re "4") (str.to_re ".")))))
(assert (= P0_2 (str.++ PCTEMP_LHS_1_idx_0 M0_2)))
(assert (= T0_2 (str.++ P0_2 T1_2)))
(assert (= T_2 PCTEMP_LHS_1_idx_1))
(assert (= T3_5 PCTEMP_LHS_2_idx_3))
(assert (= T0_5 T_2))
(assert (= M2_5 ";"))
(assert (not (str.in_re PCTEMP_LHS_2_idx_2 (str.to_re ";"))))
(assert (= P2_5 (str.++ PCTEMP_LHS_2_idx_2 M2_5)))
(assert (= T2_5 (str.++ P2_5 T3_5)))
(assert (= M1_5 ";"))
(assert (not (str.in_re PCTEMP_LHS_2_idx_1 (str.to_re ";"))))
(assert (= P1_5 (str.++ PCTEMP_LHS_2_idx_1 M1_5)))
(assert (= T1_5 (str.++ P1_5 T2_5)))
(assert (= M0_5 ";"))
(assert (not (str.in_re PCTEMP_LHS_2_idx_0 (str.to_re ";"))))
(assert (= P0_5 (str.++ PCTEMP_LHS_2_idx_0 M0_5)))
(assert (= T0_5 (str.++ P0_5 T1_5)))
(assert (= T_4 PCTEMP_LHS_2_idx_0))
(assert (= T4_8 PCTEMP_LHS_3_idx_4))
(assert (= T0_8 T_4))
(assert (= M3_8 "\\."))
(assert (not (str.in_re PCTEMP_LHS_3_idx_3 (str.to_re "."))))
(assert (= P3_8 (str.++ PCTEMP_LHS_3_idx_3 M3_8)))
(assert (= T3_8 (str.++ P3_8 T4_8)))
(assert (= M2_8 "\\."))
(assert (not (str.in_re PCTEMP_LHS_3_idx_2 (str.to_re "."))))
(assert (= P2_8 (str.++ PCTEMP_LHS_3_idx_2 M2_8)))
(assert (= T2_8 (str.++ P2_8 T3_8)))
(assert (= M1_8 "\\."))
(assert (not (str.in_re PCTEMP_LHS_3_idx_1 (str.to_re "."))))
(assert (= P1_8 (str.++ PCTEMP_LHS_3_idx_1 M1_8)))
(assert (= T1_8 (str.++ P1_8 T2_8)))
(assert (= M0_8 "\\."))
(assert (not (str.in_re PCTEMP_LHS_3_idx_0 (str.to_re "."))))
(assert (= P0_8 (str.++ PCTEMP_LHS_3_idx_0 M0_8)))
(assert (= T0_8 (str.++ P0_8 T1_8)))
(assert (= T_7 (str.++ "__utma=218069774." PCTEMP_LHS_4)))
(assert (= T_8 (str.++ T_7 ";")))
(assert (= T_9 (str.++ T_8 "/")))
(assert (= T_a (str.++ T_9 ";")))
(assert (= T_b (str.++ T_a "")))
(assert (= T_c (str.++ T_b "")))
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_5 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_5 (+ I0_24 0)) (= T_c (str.++ T0_24 T1_24)) (= I0_24 (str.len T4_24)) (= 0 (str.len T0_24)) (= T1_24 (str.++ T2_24 T3_24)) (= T2_24 (str.++ T4_24 T5_24)) (= T5_24 "__utmz=218069774.") (not (str.in_re T4_24 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "2") (str.to_re "1") (str.to_re "8") (str.to_re "0") (str.to_re "6") (str.to_re "9") (str.to_re "7") (str.to_re "7") (str.to_re "4") (str.to_re "."))))) (and (= PCTEMP_LHS_5 (- 1)) (= T_c (str.++ T0_24 T1_24)) (= 0 (str.len T0_24)) (not (str.in_re T1_24 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "z") (str.to_re "=") (str.to_re "2") (str.to_re "1") (str.to_re "8") (str.to_re "0") (str.to_re "6") (str.to_re "9") (str.to_re "7") (str.to_re "7") (str.to_re "4") (str.to_re ".")))))))
(assert (= T_e (< (- 1) PCTEMP_LHS_5)))
(assert (= T_f (not T_e)))
(assert T_f)
(assert (= T_10 (str.++ "__utma=218069774." PCTEMP_LHS_4)))
(assert (= T_11 (str.++ T_10 ";")))
(assert (= T_12 (str.++ T_11 "/")))
(assert (= T_13 (str.++ T_12 ";")))
(assert (= T_14 (str.++ T_13 "")))
(assert (= T_15 (str.++ T_14 "")))
(assert (= T_16 (= "" T_15)))
(assert (= T_17 (not T_16)))
(assert T_17)
(assert (= T_18 (str.++ "__utma=218069774." PCTEMP_LHS_4)))
(assert (= T_19 (str.++ T_18 ";")))
(assert (= T_1a (str.++ T_19 "/")))
(assert (= T_1b (str.++ T_1a ";")))
(assert (= T_1c (str.++ T_1b "")))
(assert (= T_1d (str.++ T_1c "")))
(assert (= T_1e (= T_1d "")))
(assert (= T_1f (not T_1e)))
(assert T_1f)
(assert (= T_20 (str.++ "__utma=218069774." PCTEMP_LHS_4)))
(assert (= T_21 (str.++ T_20 ";")))
(assert (= T_22 (str.++ T_21 "/")))
(assert (= T_23 (str.++ T_22 ";")))
(assert (= T_24 (str.++ T_23 "")))
(assert (= T_25 (str.++ T_24 "")))
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_6 (- 1)))))
(assert (ite T_SELECT_2 (and (= PCTEMP_LHS_6 (+ I0_68 0)) (= T_25 (str.++ T0_68 T1_68)) (= I0_68 (str.len T4_68)) (= 0 (str.len T0_68)) (= T1_68 (str.++ T2_68 T3_68)) (= T2_68 (str.++ T4_68 T5_68)) (= T5_68 "__utma=218069774.") (not (str.in_re T4_68 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "2") (str.to_re "1") (str.to_re "8") (str.to_re "0") (str.to_re "6") (str.to_re "9") (str.to_re "7") (str.to_re "7") (str.to_re "4") (str.to_re "."))))) (and (= PCTEMP_LHS_6 (- 1)) (= T_25 (str.++ T0_68 T1_68)) (= 0 (str.len T0_68)) (not (str.in_re T1_68 (re.++ (str.to_re "_") (str.to_re "_") (str.to_re "u") (str.to_re "t") (str.to_re "m") (str.to_re "a") (str.to_re "=") (str.to_re "2") (str.to_re "1") (str.to_re "8") (str.to_re "0") (str.to_re "6") (str.to_re "9") (str.to_re "7") (str.to_re "7") (str.to_re "4") (str.to_re ".")))))))
(assert (= T_27 (< (- 1) PCTEMP_LHS_6)))
(assert T_27)
(assert (= T_28 (str.++ "__utma=218069774." PCTEMP_LHS_4)))
(assert (= T_29 (str.++ T_28 ";")))
(assert (= T_2a (str.++ T_29 "/")))
(assert (= T_2b (str.++ T_2a ";")))
(assert (= T_2c (str.++ T_2b "")))
(assert (= T_2d (str.++ T_2c "")))
(assert (= T_SELECT_3 (not (= PCTEMP_LHS_7 (- 1)))))
(assert (ite T_SELECT_3 (and (= PCTEMP_LHS_7 (+ I0_83 PCTEMP_LHS_6)) (= T_2d (str.++ T0_83 T1_83)) (= I0_83 (str.len T4_83)) (= PCTEMP_LHS_6 (str.len T0_83)) (= T1_83 (str.++ T2_83 T3_83)) (= T2_83 (str.++ T4_83 T5_83)) (= T5_83 ";") (not (str.in_re T4_83 (str.to_re ";")))) (and (= PCTEMP_LHS_7 (- 1)) (= T_2d (str.++ T0_83 T1_83)) (= PCTEMP_LHS_6 (str.len T0_83)) (not (str.in_re T1_83 (str.to_re ";"))))))
(assert (= T_2f (< PCTEMP_LHS_7 0)))
(assert T_2f)
(check-sat)

