(declare-const x String)
(assert (str.in_re x
    (re.inter
        (re.* (str.to_re "ab"))
        (re.++ (str.to_re "a") (re.* (str.to_re "ba")))
)))
(check-sat)
