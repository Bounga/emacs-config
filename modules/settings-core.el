;;; settings-core.el --- Module for core settings of Emacs

;;; Commentary:

;; This module sets all common core behaviors for Emacs

;;; Code:

;; Disable interlocking
(setq create-lockfiles nil)

;; Save all temporary files in the same directory
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; enable semantic mode to provide more features to modes
(semantic-mode t)

;; clean up obsolete buffers automatically
(require 'midnight)

;; saner regex syntax
(require 're-builder)
(setq reb-re-syntax 'string)

;; avoid annoying alarm bell
(setq ring-bell-function 'ignore)

(provide 'settings-core)
;;; settings-core.el ends here
