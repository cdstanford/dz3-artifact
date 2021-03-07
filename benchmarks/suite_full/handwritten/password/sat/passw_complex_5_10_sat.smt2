;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*[a-z].*
; .*[A-Z].*
; .*[0-9].*
; .*(\W|_).*
; [!-~]*
; (?(?i:.*pa[s\$5][s\$5]w[o0]rd.*)[0-[0]]|.*)
; (?(.*(012|123|234|345|456|567|678|789).*)[0-[0]]|.*)
; .{5,10} 
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.inter (re.inter (re.inter (re.inter (re.inter (re.++ (re.++ re.all (re.range "a" "z")) re.all) (re.++ (re.++ re.all (re.range "A" "Z")) re.all)) (re.++ (re.++ re.all (re.range "0" "9")) re.all)) (re.++ (re.++ re.all (re.union (re.union (re.union (re.union (re.union (re.range (_ char #x0) "/") (re.range ":" "@")) (re.range "[" "^")) (str.to_re "`")) (re.range "{" (_ char #x7F))) (str.to_re "_"))) re.all)) (re.* (re.range "!" "~"))) (re.union (re.inter (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ re.all (re.union (str.to_re "P") (str.to_re "p"))) (re.union (str.to_re "A") (str.to_re "a"))) (re.union (re.union (re.union (str.to_re "$") (str.to_re "5")) (str.to_re "S")) (str.to_re "s"))) (re.union (re.union (re.union (str.to_re "$") (str.to_re "5")) (str.to_re "S")) (str.to_re "s"))) (re.union (str.to_re "W") (str.to_re "w"))) (re.union (re.union (str.to_re "0") (str.to_re "O")) (str.to_re "o"))) (re.union (str.to_re "R") (str.to_re "r"))) (re.union (str.to_re "D") (str.to_re "d"))) re.all) re.none) (re.inter (re.comp (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ re.all (re.union (str.to_re "P") (str.to_re "p"))) (re.union (str.to_re "A") (str.to_re "a"))) (re.union (re.union (re.union (str.to_re "$") (str.to_re "5")) (str.to_re "S")) (str.to_re "s"))) (re.union (re.union (re.union (str.to_re "$") (str.to_re "5")) (str.to_re "S")) (str.to_re "s"))) (re.union (str.to_re "W") (str.to_re "w"))) (re.union (re.union (str.to_re "0") (str.to_re "O")) (str.to_re "o"))) (re.union (str.to_re "R") (str.to_re "r"))) (re.union (str.to_re "D") (str.to_re "d"))) re.all)) re.all))) (re.union (re.inter (re.++ (re.++ re.all (re.union (re.union (re.union (re.union (re.union (re.union (re.union (str.to_re "012") (str.to_re "123")) (str.to_re "234")) (str.to_re "345")) (str.to_re "456")) (str.to_re "567")) (str.to_re "678")) (str.to_re "789"))) re.all) re.none) (re.inter (re.comp (re.++ (re.++ re.all (re.union (re.union (re.union (re.union (re.union (re.union (re.union (str.to_re "012") (str.to_re "123")) (str.to_re "234")) (str.to_re "345")) (str.to_re "456")) (str.to_re "567")) (str.to_re "678")) (str.to_re "789"))) re.all)) re.all))) ((_ re.loop 5 10) re.allchar))))
(check-sat)
(get-model)