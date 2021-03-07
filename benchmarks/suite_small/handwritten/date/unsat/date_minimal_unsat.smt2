;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; [0-3][0-9]-[a-zA-Z]{3}-[0-9]{4}
; (?i:.*(jan|mar).*)
; (?(.*(?i:feb).*)([012].*)|.*)
; .{10}(a|..)
; (the last constraint makes it unsat)
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.++ ((_ re.^ 10) re.allchar) (re.union (str.to_re "a") (re.++ re.allchar re.allchar))) (re.inter (re.inter (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.range "0" "3") (re.range "0" "9")) (str.to_re "-")) ((_ re.^ 3) (re.union (re.range "A" "Z") (re.range "a" "z")))) (str.to_re "-")) ((_ re.^ 4) (re.range "0" "9"))) (str.to_re "")) (re.++ (re.++ re.all (re.union (re.++ (re.++ (re.union (str.to_re "J") (str.to_re "j")) (re.union (str.to_re "A") (str.to_re "a"))) (re.union (str.to_re "N") (str.to_re "n"))) (re.++ (re.++ (re.union (str.to_re "M") (str.to_re "m")) (re.union (str.to_re "A") (str.to_re "a"))) (re.union (str.to_re "R") (str.to_re "r"))))) re.all)) (re.union (re.inter (re.++ (re.++ (re.++ (re.++ re.all (re.union (str.to_re "F") (str.to_re "f"))) (re.union (str.to_re "E") (str.to_re "e"))) (re.union (str.to_re "B") (str.to_re "b"))) re.all) (re.++ (re.range "0" "2") re.all)) (re.inter (re.comp (re.++ (re.++ (re.++ (re.++ re.all (re.union (str.to_re "F") (str.to_re "f"))) (re.union (str.to_re "E") (str.to_re "e"))) (re.union (str.to_re "B") (str.to_re "b"))) re.all)) re.all))))))
(check-sat)
(get-model)
