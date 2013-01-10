             ;; Use Starter Kit rather than doing the package management manually
;; http://eschulte.me/emacs24-starter-kit/

(require 'package)
(add-to-list 'package-archives
             '("original" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("technomancy" . "http://repo.technomancy.us/emacs/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
;; (starter-kit-load "starter-kit-elpa.org")


(when (not package-archive-contents)
    (package-refresh-contents))

(defvar my-packages
  '(starter-kit
    starter-kit-bindings
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

;; (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Utilities 
(defun jw/beginning-of-buffer ()
  "Move to the beginning of the buffer."
  (interactive)
  (push-mark)
  (goto-char (point-min)))

(defun jw/write-file-cleanup-hook ()
  "Generic save functionality"
  (interactive)
  (untabify (point-min) (point-max))
  (indent-region (point-min) (point-max))
  (whitespace-cleanup))

(require 'undo-tree)
(global-undo-tree-mode)

;; ;; https://github.com/briancarper/dotfiles/blob/master/.emacs
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-R" 'undo-tree-undo)

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


(setq org-directory "~/notes")

(setq org-agenda-files '("~/notes/gtd.org"))

(setq org-mobile-directory "~/Dropbox/Org/Mobile/")
(setq org-mobile-inbox-for-pull "~/Dropbox/Org/Mobile/my.org")

 (setq org-feed-alist
          '(("Hacker News"
              "http://news.ycombinator.com/rss"
              "~/notes/feeds.org" "Hacker News")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/notes/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/notes/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))


(add-hook 'js2-mode-hook
          'whitespace-mode)

;; This should probably check that I'm the author 
(add-hook 'js2-mode-hook
      '(lambda ()
         (add-hook 'before-save-hook
                   (lambda ()
                     (jw/write-file-cleanup-hook)))))


;; ;; $ lein plugin install swank-clojure 1.3.1
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;; ;; Custom installations

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

(menu-bar-mode  t)

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
 '(org-agenda-files (quote ("~/notes/tag-generation-tool-v3-support.org" "~/notes/2013/_goals.org" "~/notes/journal.org" "~/notes/gtd.org")))
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
