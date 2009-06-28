;; override-aquamacs-to-be-more-emacsy.el
;;
;; Modify default Aquamacs behaviours to suit my tastes.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

; we want the default emacs behavior for new files, but still want to be able to do apple-n
; for new frames
(defun my-new-frame-with-new-scratch ()
  (interactive)
  (let ((one-buffer-one-frame t))
    (new-frame-with-new-scratch)))
(define-key osx-key-mode-map (kbd "A-n") 'my-new-frame-with-new-scratch)

; apple-w closes whatever frame you are in
(defun my-close-current-window-asktosave ()
  (interactive)
  (let ((one-buffer-one-frame t))
    (close-current-window-asktosave)))
(define-key osx-key-mode-map (kbd "A-w") 'my-close-current-window-asktosave)

; get rid of the unnecessary menu bar, since you should be using your keyboard
(tool-bar-mode 0)

(provide 'override-aquamacs-to-be-more-emacsy)
