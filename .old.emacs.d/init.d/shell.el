(use-package sh-script
  :config
  (use-package company-shell
    :ensure t
    :config
    (add-to-list 'company-backends 'company-shell)
    )
  (add-hook 'sh-mode-hook 'flycheck-mode)
  (add-hook 'sh-mode-hook 'company-mode)
  (add-hook 'sh-mode-hook #'yas-minor-mode)
  )
