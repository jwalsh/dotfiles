;; http://www.nongnu.org/geiser/geiser_2.html#Installation

(add-to-list 'exec-path
             "/usr/local/bin")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; (starter-kit-load "starter-kit-elpa.org")


(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(starter-kit
    starter-kit-bindings
    ack-and-a-half auctex clojure-mode coffee-mode deft expand-region
    gist groovy-mode haml-mode haskell-mode inf-ruby
    magit magithub markdown-mode paredit projectile python
    sass-mode rainbow-mode scss-mode solarized-theme
    volatile-highlights yaml-mode yari zenburn-theme
    ;;    starter-kit-js
    starter-kit-lisp
    zenburn-theme
    slime
    ac-slime
    clojure-mode
    hippie-expand-slime
    clojurescript-mode
    cljdoc
    nrepl-ritz
    ;;     peepopen
    phantomjs
    project
    elein
    ;;    ecb
    org
    org-email
    org-magit
    git-commit-mode
    hackernews
    heroku
    jira
    json
    paredit
    flymake-jshint
    ;;     gh
    anything-complete
    undo-tree
    coffee-mode
    flymake-coffee
    js2-mode
    popup
    htmlize
    rainbow-delimiters
    auto-complete
    bookmark+
    quack
    scpaste))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Starter kit

;; Display
(require 'zenburn-theme)


;; http://www.emacswiki.org/emacs/GoodFonts
;; (set-face-attribute 'default nil :family "Inconsolata" :height 95)

;; Clojure
;; (require 'ac-slime)
;; (add-hook 'slime-mode-hook 'set-up-slime-ac)
;; (add-hook 'slime-mode-hook 'paredit-mode)
;; (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;; nrepl.el
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)
;; (setq nrepl-tab-command 'indent-for-tab-command)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-mode-hook 'subword-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(add-to-list 'exec-path
             "/usr/local/bin")
(add-to-list 'exec-path
             "/usr/local/share/npm/bin")
(require 'epa-file)
(epa-file-enable)

(cua-selection-mode t)
(setq geiser-mode-start-repl-p t)

;; (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(require 'undo-tree)
(global-undo-tree-mode)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/sandbox/org-mode/contrib/lisp")
(setq org-directory "~/org/")
(setq org-mobile-directory "~/org/")
(setq org-mobile-inbox-for-pull (concat org-directory "index.org"))

;; Local fork
;; (add-to-list 'load-path "~/sandbox/org-confluence")
;; (require 'org-confluence)

;; ;; Running without a network connection kills the load
;; ;; Consider only checking this push / pull once per day
;; (if (and (file-directory-p org-mobile-directory)
;;          (file-exists-p org-mobile-inbox-for-pull))
;;     ((message (concat org-directory " found for org-mobile"))
;;      (org-mobile-push)
;;      (org-mobile-pull))
;;   ((message ("Directories not available for org-mobile"))))

(add-hook 'org-mode-hook 'ispell-minor-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'clojure-mode-hook 'cider-mode)

;; ;; https://github.com/briancarper/dotfiles/blob/master/.emacs
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Undo

(require 'undo-tree)
(global-undo-tree-mode)

(global-set-key "\C-R" 'undo-tree-undo)
;; (global-set-key "\C-\\;" 'comment-or-uncomment-region)
(global-set-key [C-tab] 'other-window)

;; Yegge
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; This should already be part of
;; http://eschulte.me/emacs-starter-kit/starter-kit-bindings.html
(global-set-key (kbd "C-x g") 'magit-status)

(defalias 'qrr 'query-replace-regexp)

(global-set-key [f5] 'call-last-kbd-macro)


;; (add-to-list 'load-path "~/sandbox/org-drill")
(require 'org-drill)

;; http://orgmode.org/worg/org-contrib/org-protocol.html
(server-start)
(require 'org-protocol)

(setq org-feed-alist
      '(("Hacker News"
         "http://news.ycombinator.com/rss"
         "~/notes/feeds.org" "Hacker News")))

(setq org-capture-templates
      `(("t" "Todo" entry (file+headline "~/notes/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/notes/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("u"
         "Task: Read this URL"
         entry
         (file+headline "tasks.org" "Articles To Read")
         ,(concat "* TODO Read article: '%:description'\nURL: %c\n\n")
         :empty-lines 1
         :immediate-finish t)

        ("w"
         "Capture web snippet"
         entry
         (file+headline "my-facts.org" "Inbox")
         ,(concat "* Fact: '%:description'        :"
                  (format "%s" org-drill-question-tag)
                  ":\n:PROPERTIES:\n:DATE_ADDED: %u\n:SOURCE_URL: %c\n:END:\n\n%i\n%?\n")
         :empty-lines 1
         :immediate-finish t)
        ("c"
         "Default template"
         entry
         (file+headline "~/org/capture.org" "Notes")
         "* %^{Title}\n\n  Source: %u, %c\n\n  %i"
         :empty-lines 1)

        ))


(setq org-agenda-custom-commands
      '(("w" todo "TODO")
        ("h" agenda "" ((org-agenda-show-all-dates nil)))
        ("W" agenda "" ((org-agenda-ndays 21)
                        (org-agenda-show-all-dates nil)))
        ("A" agenda ""
         ((org-agenda-ndays 1)
          (org-agenda-overriding-header "Today")))))

;; New in 24
(global-set-key "\C-cc" 'org-capture)
(setq org-directory "~/notes")
(setq org-agenda-files '("~/notes/gtd.org"))
(setq org-mobile-directory "~/Dropbox/Org/Mobile/")
(setq org-mobile-inbox-for-pull "~/Dropbox/Org/Mobile/my.org")

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook
          'whitespace-mode)

;; ;; $ lein plugin install swank-clojure 1.3.1
(add-hook 'clojure-mode-hook 'paredit-mode)


;;   ;;; bbdb
;; (require 'bbdb)
;; (require 'bbdb-autoloads)
;; (setq
;;  bbdb-file "~/.bbdb"
;;  bbdb-offer-save 'auto
;;  bbdb-notice-auto-save-file t
;;  bbdb-expand-mail-aliases t
;;  bbdb-canonicalize-redundant-nets-p t
;;  bbdb-always-add-addresses t
;;  bbdb-complete-name-allow-cycling t
;;  )
;; ;; initialization
;; (bbdb-initialize 'gnus 'message)
;; (bbdb-insinuate-message)
;; (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

;; (setq gnus-select-method '(nnml “”))

;; ;; http://cx4a.org/software/auto-complete/manual.html#Installation
;; ;; git clone https://github.com/m2ym/auto-complete.git
;; ;; %  make install DIR=$HOME/.emacs.d/
(add-to-list 'load-path "~/sandbox/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/sandbox/auto-complete/dict")
(ac-config-default)

;; ;; https://github.com/purcell/ac-slime
;; (add-to-list 'load-path "~/sandbox/ac-slime")
;; (require 'ac-slime)

(menu-bar-mode t)

(setq bmkp-propertize-bookmark-names-flag nil)

;; (add-to-list 'load-path "~/sandbox/ipython/docs/emacs")
;; (require 'ipython)
;; (setq py-python-command-args '("-pylab" "-colors" "LightBG"))

;;  http://docs.racket-lang.org/guide/Emacs.html
(require 'quack)

;; http://ianeslick.com/2013/05/17/clojure-debugging-13-emacs-nrepl-and-ritz/
(require 'nrepl)

;; Configure nrepl.el
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces-in-repl t)
(setq nrepl-history-file "~/.emacs.d/nrepl-history")

;; Some default eldoc facilities
(add-hook 'nrepl-connected-hook
          (defun pnh-clojure-mode-eldoc-hook ()
            (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
            (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
            (nrepl-enable-on-existing-clojure-buffers)))

;; Repl mode hook
(add-hook 'nrepl-mode-hook 'subword-mode)

;; Auto completion for NREPL
(require 'ac-nrepl)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)


(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-indentation)))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(c-basic-offset 2)
 '(coffee-tab-width 2)
 '(display-time-mode t)
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(js2-cleanup-whitespace t)
 '(js2-highlight-level 3)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(user-full-name "Jason Walsh"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'ido-exit-minibuffer 'disabled nil)

;; Not recommended but I find it useful for exploration
(put 'scroll-left 'disabled nil)

