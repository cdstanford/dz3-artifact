;---
; .NET regular expressions restricted to 7-bit characters
; membership in 
; (?(ab.*b.*b.*b)(?(a.*b.*b.*b)[0-[0]]|.*)|[0-[0]]) 
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (str.to_re "ab") re.all) (str.to_re "b")) re.all) (str.to_re "b")) re.all) (str.to_re "b")) (re.union (re.inter (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (str.to_re "a") re.all) (str.to_re "b")) re.all) (str.to_re "b")) re.all) (str.to_re "b")) re.none) (re.inter (re.comp (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (str.to_re "a") re.all) (str.to_re "b")) re.all) (str.to_re "b")) re.all) (str.to_re "b"))) re.all)))))
(check-sat)
(get-model)