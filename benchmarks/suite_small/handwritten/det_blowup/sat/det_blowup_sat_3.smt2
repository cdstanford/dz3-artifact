(declare-const x String)

(assert (str.in_re x
    (re.+ (re.++ re.all (str.to_re "a") ((_ re.^ 3) re.allchar)))
))

(check-sat)
(get-model)
