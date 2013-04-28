;; misc-mode-tweaks.el
;;
;; Mainly Rails specific extensions being added to Ruby mode that aren't covered else where.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; most of the time I like ruby-electric, though sometimes it can be a pain
;; also adding flymake for syntax checking (also sometimes can be a pain)
;; if either is a pain, toggle them off momentarily
(require 'ruby-electric)
(add-hook 'ruby-mode-hook
          (lambda nil
            (require 'ruby-electric)
            (ruby-electric-mode)
            (flymake-mode-on)))

;; turn on whitespace clean up (as per hint in README in coffee-mode)
(setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace

;; make coffee-mode use 2 spaces for indents

(provide 'misc-mode-tweaks)
