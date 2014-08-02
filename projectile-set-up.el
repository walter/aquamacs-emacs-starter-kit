;; projectile-set-up.el
;;
;; Set basic colors, etc.
;;
;; Walter McGinnis, 2014-08-03
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; Set up projectile and projectile-rails
(projectile-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(provide 'projectile-set-up)
