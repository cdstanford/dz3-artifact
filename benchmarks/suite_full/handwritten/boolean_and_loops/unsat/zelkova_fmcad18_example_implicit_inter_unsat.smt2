(declare-const x String)
(assert (str.in_re x (re.++
    (str.to_re "ab")
    re.all
    (str.to_re "b")
    re.all
    (str.to_re "b")
    re.all
    (str.to_re "b")
)))
(assert (not (str.in_re x (re.++
    (str.to_re "a")
    re.all
    (str.to_re "b")
    re.all
    (str.to_re "b")
    re.all
    (str.to_re "b")
))))

(check-sat)
