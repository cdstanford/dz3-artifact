(set-info :smt-lib-version 2.6)
(set-logic QF_S)
(set-info :source |
Generated by: Hung-En Wang, Tzung-Lin Tsai, Chun-Han Lin, Fang Yu, and Jie-Hong R. Jiang
Generated on: 2019-02-28
Generator: Stranger
Application: Security analysis of string manipulating web applications
Target solver: CVC4, Norn, Z3-str2
Publication:
Hung-En Wang, Tzung-Lin Tsai, Chun-Han Lin, Fang Yu, Jie-Hong R. Jiang:
String Analysis via Automata Manipulation with Logic Circuit Representation. CAV (1) 2016: 241-260.
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)

(declare-fun sigmaStar_0 () String)
(declare-fun sigmaStar_1 () String)
(declare-fun sigmaStar_3 () String)
(declare-fun sigmaStar_5 () String)
(declare-fun literal_6 () String)
(declare-fun x_7 () String)
(declare-fun x_9 () String)
(declare-fun sigmaStar_10 () String)
(declare-fun literal_11 () String)
(declare-fun x_12 () String)
(declare-fun x_13 () String)
(declare-fun literal_14 () String)
(declare-fun x_15 () String)
(assert (= literal_6 "\u{5b}"))
(assert (= x_7 (str.++ sigmaStar_5 literal_6)))
(assert (= x_9 (str.++ x_7 sigmaStar_0)))
(assert (= literal_11 "\u{5d}"))
(assert (= x_12 (str.++ x_9 literal_11)))
(assert (= x_13 (str.++ x_12 sigmaStar_10)))
(assert (= literal_14 "\u{61}\u{76}\u{61}\u{74}\u{61}\u{72}\u{73}\u{2f}"))
(assert (= x_15 (str.++ literal_14 x_13)))
(assert (str.in_re x_15 (re.++ (re.* re.allchar) (re.++ (str.to_re "\u{2f}\u{65}\u{76}\u{69}\u{6c}") (re.* re.allchar)))))
(check-sat)
(exit)
