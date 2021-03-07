;---
; .NET regular expressions restricted to 7-bit characters
; membership in
; (([^\0])+.)+[\0]([^\0])+
;---
(echo "==== sat ====")
(declare-const x String)
(assert (str.in_re x (re.++ (re.++ (re.+ (re.++ (re.+ (re.range (_ char #x1) (_ char #x7F))) re.allchar)) (str.to_re (_ char #x0))) (re.+ (re.range (_ char #x1) (_ char #x7F))))))
(check-sat)
(get-model)
