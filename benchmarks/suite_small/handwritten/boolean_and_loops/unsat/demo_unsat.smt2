;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; b*ab*
; .*b.*b.*
; (ab)* 
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.++ (re.++ (re.* (str.to_re "b")) (str.to_re "a")) (re.* (str.to_re "b"))) (re.++ (re.++ (re.++ (re.++ re.all (str.to_re "b")) re.all) (str.to_re "b")) re.all)) (re.* (str.to_re "ab")))))
(check-sat)
(get-model)