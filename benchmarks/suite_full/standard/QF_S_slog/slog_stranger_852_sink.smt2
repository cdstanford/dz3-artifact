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
(declare-fun literal_8 () String)
(declare-fun x_9 () String)
(declare-fun epsilon () String)
(declare-fun literal_6 () String)
(declare-fun literal_5 () String)
(declare-fun x_11 () String)
(declare-fun literal_12 () String)
(declare-fun x_13 () String)
(declare-fun literal_10 () String)
(declare-fun x_14 () String)
(declare-fun literal_15 () String)
(declare-fun x_16 () String)
(assert (= literal_8 "\u{5c}\u{6e}\u{3c}\u{65}\u{6d}\u{62}\u{65}\u{64}\u{20}\u{73}\u{72}\u{63}\u{3d}\u{5c}\u{22}"))
(assert (= epsilon ""))
(assert (= literal_6 "\u{2f}\u{66}\u{69}\u{6c}\u{65}\u{2e}\u{70}\u{68}\u{70}\u{3f}\u{66}\u{69}\u{6c}\u{65}\u{3d}\u{2f}\u{2f}"))
(assert (= literal_5 "\u{2f}\u{66}\u{69}\u{6c}\u{65}\u{2e}\u{70}\u{68}\u{70}\u{2f}\u{2f}"))
(assert (or (= x_9 epsilon) (= x_9 literal_6) (= x_9 literal_5)))
(assert (= x_11 (str.++ literal_8 x_9)))
(assert (= literal_12 "\u{5c}\u{22}\u{20}\u{6e}\u{61}\u{6d}\u{65}\u{3d}\u{5c}\u{22}\u{6d}\u{73}\u{70}\u{6c}\u{61}\u{79}\u{65}\u{72}\u{5c}\u{22}\u{20}\u{74}\u{79}\u{70}\u{65}\u{3d}\u{5c}\u{22}"))
(assert (= x_13 (str.++ x_11 literal_12)))
(assert (= literal_10 "\u{74}\u{79}\u{70}\u{65}"))
(assert (= x_14 (str.++ x_13 literal_10)))
(assert (= literal_15 "\u{5c}\u{22}\u{20}"))
(assert (= x_16 (str.++ x_14 literal_15)))
(assert (str.in_re x_16 (re.++ (re.* re.allchar) (re.++ (str.to_re "\u{5c}\u{3c}\u{53}\u{43}\u{52}\u{49}\u{50}\u{54}") (re.* re.allchar)))))
(check-sat)
(exit)
