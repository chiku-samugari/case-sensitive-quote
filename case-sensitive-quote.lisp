;;;; Case sensitive quote
;;; Dec. 13rd 2014, chiku
;;; Well, I cannot explain the reason, but I love the case-insensitiveness of
;;; Common Lisp. I know, I feel, it is not something essential at all. Howver,
;;; I love it exactly.
;;;  While I love that case-insensitiveness, sometimes a case sensitive symbol
;;; is desiable. A typical case is a setting file. We can use '|| syntax in
;;; such case, and I want a handy way to write it. It's not difficult.
(in-package :case-sensitive-quote)

(eval-when (:load-toplevel :compile-toplevel :execute)
  (defun case-sensitive-quote-reader (strm c)
  (declare (ignore c))
  `(quote ,(let* ((*readtable* (copy-readtable)))
             (setf (readtable-case *readtable*) :preserve)
             (read strm nil nil t)))))

(defvar *previous-macro-character-function* nil)

(defun enable-case-sensitive-quote (&optional (quote-char #\^))
  " Enables the case sensitive quote by setting up the QUOTE-CHAR as the
   quote character for the case sensitive quote."
  (setf *previous-macro-character-function*
        (cons quote-char (get-macro-character quote-char)))
  (set-macro-character quote-char 'case-sensitive-quote-reader))

(defun disable-case-sensitive-quote ()
  " Disables the case sensitive quote reader macro and reverts the
   reader macro for the character that is used as the case sensitive
   quote."
  (set-macro-character
    (car *previous-macro-character-function*)
    (cdr *previous-macro-character-function*))
  (setf *previous-macro-character-function* nil))
