(defconst dot-emacs (concat (getenv "HOME") "/" ".emacs.d/true-init.el")
    "My dot emacs file")
 
(require 'bytecomp)
(setq compiled-dot-emacs (byte-compile-dest-file dot-emacs))
 
(if (or (not (file-exists-p compiled-dot-emacs))
	(file-newer-than-file-p dot-emacs compiled-dot-emacs)
        (equal (nth 4 (file-attributes dot-emacs)) (list 0 0)))
    (load dot-emacs)
  (load compiled-dot-emacs))
 
(add-hook 'kill-emacs-hook
          '(lambda () (and (file-newer-than-file-p dot-emacs compiled-dot-emacs)
                           (byte-compile-file dot-emacs))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-tern tern js2-mode php-mode monokai-theme shell-pop smooth-scrolling rainbow-delimiters google-this dockerfile-mode json-mode yaml-mode company-dcd d-mode flycheck-irony company-irony-c-headers company-irony irony exec-path-from-shell use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
