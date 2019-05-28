(use-package d-mode
  :ensure t
  :config
  (use-package company-dcd
    :ensure t
    :config
    (add-hook 'd-mode-hook 'company-dcd-mode)
    (add-hook 'd-mode-hook 'flycheck-mode)
    )
  )
