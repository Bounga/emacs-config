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

;; Highlight matching parenthese
(show-paren-mode 1)

;; abbrev config
(use-package abbrev-mode
  :diminish abbrev-mode
  :init
  (add-hook 'text-mode-hook 'abbrev-mode)
  (setq abbrev-file-name "~/.emacs.d/abbrev_defs"
        save-abbrevs t))

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; Company
(use-package company
  :diminish company-mode
  :config
  (setq company-idle-delay 0.5
        company-tooltip-limit 10
        company-minimum-prefix-length 2)
  (global-company-mode t))

(use-package company-dabbrev
  :config
  (setq company-dabbrev-downcase nil))

;; whitespace-mode config
(use-package whitespace
  :ensure t
  :diminish global-whitespace-mode
  :config
  (setq whitespace-action '(auto-cleanup)
        whitespace-line-column 80
        whitespace-style '(face tabs empty trailing lines-tail))
  (global-whitespace-mode 1))

;; Highlight diff for versionned files
(use-package diff-hl
  :ensure t
  :init
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  :config
  (global-diff-hl-mode +1))

;; enable on the fly spell check
(use-package flyspell
  :ensure t
  :init
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode 'flyspell-prog-mode)
  :config
  (setq ispell-program-name "/usr/local/bin/aspell"
        ispell-dictionary   "american"))

;; visual undo tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

;; Easily expand regions
(use-package expand-region
  :ensure t
  :bind (
         ("C-=" . er/expand-region)))

;; Easily move and duplicate lines
(use-package move-dup
  :ensure t
  :diminish move-dup-mode
  :config
  (global-move-dup-mode))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

(provide 'settings-editing)
;;; settings-editing.el ends here
