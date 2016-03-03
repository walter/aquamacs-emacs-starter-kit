;; init.el
;;
;; Trigger loading of Aquamacs Emacs Starter Kit customizations, etc.
;; Inspired by http://github.com/technomancy/emacs-starter-kit/.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;;;;; IMPORTANT: put this commented code in ~/Library/Aquamacs Emacs/Preferences.el
;;;;; begin code for Preferences.el
;; Aquamacs Emacs Starter Kit
;; http://github.com/walter/aquamacs-emacs-starter-kit
;; set the dotfiles-dir variable to this directory
;; (setq kitfiles-dir (concat (file-name-directory
;;                     (or (buffer-file-name) load-file-name)) "/aquamacs-emacs-starter-kit"))
;;
;; set up our various directories to load
;; (add-to-list 'load-path kitfiles-dir)
;; (require 'init)
;;;;; begin code for Preferences.el

(add-to-list 'load-path (concat kitfiles-dir "/vendor"))

;; Set up package handling

;; test that ~/.emacs.d
;; and ~/.emacs.d/elpa/ exist
;; make them if not
(unless (file-directory-p "~/.emacs.d/elpa")
	    (make-directory "~/.emacs.d/elpa" t))

;; load packages if we are using emacs 24 or greater
;; currently using melpa as repository
(if (>= emacs-major-version 24)
    (progn (require 'package)
	   (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
	   (require 'starter-kit-packages)
	   (package-initialize)
	   (message "Package starter kit loaded")
	   )
  (message "Package set up failed: you need to be running Aquamacs that includes emacs 24 or greater")
  )

;;;;; Vendor libs

;; jscs

(autoload 'jscs-indent-apply "jscs" nil t)
(autoload 'jscs-fix "jscs" nil t)
(autoload 'jscs-fix-run-before-save "jscs" nil t)

;; general coding/editing niceties
(require 'line-num)
(require 'whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Additional modes and mode configuration

;; Mac OS X/iPhone oriented, thanks http://github.com/topfunky/emacs-starter-kit/topfunky.el
;; Applescript
(autoload 'applescript-mode "applescript-mode" "major mode for editing AppleScript source." t)
(setq auto-mode-alist
      (cons '("\\.applescript$" . applescript-mode) auto-mode-alist))

;; make github flavored markdown the default for README.md files
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rxml$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

; use web-mode rather than html, nxml modes
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

; Yasnippet
(yas-global-mode 1)

; company-mode (http://company-mode.github.io)
(add-hook 'after-init-hook 'global-company-mode)

;;;;; end Vendor libs

;;;;; Aquamacs Emacs Starter Kit specific customizations
(require 'adjust-shell)
(require 'adjust-tabs)
(require 'adjust-env)
(require 'appearance)
(require 'emoji-font-setup)
(require 'ido-setup)
(require 'misc-mode-tweaks)
(require 'org-mode-stuff)
(require 'override-aquamacs-to-be-more-emacsy)
(require 'prefer-utf)
(require 'useful-functions)

;;;;; end Aquamacs Emacs Starter Kit specific customizations

(provide 'init)
