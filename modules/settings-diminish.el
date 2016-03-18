;;; settings-diminish.el --- Module for diminish setup

;;; Commentary:

;; This module use diminish to hide so common modes from status line

;;; Code:

(require 'diminish)

(diminish 'undo-tree-mode)
(diminish 'company-mode)
(diminish 'helm-mode)

(provide 'settings-diminish)
;;; settings-diminish.el ends here
