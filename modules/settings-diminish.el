;;; settings-diminish.el --- Module for diminish setup

;;; Commentary:

;; This module use diminish to hide so common modes from status line

;;; Code:

(use-package diminish
  :ensure t
  :config
  (diminish 'undo-tree-mode)
  (diminish 'company-mode)
  (diminish 'helm-mode)
  (diminish 'smartparens-mode)
  (diminish 'global-whitespace-mode)
  (diminish 'abbrev-mode)
  (diminish 'which-key-mode)
  (diminish 'yas-minor-mode)
  (diminish 'move-dup-mode))

(provide 'settings-diminish)
;;; settings-diminish.el ends here
