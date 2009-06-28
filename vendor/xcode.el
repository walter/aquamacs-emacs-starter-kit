
;; DESCRIPTION: Tasks for working with Apple XCode projects in Emacs.
;;
;; Originally from http://hutley.net/brett/emacs/integrating-emacs-and-xcode/
;;
;; MODIFIED & ENHANCED BY: Geoffrey Grosenbach http://topfunky.com
;;
;; For convenience, bind these to keys such as M-K and M-R.

(defun xcode-compile ()
  (interactive)
  (when (null (textmate-set-project-root))
    (error "Can't find any .git directory"))

  (let ((df (directory-files *textmate-project-root*))
        (has-proj-file nil)
        )
    (while (and df (not has-proj-file))
      (let ((fn (car df)))
        (if (> (length fn) 10)
            (if (string-equal (substring fn -10) ".xcodeproj")
                (setq has-proj-file t)
              )
          )
        )
      (setq df (cdr df))
      )
    (if has-proj-file
        (compile (concat "cd " *textmate-project-root* "&& xcodebuild -activetarget -activeconfiguration"))
      (compile "make")
      )
    )
  )

(defun xcode-clean ()
  (interactive)
  (let ((df (directory-files "."))
        (has-proj-file nil)
        )
    (while (and df (not has-proj-file))
      (let ((fn (car df)))
        (if (> (length fn) 10)
            (if (string-equal (substring fn -10) ".xcodeproj")
                (setq has-proj-file t)
              )
          )
        )
      (setq df (cdr df))
      )
    (if has-proj-file
        (compile "xcodebuild -activetarget -activeconfiguration clean")
      (compile "make clean")
      )
    )
  )

(provide 'xcode)
