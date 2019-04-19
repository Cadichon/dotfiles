(use-package cc-mode
  :config
  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c++-mode-hook #'yas-minor-mode)
  (add-hook 'c-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-hook 'company-mode)
  (add-hook 'c-mode-hook #'yas-minor-mode)
  (use-package irony
    :ensure t
    :init
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    )
  (use-package company-irony
    :ensure t
    :config
    (use-package company-irony-c-headers
      :ensure t
      :config
      (add-to-list 'company-backends '(company-irony-c-headers company-irony))
      )
    )
  (use-package flycheck-irony
    :ensure t
    :init
    (add-hook 'flycheck-mode-hook 'flycheck-irony-setup)
    )
  )
