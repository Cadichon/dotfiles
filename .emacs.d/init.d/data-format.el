(use-package yaml-mode
  :ensure t
  )

(use-package json-mode
  :ensure t
  :config
  (add-hook 'json-mode-hook 'flycheck-mode)
  )

