#|
(c) 2016 Micahel Penhallegon

some list functions
|#

;; let's start with a recursive sum function

(defun sum (list)
	(if (null list)
		0
		(+ (car list) (sum (cdr list)))
	)
)

;; a recursive length
;;
;; cases:
;; if incoming list is nil: return 0
;; if list is not null: +1 and cdr list into length'
(defun length- (list)
	(if (null list)
		0
		(+ 1 (length- (cdr list)))
	)
)

;; prints a list
;; using format and concatenate into a single string
;;
;; cases:
;; if list => nil: return "" (empty string)
;; if list: use format to format carred value into a string with a space, concatenate rest
(defun print- (list)
	(if (null list)
		" "
		(concatenate 'string (format nil "~A " (car list))
			(print- (cdr list)))
	)
)

;range returns a list generated recusively from start to end by step
(defun range (start end stp)
	0
	(if (> end start)
		(let ((next (+ start stp)))
			(cons start (range next end stp))
		)
	)
)

;matrixn return a matrix with n columns

(defun matrixn (n list)
	list
	(if (> n 0)
		(let ((len (/ (list-length list) n)))
			(cons list (matrixn (- n 1) (matrixm list len)))
		)
	)
)

(defun matrixm (list m)
	(if (> m 0)
		(cons (car list) (matrixm list (- n 1)))
	)
)

(defun repeat (sym len)
	()
	(if (> len 0)
		(cons sym (repeat sym (- len 1)))
	)
)




;; tag
;; takes a tag and a inner text string to format a closed html substring
(defun tag (tagstr substr)
	(let ((start (enclose tagstr))
				(end (endenclose tagstr))
				(s substr))
		(concatenate 'string start s end)
	)
)

;; enclose
;; encloses the tag t in two arrows
(defun enclose (tagstr)
	(let ((start "<")
				(end ">"))
		(concatenate 'string start tagstr end)
	)
)

;; endenclose provides end tag </..> format
(defun endenclose (tagstr)
	(let ((start "</")
				(end ">"))
		(concatenate 'string start tagstr end)
	)
)

; html tree parser
(defun htmlTree (tree)
	tree
)
