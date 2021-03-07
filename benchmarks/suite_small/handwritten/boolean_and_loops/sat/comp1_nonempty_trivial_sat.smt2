(declare-const x String)
(assert (str.in_re x (re.comp (re.++ (re.++ re.all (str.to_re "a")) ((_ re.^ 8) re.allchar)))))
(check-sat)
