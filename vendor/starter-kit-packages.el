;;; starter-kit-packages.el --- Install a base set of packages automatically.
;;
;; Part of the Emacs Starter Kit
;;
;; acquired from http://github.com/technomancy/emacs-starter-kit/
;; but modified to specify only packages that aren't already bundled with Aquamacs
;; and preferred by Walter McGinnis for Rails/Ruby work
(defvar starter-kit-packages (list 'coffee-mode
                                   'gist
                                   'haml-mode
                                   'magit
                                   'magithub
                                   'rspec-mode
                                   'ruby-hash-syntax
                                   'sass-mode
                                   'scss-mode
                                   'slim-mode
                                   'twilight-theme
                                   'web-mode
                                   'yaml-mode
                                   'yasnippet)
  "Libraries that should be installed by default.")

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (p starter-kit-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'starter-kit-packages)
