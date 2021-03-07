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
                   (re.++ (re.union (str.to.re "b") (str.to.re "B")) re.all)))
      (a!13 (re.++ (re.union (str.to.re "a") (str.to.re "A"))
                   (re.++ (re.union (str.to.re "r") (str.to.re "R")) re.all)))
      (a!15 (re.++ (re.union (str.to.re "p") (str.to.re "P"))
                   (re.++ (re.union (str.to.re "r") (str.to.re "R")) re.all)))
      (a!17 (re.++ (re.union (str.to.re "a") (str.to.re "A"))
                   (re.++ (re.union (str.to.re "y") (str.to.re "Y")) re.all)))
      (a!19 (re.++ (re.union (str.to.re "u") (str.to.re "U"))
                   (re.++ (re.union (str.to.re "n") (str.to.re "N")) re.all)))
      (a!21 (re.++ (re.union (str.to.re "u") (str.to.re "U"))
                   (re.++ (re.union (str.to.re "l") (str.to.re "L")) re.all)))
      (a!23 (re.++ (re.union (str.to.re "u") (str.to.re "U"))
                   (re.++ (re.union (str.to.re "g") (str.to.re "G")) re.all)))
      (a!25 (re.++ (re.union (str.to.re "e") (str.to.re "E"))
                   (re.++ (re.union (str.to.re "p") (str.to.re "P")) re.all)))
      (a!27 (re.++ (re.union (str.to.re "c") (str.to.re "C"))
                   (re.++ (re.union (str.to.re "t") (str.to.re "T")) re.all)))
      (a!29 (re.++ (re.union (str.to.re "o") (str.to.re "O"))
                   (re.++ (re.union (str.to.re "v") (str.to.re "V")) re.all)))
      (a!31 (re.++ (re.union (str.to.re "e") (str.to.re "E"))
                   (re.++ (re.union (str.to.re "c") (str.to.re "C")) re.all))))
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
                   (re.++ (re.union (str.to.re "f") (str.to.re "F")) a!11)))
      (a!14 (re.++ re.all
                   (re.++ (re.union (str.to.re "m") (str.to.re "M")) a!13)))
      (a!16 (re.++ re.all
                   (re.++ (re.union (str.to.re "a") (str.to.re "A")) a!15)))
      (a!18 (re.++ re.all
                   (re.++ (re.union (str.to.re "m") (str.to.re "M")) a!17)))
      (a!20 (re.++ re.all
                   (re.++ (re.union (str.to.re "j") (str.to.re "J")) a!19)))
      (a!22 (re.++ re.all
                   (re.++ (re.union (str.to.re "j") (str.to.re "J")) a!21)))
      (a!24 (re.++ re.all
                   (re.++ (re.union (str.to.re "a") (str.to.re "A")) a!23)))
      (a!26 (re.++ re.all
                   (re.++ (re.union (str.to.re "s") (str.to.re "S")) a!25)))
      (a!28 (re.++ re.all
                   (re.++ (re.union (str.to.re "o") (str.to.re "O")) a!27)))
      (a!30 (re.++ re.all
                   (re.++ (re.union (str.to.re "n") (str.to.re "N")) a!29)))
      (a!32 (re.++ re.all
                   (re.++ (re.union (str.to.re "d") (str.to.re "D")) a!31))))
(let ((a!3 (re.++ (str.to.re "-")
                  (re.++ (re.union (re.range "A" "Z") (re.range "a" "z")) a!2)))
      (a!33 (or (not (str.in.re field_date a!12)) (and (not a!5) (not a!6))))
      (a!34 (or (and (not (str.in.re field_date a!16))
                     (not (str.in.re field_date a!20))
                     (not (str.in.re field_date a!26))
                     (not (str.in.re field_date a!30)))
                (not a!6))))
(let ((a!4 (str.in.re field_date
                      (re.++ (re.range "0" "9") (re.++ (re.range "0" "9") a!3)))))
(let ((a!35 (not (and a!4
                      a!7
                      (not a!8)
                      (or (str.in.re field_date a!10)
                          (str.in.re field_date a!12)
                          (str.in.re field_date a!14)
                          (str.in.re field_date a!16)
                          (str.in.re field_date a!18)
                          (str.in.re field_date a!20)
                          (str.in.re field_date a!22)
                          (str.in.re field_date a!24)
                          (str.in.re field_date a!26)
                          (str.in.re field_date a!28)
                          (str.in.re field_date a!30)
                          (str.in.re field_date a!32))
                      a!33
                      a!34))))
(let ((a!36 (or a!35
                (and a!4
                     a!7
                     (not a!8)
                     (or (str.in.re field_date a!10)
                         (str.in.re field_date a!12))
                     a!33))))
  (not a!36))))))))

(check-sat)
(get-model)
