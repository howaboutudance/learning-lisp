#|
(c) 2016 Michael Penhallegon

a basic CD database

based on work form "Pratical Common Lisp"
|#
(defvar *db* nil)

;;; make-cd creates a cd recordo as a plist
(defun make-cd (title artist rating ripped)
  "returns a list with value and keywords of title, artist, rating and ripped"
  (list :title title :artist artist :rating rating :ripped ripped))
;;; addd-record add a record to the db
(defun add-record (record) (push record *db*))

;; add-cd generalizes the two function into one
(defun add-cd (title artist rating ripped)
  (add-record (make-cd title artist rating ripped)))

;;; getdb dumps all the recods in the database in readable format
(defun getdb ()
  (dolist (cd *db*)
    (format t "~{~a: ~10t ~a ~%~}~%" cd)))

;;; prompt-read creates a prompt that
(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *quer-io*))

;;; prompt-for-cd creates user-friendly series of prompts to create a cd
(defun promp-for-cd ()
  (make-cd
   (prompt-read "Title")
   (prompt-read "Artist")
   (or (parse-integer (prompt-read "Rating")) 0)
   (y-or-n-p "Ripped [y/n]: ")
   ))

;;; add-cds runs a loop 
(defun add-cds ()
  (loop (add-record (prompt-for-cd))
     (if (not (y-or-n-p "Another? [y/n]: ")) (return))))
;;; save-db saves the db to a file
(defun save-db (filename)
  (with-open-file (out filename
		       :direction :output
		       :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))
(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))
;;; an example of a closure in lisp

(defun closure-outer (a b &optional (c 4))
  (defun closure-inner (y)
    (+ a (* y b) c)))
