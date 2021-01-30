; Gebze Technical University
; Computer Engineering Department
; CSE341 Programming Languages
; Homework 5 - Midterm
; Author: Ömer Faruk Bitikçioğlu

(setf facts (list))
(setf predicates (list))

(defun program ()
    (setf horn-clauses 
        (read-file "input.txt"))
    (parse-clauses horn-clauses)
)

(defun read-file (input-file)
    "Reads from given input file"
    (with-open-file (stream input-file)
        (setf l (loop for line = (read stream nil)
            while line
            collect line)))
    (setf l (car l)) ; Remove extra parantheses
    (return-from read-file l))

(defun parse-clauses (horn-clauses)
    "It will answer all the queries in this list of horn-clauses"
    (loop for i from 0 to (- (length horn-clauses) 1) do
        (setf line (nth i horn-clauses))
        (cond 
            ((equal (check-line line) "query") (answer-query line))
            ((equal (check-line line) "fact") (setf facts (append facts (list line))))
            ((equal (check-line line) "predicates") (setf predicates (append predicates (list line)))))))

(defun check-line (line)
    "Checks line and determines what kind of line it is"
    (setf head (car line))
    (setf body (cdr line))
    (cond ((null head) (setf typeof "query"))
          ((member nil body) (setf typeof "fact"))
          (t (setf typeof "predicates"))
    (return-from check-line typeof)))

(defun answer-query (query)

)

(program)