(setq inhibit-splash-screen t)
  
(defalias 'yes-or-no-p 'y-or-n-p)
  
(global-linum-mode t)
(when (display-graphic-p)
  (setq linum-format "%3d"))
(unless (display-graphic-p)
  (setq linum-format "%3d \u2502"))
  
(global-hl-line-mode +1)
(set-face-attribute hl-line-face nil :underline nil)
  
(unless (eq window-system 'ns)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))
  
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
  
(show-paren-mode 1)
(setq require-final-newline nil)
  
(setq show-trailing-whitespace t)
