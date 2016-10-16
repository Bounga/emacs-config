;;; settings-diminish.el --- Module for diminish setup

;;; Commentary:

;; This module use diminish to hide so common modes from status line

;;; Code:

(use-package diminish
  :ensure t
  :defer t)

(diminish 'undo-tree-mode)
(diminish 'company-mode)
(diminish 'helm-mode)
(diminish 'smartparens-mode)
(diminish 'global-whitespace-mode)
(diminish 'abbrev-mode)
(diminish 'which-key-mode)

(provide 'settings-diminish)
;;; settings-diminish.el ends here
