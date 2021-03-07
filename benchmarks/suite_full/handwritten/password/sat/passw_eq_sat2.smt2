(assert (=
    re.none
    (re.inter
        (re.++ re.all (re.range "a" "z") re.all)
        (re.* (re.range "A" "Z"))
    )
))

(check-sat)
