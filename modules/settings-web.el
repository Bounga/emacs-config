;;; settings-web.el --- Module for web templates

;;; Commentary:

;; This module setup web templates editing

;;; Code:

(use-package web-mode
  :ensure t
  :init
  (add-hook 'web-mode-hook (lambda () (smartparens-mode -1)))

  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode)))

(provide 'settings-web)
;;; settings-web ends here
