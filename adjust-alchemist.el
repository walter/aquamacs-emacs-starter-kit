;; adjust-alchemist.el
;;
;; tweaks to alchemist package for elixir and phoenix
;;
;; Walter McGinnis, 2016-10-29
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

; alchemist config
(setq alchemist-mix-test-task "test")
(setq alchemist-key-command-prefix (kbd "C-c ,"))
(require 'alchemist)

(defun alchemist-run-credo-on-project ()
  "Run credo on project"
  (interactive)
  (alchemist-mix-execute "credo"))
(define-key alchemist-mode-keymap (kbd "p c") 'alchemist-run-credo-on-project)

;; https://github.com/tonini/alchemist.el/blob/5693e5a7b1d75faee0dd424cd89fd20b3b9d77f6/alchemist-iex.el#L222-L230
(defun alchemist-iex-project-run-phx-server ()
  "Start an IEx process with mix 'iex -S mix phx.server' in the
context of an Elixir project.
Show the IEx buffer if an IEx process is already run."
  (interactive)
  (if (alchemist-project-p)
      (let ((default-directory (alchemist-project-root)))
        (pop-to-buffer (process-buffer (alchemist-iex-process " -S mix phx.server"))))
    (message "No mix.exs file available. Please use `alchemist-iex-run' instead.")))
(define-key alchemist-mode-keymap (kbd "i s") 'alchemist-iex-project-run-phx-server)

;; use smartparens when in elixir mode
(add-hook 'elixir-mode-hook #'smartparens-mode)

;; do end auto complete stuff
;; https://github.com/elixir-lang/emacs-elixir#notes
;; DISABLED: ruby-end uninstalled due to problems in ruby-mode
;; (add-to-list 'elixir-mode-hook
;;              (defun auto-activate-ruby-end-mode-for-elixir-mode ()
;;                (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
;;                     "\\(?:^\\|\\s-+\\)\\(?:do\\)")
;;                (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
;;                (ruby-end-mode +1)))

(provide 'adjust-alchemist)
