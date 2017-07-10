;;; settings-versioning --- Module for versioning settings

;;; Commentary:

;; Versioning related configuration.

;;; Code:

;; enable Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :init
  ;; default settings
  (setq magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256"))))


;; GitFlow for Magit
(use-package magit-gitflow
  :ensure t
  :init
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

;; enable monky (magit for hg)
(use-package monky
  :ensure t
  :init
  (add-hook 'monky-log-edit-mode-hook 'turn-on-auto-fill))

;; Avoid annoying window creation on Ediff startup
(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain
        ediff-split-window-function 'split-window-horizontally))

(provide 'settings-versioning)
;;; settings-versioning ends here
