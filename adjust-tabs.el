;; adjust-tabs.el
;;
;; set default spaces for tab, etc.
;;
;; Walter McGinnis, 2012-08-10
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; always use spaces insted of tabs
(setq-default indent-tabs-mode nil)

;; make the default number of spaces to do tab indentation 2
(setq default-tab-width 2)

(provide 'adjust-tabs)