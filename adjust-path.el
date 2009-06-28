;; adjust-path.el
;;
;; Add Ruby Enterprise Edition and MacPorts to PATH.
;; Assumes REE can be found via symlink at /opt/ree-latest
;; and that you install MacPorts in default /opt location.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

(setenv "PATH" (concat "/opt/ree-latest/bin" ":" (getenv "PATH") "/opt/local/bin" ":" ))

(provide 'adjust-path)
