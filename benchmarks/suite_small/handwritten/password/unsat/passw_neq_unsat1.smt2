(assert (not (=
    re.none
    (re.inter
        (re.++ re.all (re.range "a" "z") re.all)
        (re.++ re.all (re.range "0" "9") re.all)
        (re.++ re.all (re.range "A" "Z") re.all)
        ((_ re.loop 8 20) re.allchar)
        (re.* (re.range "A" "Z"))
    )
)))

(check-sat)
