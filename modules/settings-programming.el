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
(global-flycheck-mode)

;; enable linum mode for programming
(add-hook 'prog-mode-hook 'linum-mode)

(provide 'settings-programming)
;;; settings-programming ends here
