(if (>= emacs-major-version 24)
    (load-file "~/sandbox/dotfiles/jwalsh.el")
  (message "Core initialization ignored"))
 
;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
(add-to-list 'load-path "/Users/developer/.rvm/rubies/ruby-1.9.3-p362/share/emacs/site-lisp")
(require 'el4r)
(if (= emacs-major-version 23)
    (el4r-boot))
;; End of the el4r block.
