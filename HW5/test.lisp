; Gebze Technical University
; Computer Engineering Department
; CSE341 Programming Languages
; Homework 5 - Midterm
; Author: Ömer Faruk Bitikçioğlu

(setf facts (list))
(setf predicates (list))
(setf answers (list))

(defun program ()
    (setf horn-clauses 
        (read-file "input.txt"))
    (parse-clauses horn-clauses)
    (print answers)
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
            ((equal (check-line line) "query") (setf answers (append answers (list (answer-query line)))))
            ((equal (check-line line) "fact") (setf facts (append facts (list line))))
            ((equal (check-line line) "predicates") (setf predicates (append predicates (list line)))))))

(defun check-line (line)
    "Checks line and determines what kind of clause it is"
    (setf head (car line))
    (setf body (cdr line))
    (cond ((null head) (setf typeof "query"))
          ((member nil body) (setf typeof "fact"))
          (t (setf typeof "predicates"))
    (return-from check-line typeof)))

(defun answer-query (query)
    (cond
        ((check-facts query) (return-from answer-query t))
        ((check-predicates query) (return-from answer-query t))
        (t (return-from answer-query nil)))
)

(defun check-facts (query)
    (loop for i from 0 to (- (length facts) 1) do
        (if (equal (car(car(cdr query))) (car(car(nth i facts)))) ; Check if it's querying for a fact
            (if (equal (car(car(cdr(car(cdr query))))) (car(car(cdr(car(nth i facts)))))) ; Check if query is correct
                (cond ; Compare the integer value of the query to the facts integer value
                    ((and (null (car(cdr(car(cdr(car(cdr query))))))) (car(cdr(car(cdr(car(nth i facts)))))))
                        (return-from check-facts t))
                    (t (if
                        (eq (car(cdr(car(cdr(car(cdr query)))))) (car(cdr(car(cdr(car(nth i facts)))))))
                        (return-from check-facts t))))))))

(defun check-predicates (query)
    (print (car(car(cdr query))))
    (print (car(car(nth 0 predicates))))

    (loop for i from 0 to (- (length predicates) 1) do
        (if (equal (car(car(cdr query))) (car(car(nth i predicates)))) ; Check if it's querying for a predicate
            (print "hey")
        )
    )
)

(program)