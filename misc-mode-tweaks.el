;; misc-mode-tweaks.el
;;
;; Mainly Rails specific extensions being added to Ruby mode that aren't covered else where.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; file types that are ruby
;; credit to technomancy/emacs-starter-kit/starter-kity-ruby.el
;; for some of these
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rxml$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

;; most of the time I like ruby-electric, though sometimes it can be a pain
;; also adding flymake for syntax checking (also sometimes can be a pain)
;; if either is a pain, toggle them off momentarily
(require 'ruby-electric)
(add-hook 'ruby-mode-hook
          (lambda nil
            (require 'ruby-electric)
            (ruby-electric-mode)
            (flymake-mode-on)))

;; emacs wrapper for ri (replaces old ri.el)
;; see http://www.emacswiki.org/cgi-bin/wiki/RiEl for details
;; however, the latest code was grabbed from
;; http://github.com/technomancy/emacs-starter-kit/(github commit gobbly gook)/elpa-to-submit/ri.el
;; may slow Aquamacs startup
(require 'ri)

(provide 'misc-mode-tweaks)
