;;; settings-programming --- Module for prog-mode settings

;;; Commentary:

;; Some basic prog-mode configuration and programming related utilities.

;;; Code:

;; enable Emacs Code Browser
(require 'ecb)
(setq ecb-options-version "2.40")

;; enable flycheck
(require 'flycheck)
(require 'helm-flycheck)

;; enable linum mode for programming
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'flycheck-mode)

(provide 'settings-programming)
;;; settings-programming ends here
