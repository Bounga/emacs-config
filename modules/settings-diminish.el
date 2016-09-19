;;; settings-diminish.el --- Module for diminish setup

;;; Commentary:

;; This module use diminish to hide so common modes from status line

;;; Code:

(require 'diminish)

(diminish 'undo-tree-mode)
(diminish 'company-mode)
(diminish 'helm-mode)
(diminish 'smartparens-mode)
(diminish 'global-whitespace-mode)
(diminish 'abbrev-mode)

(provide 'settings-diminish)
;;; settings-diminish.el ends here
