;; appearance.el
;;
;; Choose a theme, etc.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; Set default colors to green on black
;; will override this with theme below, if you want
(setq default-frame-alist
      '(
        (background-color . "black")
        (foreground-color . "green")
        ))

;; set up color theme of choice by uncommenting the one you want
(require 'color-theme)
(color-theme-initialize)
; (load-file (concat kitfiles-dir "/vendor" "/twilight.el"))
; (color-theme-twilight)
; (load-file (concat kitfiles-dir "/vendor" "/blackboard.el"))
; (color-theme-blackboard)

(provide 'appearance)
