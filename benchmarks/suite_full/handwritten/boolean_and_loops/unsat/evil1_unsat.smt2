;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; (([a-z])+.)+[A-Z]([a-z])+
; aaaaaaaaaaaaaaaaaaaa 
;---
(echo "==== unsat ====")

(declare-const x String)
(assert (str.in_re x (re.inter (re.++ (re.++ (re.+ (re.++ (re.+ (re.range "a" "z")) re.allchar)) (re.range "A" "Z")) (re.+ (re.range "a" "z"))) (str.to_re "aaaaaaaaaaaaaaaaaaaa"))))
(check-sat)
