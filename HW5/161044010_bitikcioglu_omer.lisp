; Gebze Technical University
; Computer Engineering Department
; CSE341 Programming Languages
; Homework 5 - Midterm
; Author: Ömer Faruk Bitikçioğlu

(defun read-file (input-file)
    (with-open-file (stream input-file)
        (setf a (loop for line = (read-line stream nil)
            while line
            collect line
        ))
        (print a)
    )
)

(defun answer-queries (horn-clauses)
    "It will answer all the queries in this list of horn-clauses"
    (setf line (car horn-clauses))
    (check-line line)
)

(defun check-line (line)
    "Checks line and determines what kind of line it is"
    (setf head (car line))
    (setf body (cdr line))
    (print head)
    (print body)
)

(read-file "input.txt")
