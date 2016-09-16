;;; settings-versioning --- Module for versioning settings

;;; Commentary:

;; Versioning related configuration.

;;; Code:

;; enable Magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; default settings
(setq magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))

;; GitFlow for Magit
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; enable monky (magit for hg)
(require 'monky)
(add-hook 'monky-log-edit-mode-hook 'turn-on-auto-fill)

(provide 'settings-versioning)
;;; settings-versioning ends here
