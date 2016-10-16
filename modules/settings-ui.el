;;; settings-ui.el --- Module for UI related settings

;;; Commentary:

;; This module is dedicated to customize Emacs UI

;;; Code:

;; prevent silly initial splash screen
(setq inhibit-splash-screen t)

;; remove toolbar
(tool-bar-mode -1)

;; ease windows movements
(windmove-default-keybindings)

;; custom theme
(use-package flatland-theme
  :ensure t
:defer t
  :config
  (load-theme 'flatland t))

;; use nice font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 140)

;; enhance mode-line displaying
(use-package smart-mode-line
  :ensure t
  :defer t
  :init
  (setq sml/no-confirm-load-theme t
        sml/theme 'dark)

  (add-hook 'after-init-hook #'sml/setup))

;; mode line settings
(column-number-mode t)
(size-indication-mode t)

;; Highlight current line and make cursor blink
(blink-cursor-mode 10)
(global-hl-line-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; display available keybindings on slow combination
(use-package which-key
  :ensure t
  :defer t
  :config
  (which-key-mode))

(provide 'settings-ui)
;;; settings-ui.el ends here
