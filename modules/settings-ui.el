;;; settings-ui.el --- Module for UI related settings

;;; Commentary:

;; This module is dedicated to customize Emacs UI

;;; Code:

;; custom theme and toolbars cleanup
(load-theme 'wombat t)
(tool-bar-mode -1)

;; enhance mode-line displaying
(require 'smart-mode-line)

(setq sml/no-confirm-load-theme t
      sml/theme 'dark)

(add-hook 'after-init-hook #'sml/setup)

;; mode line settings
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'settings-ui)
;;; settings-ui.el ends here
