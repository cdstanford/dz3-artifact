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
(declare-fun sigmaStar_2 () String)
(declare-fun sigmaStar_3 () String)
(declare-fun sigmaStar_4 () String)
(declare-fun literal_5 () String)
(declare-fun x_7 () String)
(declare-fun literal_8 () String)
(declare-fun x_9 () String)
(declare-fun literal_6 () String)
(declare-fun x_12 () String)
(declare-fun literal_10 () String)
(declare-fun x_13 () String)
(declare-fun literal_14 () String)
(declare-fun x_15 () String)
(declare-fun literal_11 () String)
(declare-fun x_18 () String)
(declare-fun literal_19 () String)
(declare-fun x_20 () String)
(declare-fun x_21 () String)
(declare-fun epsilon () String)
(declare-fun literal_17 () String)
(declare-fun x_22 () String)
(declare-fun literal_23 () String)
(declare-fun x_24 () String)
(assert (= literal_5 "\u{20}\u{20}\u{3c}\u{66}\u{72}\u{61}\u{6d}\u{65}\u{20}\u{73}\u{72}\u{63}\u{3d}\u{5c}\u{22}\u{76}\u{69}\u{65}\u{77}\u{61}\u{73}\u{73}\u{65}\u{73}\u{73}\u{6d}\u{65}\u{6e}\u{74}\u{2e}\u{70}\u{68}\u{70}\u{3f}\u{69}\u{64}\u{3d}"))
(assert (= x_7 (str.++ literal_5 sigmaStar_3)))
(assert (= literal_8 "\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{61}\u{69}\u{64}\u{3d}"))
(assert (= x_9 (str.++ x_7 literal_8)))
(assert (= literal_6 "\u{61}\u{69}\u{64}"))
(assert (= x_12 (str.++ x_9 literal_6)))
(assert (= literal_10 "\u{23}\u{73}\u{69}\u{64}\u{3d}"))
(assert (= x_13 (str.++ sigmaStar_1 literal_10)))
(assert (= literal_14 "\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{61}\u{6c}\u{6c}\u{6f}\u{77}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{73}\u{3d}"))
(assert (= x_15 (str.++ x_12 literal_14)))
(assert (= literal_11 "\u{61}\u{6c}\u{6c}\u{6f}\u{77}\u{63}\u{6f}\u{6d}\u{6d}\u{65}\u{6e}\u{74}\u{73}"))
(assert (= x_18 (str.++ x_15 literal_11)))
(assert (= literal_19 "\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{66}\u{72}\u{61}\u{6d}\u{65}\u{73}\u{65}\u{74}\u{3d}\u{62}\u{6f}\u{74}\u{74}\u{6f}\u{6d}\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{72}\u{65}\u{64}\u{69}\u{72}\u{65}\u{63}\u{74}\u{3d}"))
(assert (= x_20 (str.++ x_18 literal_19)))
(assert (= epsilon ""))
(assert (= literal_17 "\u{72}\u{65}\u{64}\u{69}\u{72}\u{65}\u{63}\u{74}"))
(assert (or (= x_21 epsilon) (= x_21 literal_17)))
(assert (= x_22 (str.++ x_20 x_21)))
(assert (= literal_23 "\u{5c}\u{22}\u{20}\u{2f}\u{3e}"))
(assert (= x_24 (str.++ x_22 literal_23)))
(assert (str.in_re x_24 (re.++ (re.* re.allchar) (re.++ (str.to_re "\u{5c}\u{3c}\u{53}\u{43}\u{52}\u{49}\u{50}\u{54}") (re.* re.allchar)))))
(check-sat)
(exit)
