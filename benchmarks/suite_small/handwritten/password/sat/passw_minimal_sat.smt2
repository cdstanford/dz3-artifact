;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*a.*
; b* 
;---
(assert (= re.empty (re.inter (re.++ (re.++ re.all (str.to_re "a")) re.all) (re.* (str.to_re "b")))))
(check-sat)
(get-model)
