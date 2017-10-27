;;; settings-dired.el --- Module for Dired mode settings

;;; Commentary:

;; Module to handle settings for Dired mode

;;; Code:

(use-package dired
  :config
  ;; always delete and copy recursively
  (setq dired-recursive-deletes 'always
        dired-recursive-copies 'always)
  :bind ("C-x C-j" . dired-jump))

(provide 'settings-dired)
;;; settings-dired.el ends here
