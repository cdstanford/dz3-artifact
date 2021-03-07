;---
; using 8-bit bit-vectors as characters
; check if regexA is not a subset of regexB
; regexA = ^((([A-Z]|[b-z]|[0-8]|\-|\.)+)@(([A-Z]|[b-z]|[0-8]|\-|\.)+)\.(([A-Z]|[b-z]){2,5}){1,25})+(((([A-Z]|[b-z]|[0-8]|\-|\.)+)@(([A-Z]|[b-z]|[0-8]|\-|\.)+)\.(([A-Z]|[b-z]){2,5}){1,25})+)*\z
; regexB = ^((([A-Z]|[a-z]|[0-9]|\-|\.)+)@(([A-Z]|[a-z]|[0-9]|\-|\.)+)\.(([A-Z]|[a-z]){2,5}){1,25})+(((([A-Z]|[a-z]|[0-9]|\-|\.)+)@(([A-Z]|[a-z]|[0-9]|\-|\.)+)\.(([A-Z]|[a-z]){2,5}){1,25})+)*\z
;---
(set-info :status unsat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const regexB (RegEx String))
(declare-const x String)

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.+ (re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z")))))(re.++ (re.range "@" "@")(re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z")))))(re.++ (re.range "." ".") ((_ re.loop 1 25) ((_ re.loop 2 5) (re.union (re.range "A" "Z") (re.range "b" "z")))))))))(re.++ (re.* (re.+ (re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z")))))(re.++ (re.range "@" "@")(re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z")))))(re.++ (re.range "." ".") ((_ re.loop 1 25) ((_ re.loop 2 5) (re.union (re.range "A" "Z") (re.range "b" "z")))))))))) (str.to_re ""))))))

(assert (= regexB (re.++ (str.to_re "")(re.++ (re.+ (re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))))(re.++ (re.range "@" "@")(re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))))(re.++ (re.range "." ".") ((_ re.loop 1 25) ((_ re.loop 2 5) (re.union (re.range "A" "Z") (re.range "a" "z")))))))))(re.++ (re.* (re.+ (re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))))(re.++ (re.range "@" "@")(re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))))(re.++ (re.range "." ".") ((_ re.loop 1 25) ((_ re.loop 2 5) (re.union (re.range "A" "Z") (re.range "a" "z")))))))))) (str.to_re ""))))))

;(assert (not (re-subset regexA regexB)))
;check that the difference is nonempty, contains some x
(assert (str.in_re x regexA))
(assert (not (str.in_re x regexB)))
(check-sat)
