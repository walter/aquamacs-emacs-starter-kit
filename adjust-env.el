;; adjust-env.el
;;
;; misc env variable settings
;;
;; Walter McGinnis, 2012-07-10
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; make sure we utf8 in our shell calling env
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")

(provide 'adjust-env)
