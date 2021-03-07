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
(declare-fun P0_2 () String)
(declare-fun P1_2 () String)
(declare-fun PCTEMP_LHS_1 () Bool)
(declare-fun PCTEMP_LHS_1_idx_0 () String)
(declare-fun PCTEMP_LHS_1_idx_1 () String)
(declare-fun PCTEMP_LHS_1_idx_2 () String)
(declare-fun T0_2 () String)
(declare-fun T1_2 () String)
(declare-fun T2_2 () String)
(declare-fun T_2 () String)
(declare-fun T_3 () Bool)
(declare-fun T_4 () Bool)
(declare-fun var_0xINPUT_2 () String)
(assert (= T2_2 PCTEMP_LHS_1_idx_2))
(assert (= T0_2 var_0xINPUT_2))
(assert (= M1_2 "="))
(assert (not (str.in_re PCTEMP_LHS_1_idx_1 (str.to_re "="))))
(assert (= P1_2 (str.++ PCTEMP_LHS_1_idx_1 M1_2)))
(assert (= T1_2 (str.++ P1_2 T2_2)))
(assert (= M0_2 "="))
(assert (not (str.in_re PCTEMP_LHS_1_idx_0 (str.to_re "="))))
(assert (= P0_2 (str.++ PCTEMP_LHS_1_idx_0 M0_2)))
(assert (= T0_2 (str.++ P0_2 T1_2)))
(assert PCTEMP_LHS_1)
(assert (ite PCTEMP_LHS_1 (= T_2 PCTEMP_LHS_1_idx_0) true))
(assert (= T_3 (not (= T_2 "Hello"))))
(assert (= T_4 (not T_3)))
(assert T_4)
(check-sat)

