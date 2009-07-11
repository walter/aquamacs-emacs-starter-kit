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

;; Load up ELPA, the package manager

;; test that ~/.emacs.d
;; and ~/.emacs.d/elpa/ exist
;; make them if not
(unless (file-directory-p "~/.emacs.d/elpa")
	    (make-directory "~/.emacs.d/elpa" t))

(require 'package)
(package-initialize)
(require 'starter-kit-elpa)

;;;;; Vendor libs

;; general coding/editing niceties
(require 'line-num)
(require 'whitespace)

;; Additional Modes
(require 'yaml-mode)                                                                                                        
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Mac OS X/iPhone oriented, thanks http://github.com/topfunky/emacs-starter-kit/topfunky.el
;; Applescript
(autoload 'applescript-mode "applescript-mode" "major mode for editing AppleScript source." t)
(setq auto-mode-alist
      (cons '("\\.applescript$" . applescript-mode) auto-mode-alist))
;; xcode/cocoa specific
(require 'objc-c-mode)
(require 'xcode)
(define-key objc-mode-map [(meta r)] 'xcode-compile)
(define-key objc-mode-map [(meta K)] 'xcode-clean)
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  [(meta O)] 'ff-find-other-file)))
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key (kbd "C-c <right>") 'hs-show-block)
            (local-set-key (kbd "C-c <left>")  'hs-hide-block)
            (local-set-key (kbd "C-c <up>")    'hs-hide-all)
            (local-set-key (kbd "C-c <down>")  'hs-show-all)
            (hs-minor-mode t)))         ; Hide and show blocks

; see http://www.busydoingnothing.co.uk/twitter-el/ for details
(autoload 'twitter-get-friends-timeline "twitter" nil t)
(autoload 'twitter-status-edit "twitter" nil t)
(global-set-key "\C-xt" 'twitter-get-friends-timeline)
(add-hook 'twitter-status-edit-mode-hook 'longlines-mode)

;;;;; end Vendor libs

;;;;; Aquamacs Emacs Starter Kit specific customizations
(require 'adjust-path)
(require 'appearance)
(require 'ido-setup)
(require 'misc-mode-tweaks)
(require 'org-mode-stuff)
(require 'override-aquamacs-to-be-more-emacsy)
(require 'prefer-utf)
(require 'useful-functions)

;;;;; end Aquamacs Emacs Starter Kit specific customizations

(provide 'init)
