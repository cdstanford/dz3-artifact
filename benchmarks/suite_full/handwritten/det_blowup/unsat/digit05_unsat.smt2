;---
; .NET regular expressions restricted to 8-bit characters
; membership in intersection of
; .*\d.{5}
; .*[^\d].{5} 
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.++ (re.++ re.all (re.range "0" "9")) ((_ re.^ 5) re.allchar)) (re.++ (re.++ re.all (re.union (re.range (_ char #x0) "/") (re.range ":" (_ char #xFF)))) ((_ re.^ 5) re.allchar)))))
(check-sat)
(get-model)