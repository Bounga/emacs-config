;;; settings-coffee.el --- Module for CoffeeScript

;;; Commentary:

;; This module setup CoffeeScript editing

;;; Code:

(use-package coffee-mode
  :ensure t
  :config
  (setq coffee-tab-width 2))

(provide 'settings-coffee)
;;; settings-coffee ends here
