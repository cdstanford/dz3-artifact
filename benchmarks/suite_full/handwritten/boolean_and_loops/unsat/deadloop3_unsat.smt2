;---
; .NET regular expressions restricted to 7-bit characters
; membership in 
; bc(abc)*ade (empty)
;---
(declare-const x String)
(assert (str.in_re x (re.++ (re.++ (str.to_re "xyzbc") (re.* (str.to_re "abcde"))) (re.++ (str.to_re "abxxxxxxxxxxxxxxxxxxxxxx") (re.inter
    (re.+ (str.to_re "a"))
    (re.* (str.to_re "b"))
)))))
(check-sat)
