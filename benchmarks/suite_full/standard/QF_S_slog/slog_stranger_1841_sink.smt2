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
(declare-fun sigmaStar_4 () String)
(declare-fun sigmaStar_7 () String)
(declare-fun literal_8 () String)
(declare-fun x_9 () String)
(declare-fun literal_11 () String)
(declare-fun x_12 () String)
(declare-fun x_5 () String)
(assert (= x_5 (str.replace sigmaStar_1 "\u{66}\u{6f}\u{72}\u{6d}\u{64}\u{61}\u{74}\u{61}\u{3d}" "")))
(assert (= literal_8 "\u{2e}\u{67}\u{69}\u{66}"))
(assert (= x_9 (str.++ sigmaStar_7 literal_8)))
(assert (= literal_11 "\u{2f}\u{2f}"))
(assert (= x_12 (str.++ literal_11 x_9)))
(assert (str.in_re x_12 (re.++ (re.* re.allchar) (re.++ (str.to_re "\u{2f}\u{65}\u{76}\u{69}\u{6c}") (re.* re.allchar)))))
(check-sat)
(exit)
