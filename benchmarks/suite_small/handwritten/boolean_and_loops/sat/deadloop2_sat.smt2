;---
; .NET regular expressions restricted to 7-bit characters
; membership in 
; abcd(bcd)*cd(?(a)b|[0-[0]])|abcdef+g|abef+g 
;---
(declare-const x String)
(assert (str.in_re x (re.union (re.union (re.++ (re.++ (re.++ (str.to_re "abcd") (re.* (str.to_re "bcd"))) (str.to_re "cd")) (re.inter (str.to_re "a") (str.to_re "b"))) (re.++ (re.++ (str.to_re "abcde") (re.+ (str.to_re "f"))) (str.to_re "g"))) (re.++ (re.++ (str.to_re "abe") (re.+ (str.to_re "f"))) (str.to_re "g")))))
(check-sat)
(get-model)