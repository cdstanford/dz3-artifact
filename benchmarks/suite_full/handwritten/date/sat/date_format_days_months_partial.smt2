(declare-fun field_date () String)
(assert (let ((a!1 (re.++ (re.range "0" "9")
                  (re.++ (re.range "0" "9")
                         (re.++ (re.range "0" "9") (re.range "0" "9")))))
      (a!5 (str.in.re field_date
                      (re.++ (str.to.re "3") (re.++ (str.to.re "0") re.all))))
      (a!6 (str.in.re field_date
                      (re.++ (str.to.re "3") (re.++ (str.to.re "1") re.all))))
      (a!8 (str.in.re field_date
                      (re.++ (str.to.re "0") (re.++ (str.to.re "0") re.all))))
      (a!9 (re.++ (re.union (str.to.re "a") (str.to.re "A"))
                  (re.++ (re.union (str.to.re "n") (str.to.re "N")) re.all)))
      (a!11 (re.++ (re.union (str.to.re "e") (str.to.re "E"))
                   (re.++ (re.union (str.to.re "b") (str.to.re "B")) re.all))))
(let ((a!2 (re.++ (re.union (re.range "A" "Z") (re.range "a" "z"))
                  (re.++ (re.union (re.range "A" "Z") (re.range "a" "z"))
                         (re.++ (str.to.re "-") a!1))))
      (a!7 (or (str.in.re field_date (re.++ (str.to.re "0") re.all))
               (str.in.re field_date (re.++ (str.to.re "1") re.all))
               (str.in.re field_date (re.++ (str.to.re "2") re.all))
               a!5
               a!6))
      (a!10 (re.++ re.all
                   (re.++ (re.union (str.to.re "j") (str.to.re "J")) a!9)))
      (a!12 (re.++ re.all
                   (re.++ (re.union (str.to.re "f") (str.to.re "F")) a!11))))
(let ((a!3 (re.++ (str.to.re "-")
                  (re.++ (re.union (re.range "A" "Z") (re.range "a" "z")) a!2))))
(let ((a!4 (str.in.re field_date
                      (re.++ (re.range "0" "9") (re.++ (re.range "0" "9") a!3)))))
  (and a!4
       a!7
       (not a!8)
       (or (str.in.re field_date a!10) (str.in.re field_date a!12))
       (or (not (str.in.re field_date a!12)) (and (not a!5) (not a!6)))))))))

(check-sat)
(get-model)