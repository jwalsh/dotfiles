(semantic-mode 1)
(global-ede-mode 1)
;; (semantic-load-enable-gaudy-code-helpers)  
(add-to-list 'auto-mode-alist '("/usr/include" . c-mode))
(semantic-add-system-include  "/usr/include" 'c-mode)

(setq gsl-base-dir "/usr/include/gsl")
(semantic-add-system-include gsl-base-dir 'c-mode)
(add-to-list 'auto-mode-alist (cons gsl-base-dir 'c-mode))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat gsl-base-dir "gsl_randist.h"))


(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)
