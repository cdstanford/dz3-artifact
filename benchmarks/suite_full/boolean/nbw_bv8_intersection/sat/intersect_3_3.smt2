;---
; using 8-bit bit-vectors as characters
; check intersection nonemptiness of .Net regexes
; regexA = ^([A-Z]|[b-z]|[0-8])(((\.|\-)?([A-Z]|[b-z]|[0-8])+)*)@(([A-Z]|[b-z]|[0-8])+)(((\.|\-)?([A-Z]|[b-z]|[0-8])+)*)\. (([A-Z]|[b-z])([A-Z]|[b-z])+)\z
; regexB = ^([A-Z]|[a-z]|[0-9])(((\.|\-)?([A-Z]|[a-z]|[0-9])+)*)@(([A-Z]|[a-z]|[0-9])+)(((\.|\-)?([A-Z]|[a-z]|[0-9])+)*)\. (([A-Z]|[a-z])([A-Z]|[a-z])+)\z
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const regexB (RegEx String))
(declare-const x String)

;witness: "b@g. Nc"
(define-fun Witness () String (seq.++ "b" (seq.++ "@" (seq.++ "g" (seq.++ "." (seq.++ " " (seq.++ "N" (seq.++ "c" ""))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z")))(re.++ (re.* (re.++ (re.opt (re.range "-" ".")) (re.+ (re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z"))))))(re.++ (re.range "@" "@")(re.++ (re.+ (re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z"))))(re.++ (re.* (re.++ (re.opt (re.range "-" ".")) (re.+ (re.union (re.range "0" "8")(re.union (re.range "A" "Z") (re.range "b" "z"))))))(re.++ (str.to_re (seq.++ "." (seq.++ " " "")))(re.++ (re.++ (re.union (re.range "A" "Z") (re.range "b" "z")) (re.+ (re.union (re.range "A" "Z") (re.range "b" "z")))) (str.to_re "")))))))))))

(assert (= regexB (re.++ (str.to_re "")(re.++ (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))(re.++ (re.* (re.++ (re.opt (re.range "-" ".")) (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z"))))))(re.++ (re.range "@" "@")(re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z"))))(re.++ (re.* (re.++ (re.opt (re.range "-" ".")) (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z"))))))(re.++ (str.to_re (seq.++ "." (seq.++ " " "")))(re.++ (re.++ (re.union (re.range "A" "Z") (re.range "a" "z")) (re.+ (re.union (re.range "A" "Z") (re.range "a" "z")))) (str.to_re "")))))))))))

;check that the intersection is nonempty, contains some x
(assert (str.in_re x regexA))
(assert (str.in_re x regexB))
;check also the concrete witness
(assert (str.in_re Witness regexA))
(assert (str.in_re Witness regexB))
(check-sat)
