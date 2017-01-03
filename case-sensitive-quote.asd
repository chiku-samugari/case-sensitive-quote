;;; Case sensitive Quote
;;; case-sensitive-quote.asd
;;; system definition for Case sensitive Quote
;;;
;;; Author: chiku (Takehiko Nawata, samugari.penguin@gmail.com)
;;; License: MIT License
(defsystem case-sensitive-quote
  :name "Case sensitive Quote"
  :version "0.8.0"
  :maintainer "Takehiko Nawata"
  :author "Takehiko Nawata"
  :license "MIT License"
  :description "Case sensitive Quote"
  :long-description "Setup a character as a reader macro for QUOTE that preserves the case of its components."
  :serial t
  :components ((:file "packages")
               (:file "case-sensitive-quote")))

