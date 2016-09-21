;;; settings-markdown.el --- Module for markdown mode settings

;;; Commentary:

;; Enable markdown mode for markdown-like files

;;; Code:

(use-package markdown-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

  ;; (setq markdown-command "marked")

  (setq markdown-list-indent-width 2
        markdown-unordered-list-item-prefix "  - "
        markdown-use-pandoc-style-yaml-metadata t))

(provide 'settings-markdown)
;;; settings-markdown.el ends here
