;;; settings-css.el --- Module for CSS settings

;;; Commentary:

;; This module sets up CSS mode behavior

;;; Code:

;; CSS
(use-package css-mode
  :ensure t
  :config
  (setq css-indent-offset 2))

;; SCSS / SASS
(use-package scss-mode
  :ensure t
  :config
  ;; turn off annoying auto-compile on save
  (setq scss-compile-at-save nil))

(provide 'settings-css)
;;; settings-css.el ends here
