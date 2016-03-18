;;; settings-dired.el --- Module for Dired mode settings

;;; Commentary:

;; Module to handle settings for Dired mode

;;; Code:

(require 'dired)

;; always delete and copy recursively
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(provide 'settings-dired)
;;; settings-dired.el ends here
