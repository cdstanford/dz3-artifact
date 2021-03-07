(declare-const x String)
(assert (str.in_re x
    (re.inter
        (re.++ re.all (re.range "0" "0"))
        (re.* (re.range "1" "1"))
)))
(check-sat)
