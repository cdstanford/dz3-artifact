(echo "====== password constraint examples ======")

(echo "==== unsat ====")

;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*[a-z].*
; .*[0-9].*[0-9].*
; .*[A-Z].*
; .*[$!@#%^&*()].*
; .{1,4}
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.inter (re.inter (re.++ (re.++ re.all (re.range "a" "z")) re.all) (re.++ (re.++ (re.++ (re.++ re.all (re.range "0" "9")) re.all) (re.range "0" "9")) re.all)) (re.++ (re.++ re.all (re.range "A" "Z")) re.all)) (re.++ (re.++ re.all (re.union (re.union (re.union (re.union (str.to_re "!") (re.range "#" "&")) (re.range "(" "*")) (str.to_re "@")) (str.to_re "^"))) re.all)) ((_ re.loop 1 4) re.allchar))))
(check-sat)
