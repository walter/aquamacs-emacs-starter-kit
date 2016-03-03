;; company-mode-backends.el
;;
;; set backends for company mode
;;
;; Walter McGinnis, 2016-03-03
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; emoji completion via `:dog:` syntax
(require 'company-emoji)
(add-to-list 'company-backends 'company-emoji)

;; web modes
(require 'company-web)
(add-to-list 'company-backends 'company-web-html)
;; I don't use these currently, uncomment if you do
;; (add-to-list 'company-backends 'company-web-jade)
;; (add-to-list 'company-backends 'company-web-slim)

(provide 'company-mode-backends)
