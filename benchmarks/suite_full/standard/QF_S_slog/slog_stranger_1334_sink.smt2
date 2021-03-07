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
(declare-fun sigmaStar_5 () String)
(declare-fun sigmaStar_6 () String)
(declare-fun sigmaStar_7 () String)
(declare-fun sigmaStar_8 () String)
(declare-fun sigmaStar_9 () String)
(declare-fun sigmaStar_10 () String)
(declare-fun sigmaStar_11 () String)
(declare-fun sigmaStar_12 () String)
(declare-fun sigmaStar_13 () String)
(declare-fun sigmaStar_14 () String)
(declare-fun sigmaStar_15 () String)
(declare-fun sigmaStar_16 () String)
(declare-fun sigmaStar_17 () String)
(declare-fun sigmaStar_18 () String)
(declare-fun sigmaStar_19 () String)
(declare-fun sigmaStar_20 () String)
(declare-fun sigmaStar_21 () String)
(declare-fun sigmaStar_22 () String)
(declare-fun sigmaStar_25 () String)
(declare-fun sigmaStar_31 () String)
(declare-fun sigmaStar_39 () String)
(declare-fun sigmaStar_42 () String)
(declare-fun sigmaStar_48 () String)
(declare-fun sigmaStar_53 () String)
(declare-fun sigmaStar_58 () String)
(declare-fun sigmaStar_63 () String)
(declare-fun literal_89 () String)
(declare-fun x_90 () String)
(declare-fun literal_73 () String)
(declare-fun literal_77 () String)
(declare-fun x_93 () String)
(declare-fun literal_94 () String)
(declare-fun x_95 () String)
(declare-fun x_96 () String)
(declare-fun literal_87 () String)
(declare-fun literal_92 () String)
(declare-fun x_97 () String)
(declare-fun literal_98 () String)
(declare-fun x_99 () String)
(declare-fun literal_102 () String)
(declare-fun x_103 () String)
(declare-fun literal_101 () String)
(declare-fun x_104 () String)
(declare-fun literal_105 () String)
(declare-fun x_106 () String)
(assert (= literal_89 "\u{3c}\u{61}\u{20}\u{68}\u{72}\u{65}\u{66}\u{3d}\u{22}\u{73}\u{65}\u{61}\u{72}\u{63}\u{68}\u{2e}\u{70}\u{68}\u{70}\u{3f}\u{69}\u{64}\u{3d}\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{75}\u{73}\u{65}\u{72}\u{3d}\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{75}\u{73}\u{65}\u{72}\u{69}\u{64}\u{3d}\u{75}\u{73}\u{65}\u{72}\u{69}\u{64}\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{66}\u{6f}\u{72}\u{75}\u{6d}\u{69}\u{64}\u{3d}\u{66}\u{6f}\u{72}\u{75}\u{6d}\u{69}\u{64}\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{73}\u{75}\u{62}\u{6a}\u{65}\u{63}\u{74}\u{3d}\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{70}\u{68}\u{72}\u{61}\u{73}\u{65}\u{3d}\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{77}\u{6f}\u{72}\u{64}\u{73}\u{3d}\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{66}\u{75}\u{6c}\u{6c}\u{77}\u{6f}\u{72}\u{64}\u{73}\u{3d}\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{6e}\u{6f}\u{74}\u{77}\u{6f}\u{72}\u{64}\u{73}\u{3d}\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{64}\u{61}\u{74}\u{65}\u{74}\u{6f}\u{3d}"))
(assert (= literal_73 "\u{74}\u{6f}\u{79}\u{65}\u{61}\u{72}"))
(assert (= literal_77 "\u{64}\u{61}\u{74}\u{65}\u{74}\u{6f}"))
(assert (or (= x_90 literal_73) (= x_90 literal_77)))
(assert (= x_93 (str.++ literal_89 x_90)))
(assert (= literal_94 "\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{64}\u{61}\u{74}\u{65}\u{66}\u{72}\u{6f}\u{6d}\u{3d}"))
(assert (= x_95 (str.++ x_93 literal_94)))
(assert (= literal_87 "\u{66}\u{72}\u{6f}\u{6d}\u{79}\u{65}\u{61}\u{72}"))
(assert (= literal_92 "\u{64}\u{61}\u{74}\u{65}\u{66}\u{72}\u{6f}\u{6d}"))
(assert (or (= x_96 literal_87) (= x_96 literal_92)))
(assert (= x_97 (str.++ x_95 x_96)))
(assert (= literal_98 "\u{26}\u{61}\u{6d}\u{70}\u{3b}\u{73}\u{68}\u{6f}\u{77}\u{66}\u{6f}\u{72}\u{6d}\u{3d}\u{31}"))
(assert (= x_99 (str.++ x_97 literal_98)))
(assert (= literal_102 "\u{22}\u{3e}"))
(assert (= x_103 (str.++ x_99 literal_102)))
(assert (= literal_101 "\u{61}\u{64}\u{76}\u{61}\u{6e}\u{63}\u{65}\u{64}\u{73}\u{65}\u{61}\u{72}\u{63}\u{68}"))
(assert (= x_104 (str.++ x_103 literal_101)))
(assert (= literal_105 "\u{2e}\u{2e}\u{2e}\u{3c}\u{2f}\u{61}\u{3e}"))
(assert (= x_106 (str.++ x_104 literal_105)))
(assert (str.in_re x_106 (re.++ (re.* re.allchar) (re.++ (str.to_re "\u{5c}\u{3c}\u{53}\u{43}\u{52}\u{49}\u{50}\u{54}") (re.* re.allchar)))))
(check-sat)
(exit)
