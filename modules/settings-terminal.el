;;; settings-terminal --- Module for terminal settings

;;; Commentary:

;; Terminal related configuration.

;;; Code:

(require 'multi-term)
(setq multi-term-program "/usr/local/bin/zsh"
      multi-term-dedicated-select-after-open-p t)

;; Disable Yasnippet completion in terminal, use native one
(add-hook 'term-mode-hook (lambda()
                            (yas-minor-mode -1)))

;; Ensure utf-8 is used to be able to display special characters
(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

;; Bind C-c t shortcut to dedicated multi-term
(global-set-key (kbd "C-c t") 'multi-term-dedicated-toggle)

(provide 'settings-terminal)
;;; settings-terminal ends here
