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
(declare-fun T_8 () Bool)
(declare-fun T_9 () Bool)
(declare-fun T_a () Bool)
(declare-fun T_b () Bool)
(declare-fun T_c () Bool)
(declare-fun T_d () Bool)
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
(assert (= T_8 (= "" PCTEMP_LHS_7)))
(assert T_8)
(assert (= T_9 (not (= PCTEMP_LHS_7 "string"))))
(assert (= T_a (not T_9)))
(assert T_a)
(assert (= T_b (not (= PCTEMP_LHS_7 "string"))))
(assert (= T_c (not T_b)))
(assert T_c)
(assert (= T_d (not (= PCTEMP_LHS_7 "string"))))
(assert T_d)
(check-sat)

