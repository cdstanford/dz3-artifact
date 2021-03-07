(declare-const x String)
(assert (str.in_re x
    (re.inter
        (re.* (str.to_re "aaa"))
        (re.++ (str.to_re "a") (re.* (str.to_re "aaa")))
)))
(check-sat)
