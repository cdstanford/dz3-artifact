(assert (= re.empty (re.diff ((_ re.^ 7) re.allchar) (re.comp (re.++ (re.++ re.all (str.to_re "a")) ((_ re.^ 7) re.allchar))))))
(check-sat)
