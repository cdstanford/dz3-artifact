(echo "====== password constraint examples ======")

(echo "==== sat ====")

;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*[a-z].*
; .*[0-9].*
; .*[A-Z].*
; .{8,20}
; (?(.*0.*O.*)[0-[0]]|.*)
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.inter (re.inter (re.++ (re.++ re.all (re.range "a" "z")) re.all) (re.++ (re.++ re.all (re.range "0" "9")) re.all)) (re.++ (re.++ re.all (re.range "A" "Z")) re.all)) ((_ re.loop 8 20) re.allchar)) (re.union (re.inter (re.++ (re.++ (re.++ (re.++ re.all (str.to_re "0")) re.all) (str.to_re "O")) re.all) re.none) (re.inter (re.comp (re.++ (re.++ (re.++ (re.++ re.all (str.to_re "0")) re.all) (str.to_re "O")) re.all)) re.all)))))
(check-sat)
(get-model)
