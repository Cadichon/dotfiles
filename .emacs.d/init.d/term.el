(use-package term
  :config
  (add-hook 'term-mode-hook 'my-inhibit-global-linum-mode)
  (add-hook 'term-mode-hook 'my-inhibit-global-hl-line-mode)
  (defun my-inhibit-global-linum-mode ()
    "Counter-act `global-linum-mode'."
    (add-hook 'after-change-major-mode-hook
	      (lambda () (linum-mode 0))
	      :append :local))
  (defun my-inhibit-global-hl-line-mode ()
    "Counter-act `global-hl-line-mode'."
    (add-hook 'after-change-major-mode-hook
	      (lambda () (global-hl-line-mode 0))
	      :append :local))
  (use-package shell-pop
    :ensure t
    :bind (("C-t" . shell-pop))
    :config
    (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
    (setq shell-pop-window-size 25)
    (setq shell-pop-term-shell "bash")
    (setq shell-pop-universal-key "C-t")
    (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type)
    )
  )
