(echo "====== password constraint examples ======")

(echo "==== unsat ====")

;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*[a-z].*
; .{8-10}
; .{11-20}
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.++ (re.++ re.all (re.range "a" "z")) re.all) (re.++ re.allchar (str.to_re "{8-10}"))) (re.++ re.allchar (str.to_re "{11-20}")))))
(check-sat)
