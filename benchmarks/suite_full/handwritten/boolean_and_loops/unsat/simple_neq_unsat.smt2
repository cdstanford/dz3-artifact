(assert (not (=
    re.none
    (re.inter
        (re.++ re.all (str.to_re "a"))
        (re.+ (str.to_re "b"))
    )
)))

(check-sat)
