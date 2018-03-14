;;; settings-terminal --- Module for terminal settings

;;; Commentary:

;; Terminal related configuration.

;;; Code:

(use-package multi-term
  :ensure t
  :bind (("C-c t" . multi-term-dedicated-toggle))
  :init
  (setq multi-term-program "/usr/local/bin/fish"
        multi-term-dedicated-select-after-open-p t)

  ;; Disable Yasnippet completion in terminal, use native one
  (add-hook 'term-mode-hook (lambda()
                              (yas-minor-mode -1)))
  ;; Ensure utf-8 is used to be able to display special characters
  (add-hook 'term-exec-hook
            (function
             (lambda()
               (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

  ;; Add hook to clear buffer in term-mode
  (add-hook 'term-mode-hook
            (lambda()
              (add-to-list 'term-bind-key-alist '("C-c C-k" . erase-buffer)))))


(provide 'settings-terminal)
;;; settings-terminal ends here
