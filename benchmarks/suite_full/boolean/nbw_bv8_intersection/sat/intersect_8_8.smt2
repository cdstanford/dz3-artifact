;---
; using 8-bit bit-vectors as characters
; check intersection nonemptiness of .Net regexes
; regexA = ^((([A-Z]|[b-z]|[0-8]|\-|\.)+)@(([A-Z]|[b-z]|[0-8]|\-|\.)+)\.(([A-Z]|[b-z]){2,5}){1,25})+(((([A-Z]|[b-z]|[0-8]|\-|\.)+)@(([A-Z]|[b-z]|[0-8]|\-|\.)+)\.(([A-Z]|[b-z]){2,5}){1,25})+)*\z
; regexB = ^((([A-Z]|[a-z]|[0-9]|\-|\.)+)@(([A-Z]|[a-z]|[0-9]|\-|\.)+)\.(([A-Z]|[a-z]){2,5}){1,25})+(((([A-Z]|[a-z]|[0-9]|\-|\.)+)@(([A-Z]|[a-z]|[0-9]|\-|\.)+)\.(([A-Z]|[a-z]){2,5}){1,25})+)*\z
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const regexB (RegEx String))
(declare-const x String)

;witness: "1@-.Dd"
(define-fun Witness () String (seq.++ "1" (seq.++ "@" (seq.++ "-" (seq.++ "." (seq.++ "D" (seq.++ "d" "")))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.+ (re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z")))))(re.++ (re.range "@" "@")(re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z")))))(re.++ (re.range "." ".") ((_ re.loop 1 25) ((_ re.loop 2 5) (re.union (re.range "A" "Z") (re.range "b" "z")))))))))(re.++ (re.* (re.+ (re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z")))))(re.++ (re.range "@" "@")(re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z")))))(re.++ (re.range "." ".") ((_ re.loop 1 25) ((_ re.loop 2 5) (re.union (re.range "A" "Z") (re.range "b" "z")))))))))) (str.to_re ""))))))

(assert (= regexB (re.++ (str.to_re "")(re.++ (re.+ (re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))))(re.++ (re.range "@" "@")(re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))))(re.++ (re.range "." ".") ((_ re.loop 1 25) ((_ re.loop 2 5) (re.union (re.range "A" "Z") (re.range "a" "z")))))))))(re.++ (re.* (re.+ (re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))))(re.++ (re.range "@" "@")(re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))))(re.++ (re.range "." ".") ((_ re.loop 1 25) ((_ re.loop 2 5) (re.union (re.range "A" "Z") (re.range "a" "z")))))))))) (str.to_re ""))))))

;check that the intersection is nonempty, contains some x
(assert (str.in_re x regexA))
(assert (str.in_re x regexB))
;check also the concrete witness
(assert (str.in_re Witness regexA))
(assert (str.in_re Witness regexB))
(check-sat)
