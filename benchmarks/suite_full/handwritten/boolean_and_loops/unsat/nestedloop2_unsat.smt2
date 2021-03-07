;---
; .NET regular expressions restricted to 7-bit characters
; membership in 
; ((a(bc)*)*d(((bc)+(a(bc)*)*)d(abc(a(bc)*)*d(((bc)+(a(bc)*)*)d(?(a)(b)|[0-[0]]))))) 
;---
(declare-const x String)
(assert (str.in_re x (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.* (re.++ (str.to_re "a") (re.* (str.to_re "bc")))) (str.to_re "d")) (re.+ (str.to_re "bc"))) (re.* (re.++ (str.to_re "a") (re.* (str.to_re "bc"))))) (str.to_re "dabc")) (re.* (re.++ (str.to_re "a") (re.* (str.to_re "bc"))))) (str.to_re "d")) (re.+ (str.to_re "bc"))) (re.* (re.++ (str.to_re "a") (re.* (str.to_re "bc"))))) (str.to_re "d")) (re.inter (str.to_re "a") (str.to_re "b")))))
(check-sat)
