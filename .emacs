;; ;; http://tromey.com/elpa/install.html
(require 'package)
(package-initialize)


;; ;; http://technomancy.us/153
(add-to-list 'package-archives
            '("marmalade" . "http://marmalade-repo.org/packages/") t)

(when (not package-archive-contents)
  (package-refresh-contents))


(defvar my-packages
  '(starter-kit
    starter-kit-lisp
    starter-kit-js
    starter-kit-bindings
    zenburn-theme
    slime
    ac-slime
    clojure-mode
    hippie-expand-slime
    clojurescript-mode
    org
    org-email
    org-magit
    jabber
    json
    paredit
    flymake
    anything-complete
    undo-tree
    magit
    magithub
    magit-gh-pulls
    coffee-mode
    flymake-coffee
    js2-mode
    jsshell-bundle
    phantomjs
    flymake-jshint
    closure-lint-mode
    bookmark+
    anything
    gist
    popup
    erc-nick-notify
    htmlize
    sass-mode
    less-css-mode
    markdown-mode
    marmalade
    scpaste))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Display
(require 'zenburn-theme)

;; http://www.emacswiki.org/emacs/GoodFonts
(set-face-attribute 'default nil :family "Inconsolata" :height 95)


;; Clojure
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-mode-hook 'paredit-mode)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

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

;; ;; org-mode
(require 'org-install)

(org-remember-insinuate)
(global-set-key (kbd "C-c m") 'org-remember)

(setq org-directory "~/Dropbox/Org/")
(setq org-mobile-directory "~/Dropbox/Org/Mobile/")
(setq org-agenda-files '("~/Dropbox/Org/my.org"))
(setq org-mobile-inbox-for-pull "~/Dropbox/Org/inbox.org")

;; ;; Better support for undo
(global-set-key "\C-R" 'undo-tree-undo)


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
; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
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
 '(c-basic-offset 2)
 '(display-time-mode t)
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(js2-cleanup-whitespace t)
 '(js2-highlight-level 3)
 '(line-number-mode nil)
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




