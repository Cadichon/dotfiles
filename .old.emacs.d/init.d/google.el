(use-package google-this
  :ensure t
  :bind (("C-g" . google-this))
  :config
  (google-this-mode 1)
  (global-set-key (kbd "C-g") 'google-this-mode-submap)  
  )
