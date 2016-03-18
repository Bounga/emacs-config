;;; settings-css.el --- Module for CSS settings

;;; Commentary:

;; This module sets up CSS mode behavior

;;; Code:

;; CSS
(require 'css-mode)

(setq css-indent-offset 2)

;; SCSS / SASS
(require 'scss-mode)

;; turn off annoying auto-compile on save
(setq scss-compile-at-save nil)

(provide 'settings-css)
;;; settings-css.el ends here
