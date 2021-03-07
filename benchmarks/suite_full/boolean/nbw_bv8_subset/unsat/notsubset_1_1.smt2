;---
; using 8-bit bit-vectors as characters
; check if regexA is not a subset of regexB
; regexA = ^\$?([1-9]{1,3},?([1-9]{3},?)*[1-9]{3}(\.[1-9]{0,2})?|[1-9]{1,3}(\.[1-9]{0,2})?|\.([1-9]{1,2})?)\z
; regexB = ^\$?(\d{1,3},?(\d{3},?)*\d{3}(\.\d{0,2})?|\d{1,3}(\.\d{0,2})?|\.(\d{1,2})?)\z
;---
(set-info :status unsat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const regexB (RegEx String))
(declare-const x String)

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.opt (re.range "$" "$"))(re.++ (re.union (re.++ ((_ re.loop 1 3) (re.range "1" "9"))(re.++ (re.opt (re.range "," ","))(re.++ (re.* (re.++ ((_ re.loop 3 3) (re.range "1" "9")) (re.opt (re.range "," ","))))(re.++ ((_ re.loop 3 3) (re.range "1" "9")) (re.opt (re.++ (re.range "." ".") ((_ re.loop 0 2) (re.range "1" "9"))))))))(re.union (re.++ ((_ re.loop 1 3) (re.range "1" "9")) (re.opt (re.++ (re.range "." ".") ((_ re.loop 0 2) (re.range "1" "9"))))) (re.++ (re.range "." ".") (re.opt ((_ re.loop 1 2) (re.range "1" "9")))))) (str.to_re ""))))))

(assert (= regexB (re.++ (str.to_re "")(re.++ (re.opt (re.range "$" "$"))(re.++ (re.union (re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.opt (re.range "," ","))(re.++ (re.* (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.range "," ","))))(re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.++ (re.range "." ".") ((_ re.loop 0 2) (re.range "0" "9"))))))))(re.union (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (re.opt (re.++ (re.range "." ".") ((_ re.loop 0 2) (re.range "0" "9"))))) (re.++ (re.range "." ".") (re.opt ((_ re.loop 1 2) (re.range "0" "9")))))) (str.to_re ""))))))

;(assert (not (re-subset regexA regexB)))
;check that the difference is nonempty, contains some x
(assert (str.in_re x regexA))
(assert (not (str.in_re x regexB)))
(check-sat)
