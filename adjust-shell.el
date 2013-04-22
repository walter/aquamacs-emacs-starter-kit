;; adjust-shell.el
;;
;; set shell to zsh
;;
;; Walter McGinnis, 2013-04-02
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; set default shell to zsh
;; assumes homebrew installed zsh at /usr/local/bin/zsh
;; alternatively you can use zsh that comes with Mac OS X
;; 
;; (setenv "ESHELL" "/bin/zsh")
(setenv "ESHELL" "/usr/local/bin/zsh")
(setenv "SHELL" "/usr/local/bin/zsh")

(provide 'adjust-shell)
