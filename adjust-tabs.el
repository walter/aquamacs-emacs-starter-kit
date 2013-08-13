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
;; seen this both ways, as well as standard-indent 2 in customizations
(setq-default tab-width 2)
(setq default-tab-width 2)

;; web-mode specific overrides of tab settings
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  )
(add-hook 'web-mode-hook  'web-mode-hook)

(provide 'adjust-tabs)
