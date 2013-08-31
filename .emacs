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
 '(display-time-mode t)
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(js2-cleanup-whitespace t)
 '(js2-highlight-level 3)
 '(org-agenda-files (quote ("~/notes/bk/mobile-onsite.org" "~/notes/enabable.org" "~/notes/bk/dmp-demo-2013w2.org" "~/notes/tag-generation-tool-v3-support.org" "~/notes/2013/_goals.org" "~/notes/journal.org" "~/notes/gtd.org")))
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
(put 'downcase-region 'disabled nil)
