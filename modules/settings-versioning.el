;;; settings-versioning --- Module for versioning settings

;;; Commentary:

;; Versioning related configuration.

;;; Code:

;; enable Magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; enable monky (magit for hg)
(require 'monky)


(provide 'settings-versioning)
;;; settings-versioning ends here
