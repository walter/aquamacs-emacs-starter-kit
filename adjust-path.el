;; adjust-path.el
;;
;; Add Ruby Enterprise Edition and MacPorts to PATH.
;; Assumes REE can be found via symlink at /opt/ree-latest
;; and that you install MacPorts in default /opt location.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; replacing explicit REE adding to path with rbenv management instead
;; (setenv "PATH" (concat "/opt/ree-latest/bin" ":" (getenv "PATH") "/opt/local/bin" ":" ))

;; thanks to http://marc-bowes.com/2012/03/10/rbenv-with-emacs.html
;; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

(provide 'adjust-path)
