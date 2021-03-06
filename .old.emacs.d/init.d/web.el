(use-package php-mode
  :ensure t
  :config
  (add-hook 'php-mode-hook 'flycheck-mode)
  )

;;TODO use rainbow-mode

(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
  (use-package tern
    :ensure t)
  (use-package company-tern
    :ensure t
    :config
    (add-to-list 'company-backends 'company-tern)
    )
  (add-hook 'js2-mode-hook 'tern-mode)
  (add-hook 'js2-mode-hook 'company-mode)
  (add-hook 'js2-mode-hook 'flycheck-mode)
  (defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
		  (or (buffer-file-name) default-directory)
		  "node_modules"))
	   (eslint (and root
			(expand-file-name "node_modules/eslint/bin/eslint.js"
					  root))))
      (when (and eslint (file-executable-p eslint))
	(setq-local flycheck-javascript-eslint-executable eslint))))
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  )

