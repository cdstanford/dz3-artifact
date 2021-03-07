;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*\d.{20}
; .*[^\d].{20} 
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.++ (re.++ re.all (re.range "0" "9")) ((_ re.^ 20) re.allchar)) (re.++ (re.++ re.all (re.union (re.range (_ char #x0) "/") (re.range ":" (_ char #x7F)))) ((_ re.^ 20) re.allchar)))))
(check-sat)
(get-model)