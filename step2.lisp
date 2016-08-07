#|
(c) 2015 Michael Penhallegon

step2 has two functions

* square
	squares a number (x^2)
* fact
	return the factorial of n (n!)
|#

(defun square (x)
	(* x x))

(defun fact (x)
	(if (= x 0)
		1
		(* x (fact (- x 1)))
	)
)

(defun fib (n)
	(if (< n 3)
		1
		(+ (fib (- n 1)) (fib (- n 2)))
	)
)

(defun mult (list)
	(if (null list)
		1
		(* (car list) (mult (cdr list)))
	)
)
(defun geti (list idx)
	(cdr list)
	(if (> idx 0)
		(geti (cdr list) (- idx 1))
	)
)

