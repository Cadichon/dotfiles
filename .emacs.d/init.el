(defvar old-threshold gc-cons-threshold)
(setq gc-cons-threshold 100000000)
(let ((file-name-handler-alist nil))
  (load-file (concat user-emacs-directory "/config.el"))

  (defconst etc-directory
    (expand-file-name (convert-standard-filename "etc/") user-emacs-directory)
    "The directory where packages place their configuration files.")
  
  (defconst cache-directory
    (expand-file-name (convert-standard-filename ".cache/") user-emacs-directory)
    "The directory where packages place their persistent data files.")
  
  (defun expand-etc-file-name (file)
    "Expand filename FILE relative to `etc-directory'."
    (let* ((path (expand-file-name (convert-standard-filename file) sarcasm-etc-directory)))
      (make-directory (file-name-directory path) t)
      path))
  
  (defun expand-cache-file-name (file)
    "Expand filename FILE relative to `cache-directory'."
    (let* ((path (expand-file-name (convert-standard-filename file) sarcasm-cache-directory)))
      (make-directory (file-name-directory path) t)
      path))

  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize)
  
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package)

  (use-package exec-path-from-shell
    :ensure t
    :config
    (when (memq window-system '(mac ns x))
      (exec-path-from-shell-initialize)))
    
  (dolist (el-file (directory-files
		    (expand-file-name "init.d" user-emacs-directory) t
		    "^[^.].*\\.el$"))
    (let ((load-prefer-newer t))
      (cl-letf (((symbol-function 'etc)
		 (symbol-function #'expand-etc-file-name))
		((symbol-function 'cache)
		 (symbol-function #'expand-cache-file-name)))
	(load (file-name-sans-extension el-file) nil t))))
  )
(setq gc-cons-threshold old-threshold)
