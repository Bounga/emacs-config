;;; settings-editing.el --- Module for edition related settings

;;; Commentary:

;; Settings that matches my preferences when editing text

;;; Code:

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq require-final-newline t)
(setq standard-indent 2)

;; delete all selected region on del
(delete-selection-mode t)

;; Auto-pair parentheses, braces, …
(electric-pair-mode 1)

;; abbrev config
(add-hook 'text-mode-hook 'abbrev-mode)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; Company
(require 'company)
(require 'company-dabbrev)

(setq company-idle-delay 0.5
      company-tooltip-limit 10
      company-minimum-prefix-length 2
      company-dabbrev-downcase nil)
;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
(setq company-tooltip-flip-when-above t)

(global-company-mode 1)

;; whitespace-mode config
(require 'whitespace)
;;(add-hook 'before-save-hook 'whitespace-cleanup)
(setq whitespace-action '(auto-cleanup)
      whitespace-line-column 80
      whitespace-style '(face tabs empty trailing lines-tail))

;; Highlight diff for versionned files
(require 'diff-hl)
(global-diff-hl-mode +1)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;; enable on the fly spell check
(require 'flyspell)
(setq ispell-program-name "/usr/local/bin/aspell")

;; visual undo tree
(global-undo-tree-mode)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

(provide 'settings-editing)
;;; settings-editing.el ends here
