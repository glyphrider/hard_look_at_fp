					; create our closure factory

(defun generate_adder (x)
  (lambda (y) (+ x y)))

(defun use_adder (f y)
  (funcall f y))

					; (setf my_adder (generate_adder 17)
					; (use_adder my_adder 25)
