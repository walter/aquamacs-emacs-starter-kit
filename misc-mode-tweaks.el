;; misc-mode-tweaks.el
;;
;; Mainly Rails specific extensions being added to Ruby mode that aren't covered else where.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; file types that are ruby
(add-to-list 'auto-mode-alist '(".rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '(".rxml$" . ruby-mode))
