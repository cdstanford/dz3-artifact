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



(declare-fun PCTEMP_LHS_1 () String)
(declare-fun PCTEMP_LHS_2 () String)
(declare-fun PCTEMP_LHS_3 () String)
(declare-fun PCTEMP_LHS_4 () String)
(declare-fun PCTEMP_LHS_5 () String)
(declare-fun PCTEMP_LHS_6 () String)
(declare-fun PCTEMP_LHS_7 () String)
(declare-fun T_10 () String)
(declare-fun T_11 () Bool)
(declare-fun T_12 () Bool)
(declare-fun T_13 () String)
(declare-fun T_14 () String)
(declare-fun T_15 () Bool)
(declare-fun T_8 () String)
(declare-fun T_9 () String)
(declare-fun T_a () Bool)
(declare-fun T_b () String)
(declare-fun T_c () String)
(declare-fun T_d () Bool)
(declare-fun T_e () Bool)
(declare-fun T_f () String)
(assert (not (str.in_re PCTEMP_LHS_1 (re.++ (str.to_re "%") (str.to_re "h") (str.to_re "o") (str.to_re "s") (str.to_re "t") (str.to_re "%")))))
(assert (= PCTEMP_LHS_1 "http://www.ig.gmodules.com/gadgets/proxy/refresh=%refresh%&container=%container%%rewriteMime%&gadget=%gadget%/%rawurl%"))
(assert (not (str.in_re PCTEMP_LHS_2 (re.++ (str.to_re "%") (str.to_re "r") (str.to_re "a") (str.to_re "w") (str.to_re "u") (str.to_re "r") (str.to_re "l") (str.to_re "%")))))
(assert (= PCTEMP_LHS_2 PCTEMP_LHS_1))
(assert (not (str.in_re PCTEMP_LHS_3 (re.++ (str.to_re "%") (str.to_re "r") (str.to_re "e") (str.to_re "f") (str.to_re "r") (str.to_re "e") (str.to_re "s") (str.to_re "h") (str.to_re "%")))))
(assert (= PCTEMP_LHS_3 PCTEMP_LHS_2))
(assert (not (str.in_re PCTEMP_LHS_4 (re.++ (str.to_re "%") (str.to_re "g") (str.to_re "a") (str.to_re "d") (str.to_re "g") (str.to_re "e") (str.to_re "t") (str.to_re "%")))))
(assert (= PCTEMP_LHS_4 PCTEMP_LHS_3))
(assert (not (str.in_re PCTEMP_LHS_5 (re.++ (str.to_re "%") (str.to_re "c") (str.to_re "o") (str.to_re "n") (str.to_re "t") (str.to_re "a") (str.to_re "i") (str.to_re "n") (str.to_re "e") (str.to_re "r") (str.to_re "%")))))
(assert (= PCTEMP_LHS_5 PCTEMP_LHS_4))
(assert (not (str.in_re PCTEMP_LHS_6 (re.++ (str.to_re "%") (str.to_re "r") (str.to_re "e") (str.to_re "w") (str.to_re "r") (str.to_re "i") (str.to_re "t") (str.to_re "e") (str.to_re "M") (str.to_re "i") (str.to_re "m") (str.to_re "e") (str.to_re "%")))))
(assert (= PCTEMP_LHS_6 PCTEMP_LHS_5))
(assert (not (str.in_re PCTEMP_LHS_7 (re.++ (str.to_re "%") (str.to_re "r") (str.to_re "e") (str.to_re "w") (str.to_re "r") (str.to_re "i") (str.to_re "t") (str.to_re "e") (str.to_re "M") (str.to_re "i") (str.to_re "m") (str.to_re "e") (str.to_re "%")))))
(assert (= PCTEMP_LHS_7 PCTEMP_LHS_6))
(assert (= T_8 (str.++ "transparent" PCTEMP_LHS_7)))
(assert (= T_9 (str.++ T_8 ")")))
(assert (= T_a (= "" T_9)))
(assert T_a)
(assert (= T_b (str.++ "transparent" PCTEMP_LHS_7)))
(assert (= T_c (str.++ T_b ")")))
(assert (= T_d (not (= T_c "string"))))
(assert (= T_e (not T_d)))
(assert T_e)
(assert (= T_f (str.++ "transparent" PCTEMP_LHS_7)))
(assert (= T_10 (str.++ T_f ")")))
(assert (= T_11 (not (= T_10 "string"))))
(assert (= T_12 (not T_11)))
(assert T_12)
(assert (= T_13 (str.++ "transparent" PCTEMP_LHS_7)))
(assert (= T_14 (str.++ T_13 ")")))
(assert (= T_15 (not (= T_14 "string"))))
(assert T_15)
(check-sat)
