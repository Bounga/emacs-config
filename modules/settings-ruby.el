;;; settings-ruby.el --- Module for Ruby settings

;;; Commentary:

;; This module provides nice settings and plugin for Ruby programming

;;; Code:

(use-package rbenv
  :ensure t
  :config
  (global-rbenv-mode))

(use-package enh-ruby-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Guardfile\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Capfile\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.cap\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.thor\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Thorfile\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . enh-ruby-mode))

  (add-hook 'enh-ruby-mode 'subword-mode)

  :config
  (setq enh-ruby-deep-indent-paren nil
        enh-ruby-add-encoding-comment-on-save nil))

(use-package ruby-tools
  :ensure t
  :init
  (add-hook 'enh-ruby-mode-hook 'ruby-tools-mode))

(use-package inf-ruby
  :ensure t
  :init
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode))

(use-package robe
  :ensure t
  :init
  (add-hook 'enh-ruby-mode-hook 'robe-mode)
  (add-hook 'enh-ruby-mode-hook 'eldoc-mode)
  :config
  (eval-after-load 'company
    '(push 'company-robe company-backends)))

(use-package yard-mode
  :ensure t
  :init
  (add-hook 'enh-ruby-mode-hook 'yard-mode))

(use-package align
  :ensure t
  :config
  ;; define rules for automatic alignments
  (add-to-list 'align-rules-list
               '(ruby-comma-delimiter
                 (regexp . ",\\(\\s-*\\)[^# \t\n]")
                 (repeat . t)
                 (modes  . '(enh-ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-hash-literal
                 (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
                 (group 2 3)
                 (repeat . t)
                 (modes  . '(enh-ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-hash-literal2
                 (regexp . "[a-z0-9]:\\(\\s-*\\)[^# \t\n]")
                 (repeat . t)
                 (modes  . '(enh-ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-assignment-literal
                 (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
                 (repeat . t)
                 (modes  . '(enh-ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-xmpfilter-mark
                 (regexp . "\\(\\s-*\\)# => [^#\t\n]")
                 (repeat . nil)
                 (modes  . '(enh-ruby-mode)))))

(provide 'settings-ruby)
;;; settings-ruby.el ends here
