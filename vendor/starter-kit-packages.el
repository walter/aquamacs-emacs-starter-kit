;;; starter-kit-packages.el --- Install a base set of packages automatically.
;;
;; Part of the Emacs Starter Kit
;;
;; acquired from http://github.com/technomancy/emacs-starter-kit/
;; but modified to specify only packages that aren't already bundled with Aquamacs
;; and preferred by Walter McGinnis for Rails/Ruby work
(setq package-load-list '((coffee-mode t)
                          (erc-image t)
                          (gist t)
                          (haml-mode t)
                          (magit t)
                          (rspec-mode t)
                          (ruby-hash-syntax t)
                          (sass-mode t)
                          (scss-mode t)
                          (slim-mode t)
                          (web-mode t)
                          (yaml-mode t)
                          (yasnippet t)))

(provide 'starter-kit-packages)
