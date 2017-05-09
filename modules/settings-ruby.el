;;; settings-ruby.el --- Module for Ruby settings

;;; Commentary:

;; This module provides nice settings and plugin for Ruby programming

;;; Code:

(use-package rbenv
  :ensure t
  :config
  (add-hook 'ruby-mode-hook 'rbenv-use-corresponding))

(use-package ruby-mode
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'subword-mode)

  :config
  (setq ruby-deep-indent-paren nil
        ruby-insert-encoding-magic-comment nil))

(use-package ruby-tools
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'ruby-tools-mode))

(use-package inf-ruby
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode))

(use-package robe
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'robe-mode)
  (add-hook 'ruby-mode-hook 'eldoc-mode)
  :config
  (eval-after-load 'company
    '(push 'company-robe company-backends)))

(use-package yard-mode
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'yard-mode))

(use-package align
  :ensure t
  :config
  ;; define rules for automatic alignments
  (add-to-list 'align-rules-list
               '(ruby-comma-delimiter
                 (regexp . ",\\(\\s-*\\)[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-hash-literal
                 (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
                 (group 2 3)
                 (repeat . t)
                 (modes  . '(ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-hash-literal2
                 (regexp . "[a-z0-9]:\\(\\s-*\\)[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-assignment-literal
                 (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-xmpfilter-mark
                 (regexp . "\\(\\s-*\\)# => [^#\t\n]")
                 (repeat . nil)
                 (modes  . '(ruby-mode)))))

(provide 'settings-ruby)
;;; settings-ruby.el ends here
