;;;; Case sensitive quote
;;; Dec. 13rd 2014, chiku
;;; Well, I cannot explain the reason, but I love the case-insensitiveness of
;;; Common Lisp. I know, I feel, it is not something essential at all. Howver,
;;; I love it exactly.
;;;  While I love that case-insensitiveness, sometimes a case sensitive symbol
;;; is desiable. A typical case is a setting file. We can use '|| syntax in
;;; such case, and I want a handy way to write it. It's not difficult.
(in-package :case-sensitive-quote)

(defun |^-reader| (strm c)
  (declare (ignore c))
  `(quote ,(let* ((*readtable* (copy-readtable)))
             (setf (readtable-case *readtable*) :preserve)
             (read strm nil nil t))))

(set-macro-character #\^ '|^-reader|)

(read-from-string "^abcd")

'abc
