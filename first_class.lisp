; create our squaring function

(defun square (x)
  (* x  x))

(defun rev_list (l &optional result)
  (if l
      (rev_list (cdr l) (cons (car l) result))
    result
    ))

(defun do_list (f l &optional (result '()))
  (if l
      (do_list f (cdr l) (cons (funcall f (car l)) result))
    (rev_list result)
    ))

; (do_list #'square '(1 2 3 4))
