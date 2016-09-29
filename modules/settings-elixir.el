;;; settings-elixir.el --- Module for Elixir settings

;;; Commentary:

;; This module provides nice settings and plugin for Elixir programming

;;; Code:

(use-package elixir-mode
  :ensure t
  :config
  ;; Add end keyword when do is entered
  (add-to-list 'elixir-mode-hook
               (defun auto-activate-ruby-end-mode-for-elixir-mode ()
                 (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
                      "\\(?:^\\|\\s-+\\)\\(?:do\\)")
                 (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
                 (ruby-end-mode +1)))
  ;; Automatically add end keyword when needed
  (sp-with-modes '(elixir-mode)
    (sp-local-pair "fn" "end"
                   :when '(("SPC" "RET"))
                   :actions '(insert navigate))
    (sp-local-pair "do" "end"
                   :when '(("SPC" "RET"))
                   :post-handlers '(sp-ruby-def-post-handler)
                   :actions '(insert navigate))))

(use-package alchemist
  :ensure t)

(provide 'settings-elixir)
;;; settings-elixir.el ends here
