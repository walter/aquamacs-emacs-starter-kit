;; emoji-font-setup.el
;;
;; needed to properly display emoji
;;
;; Walter McGinnis, 2016-03-03
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

; grabbed from description of steps in https://github.com/dunn/company-emoji.git
; set emoji font for proper emoji display
(defun --set-emoji-font (frame)
  "Adjust the font settings of FRAME so Emacs can display emoji properly."
  (if (eq system-type 'darwin)
      ;; For NS/Cocoa
      (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") frame 'prepend)
    ;; For Linux
    (set-fontset-font t 'symbol (font-spec :family "Symbola") frame 'prepend)))


; For when Emacs is started in GUI mode:
(--set-emoji-font nil)

; Hook for when a frame is created with emacsclient
; see https://www.gnu.org/software/emacs/manual/html_node/elisp/Creating-Frames.html
(add-hook 'after-make-frame-functions '--set-emoji-font)

(provide 'emoji-font-setup)
