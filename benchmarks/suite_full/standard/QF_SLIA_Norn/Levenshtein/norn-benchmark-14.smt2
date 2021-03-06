(set-info :smt-lib-version 2.6)
(set-logic QF_SLIA)
(set-info :source |
Generated by: Parosh Aziz Abdulla, Mohamed Faouzi Atig, Yu-Fang Chen, Lukáš Holík, Ahmed Rezine, Philipp Rümmer, Jari Stenman
Generated on: 2015-03-09
Generator: Eldarica
Application: CEGAR based model checking for string programs
Target solver: Norn
Publication: "String constraints for verification" by P.A. Abdulla, M.F. Atig, Y.F. Chen, L. Holík, A. Rezine, P. Rümmer, and J. Stenman, CAV 2014.
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)

(declare-fun var_0 () String)
(declare-fun var_1 () String)
(declare-fun var_2 () String)
(declare-fun var_3 () String)
(declare-fun var_4 () String)
(declare-fun var_5 () String)
(declare-fun var_6 () String)
(declare-fun var_7 () String)
(declare-fun var_8 () String)
(declare-fun var_9 () String)
(declare-fun var_10 () String)
(declare-fun var_11 () String)
(declare-fun var_12 () String)

(assert (str.in_re (str.++ var_3 var_4 ) (re.union (re.++ (str.to_re "a") (str.to_re "b")) (re.++ (str.to_re "b") (str.to_re "a")))))
(assert (and (and (and (and (and (and (<= (+ (str.len var_4) (- 1) ) 0 ) (<= 0  (+ (str.len var_4) (- 1) ))) (and (<= (+ (str.len var_3) (- 1) ) 0 ) (<= 0  (+ (str.len var_3) (- 1) )))) (and (<= (+ (+ (str.len var_5) (* (- 1)  (str.len var_1))) 1 ) 0 ) (<= 0  (+ (+ (str.len var_5) (* (- 1)  (str.len var_1))) 1 )))) (and (<= (+ (+ (str.len var_6) (* (- 1)  (str.len var_2))) 1 ) 0 ) (<= 0  (+ (+ (str.len var_6) (* (- 1)  (str.len var_2))) 1 )))) (<= 0  (+ (str.len var_1) (- 1) ))) (<= 0  (+ (str.len var_2) (- 1) ))))
(check-sat)
(exit)
