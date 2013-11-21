(load-file "~/sandbox/dotfiles/core.el")
(if (>= emacs-major-version 24)
    (load-file "~/sandbox/dotfiles/jwalsh.el")
  (message "Core initialization ignored"))

;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!

;; End of the el4r block.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(c-basic-offset 2)
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes (quote ("6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "3d6b08cd1b1def3cc0bc6a3909f67475e5612dba9fa98f8b842433d827af5d30" default)))
 '(display-time-mode t)
 '(geiser-mode-company-p t)
 '(geiser-mode-smart-tab-p t)
 '(global-hl-line-mode t)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-font-lock turn-on-eldoc-mode capitalized-words-mode turn-on-haskell-doc-mode turn-on-haskell-decl-scan imenu-add-menubar-index)))
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(js2-cleanup-whitespace t)
 '(js2-highlight-level 3)
 '(org-agenda-files (quote ("~/notes/gtd.org" "~/notes/bibliography.org" "~/notes/bk/numis.org" "~/notes/private.org.gpg" "~/notes/interview/javascript-mobile.org" "~/sandbox/numis/README.org" "~/notes/journal.org")))
 '(org-capture-templates (quote (("t" "Todo" entry (file+headline "~/notes/gtd.org" "Tasks") "* TODO %?
  %i
  %a
" :clock-in t :clock-keep t) ("j" "Journal" entry (file+datetree "~/notes/journal.org") "* %?
Entered on %U
  %i
  %a
") ("u" "Task: Read this URL" entry (file+headline "tasks.org" "Articles To Read") "* TODO Read article: '%:description'
URL: %c
" :immediate-finish t :empty-lines 1) ("w" "Capture web snippet" entry (file+headline "my-facts.org" "Inbox") "* Fact: '%:description'        :drill:
:PROPERTIES:
:DATE_ADDED: %u
:SOURCE_URL: %c
:END:

%i
%?
" :immediate-finish t :empty-lines 1) ("c" "Default template" entry (file+headline "~/org/capture.org" "Notes") "* %^{Title}

  Source: %u, %c

  %i" :empty-lines 1))))
 '(org-drill-optimal-factor-matrix (quote ((1 (1.7000000000000002 . 3.44) (2.6 . 4.14) (2.1799999999999997 . 3.72) (2.5 . 4.0) (2.36 . 3.86)))))
 '(org-export-backends (quote (ascii html confluence deck)))
 '(org-export-with-todo-keywords t)
 '(org-html-html5-fancy t)
 '(org-modules (quote (org-bibtex org-docview org-gnus org-id org-info org-jsinfo org-habit org-inlinetask org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-bookmark org-depend org-drill org-eshell org-exp-bibtex org-jira org-learn org-secretary org-toc org-track org-velocity)))
 '(org-protocol-project-alist (quote (("http://wal.sh/worg/" :base-url "http://wal.sh/worg/" :working-directory "/Users/jwalsh/notes/" :online-suffix ".html" :working-suffix ".org") ("http://orgmode.org/worg/" :base-url "http://orgmode.org/worg/" :working-directory "/Users/jwalsh/notes/" :online-suffix ".html" :working-suffix ".org"))))
 '(quack-programs (quote ("mzscheme" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(safe-local-variable-values (quote ((org-html-head-include-scripts) (encoding . utf-8) (whitespace-line-column . 80) (lexical-binding . t))))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(user-full-name "Jason Walsh")
 '(vc-annotate-very-old-color "#DC8CC3"))

(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:foreground "gray81")))))
