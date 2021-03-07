(assert (=
    (re.inter
        (re.++ re.all (re.range "a" "z") re.all)
        (re.++ re.all (re.range "0" "9") re.all)
        (re.comp (str.to_re "mypass1"))
        (re.comp (str.to_re "mypass2"))
    )
    (re.inter
        (re.++ re.all (re.range "a" "z") re.all)
        (re.++ re.all (re.range "0" "9") re.all)
    )
))

(check-sat)
