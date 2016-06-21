;;; settings-programming --- Module for prog-mode settings

;;; Commentary:

;; Some basic prog-mode configuration and programming related utilities.

;;; Code:

;; enable Emacs Code Browser
(require 'ecb)
(setq ecb-options-version "2.40")

;; enable snippets
(require 'yasnippet)
(yas-global-mode 1)

;; enable flycheck
(require 'flycheck)
(require 'helm-flycheck)

;; enable smartparens mode
(require 'smartparens-config)

;; enable linum mode for programming
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'prog-mode-hook 'smartparens-mode)

;; enable dash-at-point and bind shortcuts
(require 'dash-at-point)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

(provide 'settings-programming)
;;; settings-programming ends here
