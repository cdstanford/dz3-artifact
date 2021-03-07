(echo "====== password constraint examples ======")

(echo "==== sat ====")

;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*[a-z].*
; .*[0-9].*
; .*[A-Z].*
; .{8,20}
; (?(mypass1)[0-[0]]|.*) ; COMMENT: complement(mypass1)
; (?(mypass2)[0-[0]]|.*) ; COMMENT: complement(mypass2)
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.inter (re.inter (re.inter (re.++ (re.++ re.all (re.range "a" "z")) re.all) (re.++ (re.++ re.all (re.range "0" "9")) re.all)) (re.++ (re.++ re.all (re.range "A" "Z")) re.all)) ((_ re.loop 8 20) re.allchar)) (re.union (re.inter (str.to_re "mypass1") re.none) (re.inter (re.comp (str.to_re "mypass1")) re.all))) (re.union (re.inter (str.to_re "mypass2") re.none) (re.inter (re.comp (str.to_re "mypass2")) re.all)))))
(check-sat)
(get-model)
