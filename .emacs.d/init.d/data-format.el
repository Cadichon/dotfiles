(use-package yaml-mode
  :ensure t
  )

(use-package json-mode
  :ensure t
  :config
  (add-hook 'json-mode-hook 'flycheck-mode)
  )

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
