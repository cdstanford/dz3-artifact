;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; [0-3][0-9]-[a-zA-Z]{3}-[0-9]{4}
; (.*(jan|feb|jul).*)
; complement([012].*feb.*)
;---
(declare-const x String)
(assert (str.in_re x (re.inter
    (re.++
        (re.range "0" "3")
        (re.range "0" "9")
        (str.to_re "-")
        ((_ re.^ 3) (re.union (re.range "A" "Z") (re.range "a" "z")))
        (str.to_re "-")
        ((_ re.^ 4) (re.range "0" "9")))
    (re.++
        re.all
        (re.union (str.to_re "jan") (str.to_re "feb") (str.to_re "jul"))
        re.all)
    (re.complement
        (re.++
            (str.to_re "3")
            re.all
            (str.to_re "feb")
            re.all))
)))

(check-sat)
(get-model)
