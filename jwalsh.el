;; http://www.nongnu.org/geiser/geiser_2.html#Installation

(defmacro comment (&rest body)
  "Ignores body, yields nil"
  nil)

(add-to-list 'exec-path
             "/usr/local/bin")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(    ac-slime
    ack-and-a-half
    anything-complete
    auctex
    auto-complete
    bookmark+
    cljdoc
    clojure-mode
    clojure-mode
    clojurescript-mode
    coffee-mode
    coffee-mode
    company
    deft
    elein
    expand-region
    flymake-coffee
    flymake-jshint
    gist
    git-commit-mode
    groovy-mode
    hackernews
    haml-mode
    haskell-mode
    heroku
    hippie-expand-slime
    htmlize
    ido-yes-or-no
    inf-ruby
    jira
    js2-mode
    json
    magit
    magithub
    markdown-mode
    nrepl-ritz
    org
    org-email
    org-magit
    paredit
    paredit
    phantomjs
    popup
    project
    projectile
    python
    quack
    rainbow-delimiters
    rainbow-mode
    sass-mode
    scpaste
    scss-mode
    slime
    solarized-theme
    starter-kit
    starter-kit-bindings
    starter-kit-js
    starter-kit-lisp
    undo-tree
    volatile-highlights
    yaml-mode
    yari
    zenburn-theme))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

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
                  ":\n:PROPERTIES:\n:DATE_ADDED: %u\n:SOURCE_URL: %c\n:END:\n\n%i\n%?\n")
         :empty-lines 1
         :immediate-finish t)
        ("c"
         "Default template"
         entry
         (file+headline "~/sandbox/notes/capture.org" "Notes")
         "* %^{Title}\n\n  Source: %u, %c\n\n  %i"
         :empty-lines 1)))

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
(setq org-directory "~/sandbox/notes")
(setq org-agenda-files '(concat org-directory  "/gtd.org"))
(setq org-mobile-directory "~/Dropbox/Org/Mobile/")
(setq org-mobile-inbox-for-pull "~/Dropbox/Org/Mobile/my.org")

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook
          'whitespace-mode)

;; ;; $ lein plugin install swank-clojure 1.3.1
(add-hook 'clojure-mode-hook 'paredit-mode)
;; ;; %  make install DIR=$HOME/.emacs.d/
(add-to-list 'load-path "~/sandbox/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/sandbox/auto-complete/dict")
(ac-config-default)

(menu-bar-mode t)

(setq bmkp-propertize-bookmark-names-flag nil)

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

