;; adjust-path.el
;;
;; Add Ruby Enterprise Edition and MacPorts to PATH.
;; Assumes REE can be found via symlink at /opt/ree-latest
;; and that you install MacPorts in default /opt location.
;;
;; NOT CURRENTLY USED
;; we now rely on zsh, ~/.oh-my-zsh, and ~/.zshrc to set paths
;; and this is redundant
;; however, keeping around for reference for those not switching to zsh
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; replacing explicit REE adding to path with rbenv management instead
;; (setenv "PATH" (concat "/opt/ree-latest/bin" ":" (getenv "PATH") "/opt/local/bin" ":" ))

;; make sure homebrew's /usr/local/bin comes before /usr/bin
; (setenv "PATH" (concat "/usr/local/bin" path-separator (getenv "PATH")))

;; thanks to http://marc-bowes.com/2012/03/10/rbenv-with-emacs.html
;; Setting rbenv path
;; (setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
;; (setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

;; add Heroku Toolbelt
;; https://toolbelt.heroku.com
; (setenv "PATH" (concat "/usr/local/heroku/bin" path-separator (getenv "PATH")))

(provide 'adjust-path)
