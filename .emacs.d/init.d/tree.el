(use-package all-the-icons
  :ensure t
  )

(use-package neotree
  :ensure t
  :bind (([f8] . neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-smart-open t)
  (setq neo-autorefresh t)
  )
