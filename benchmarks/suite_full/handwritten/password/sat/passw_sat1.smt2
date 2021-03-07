;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*[a-z].*
; .*[A-Z].*
; .*[0-9].*
; [!-~]{0,3} 
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.inter (re.++ (re.++ re.all (re.range "a" "z")) re.all) (re.++ (re.++ re.all (re.range "A" "Z")) re.all)) (re.++ (re.++ re.all (re.range "0" "9")) re.all)) ((_ re.loop 0 3) (re.range "!" "~")))))
(check-sat)
(get-model)
