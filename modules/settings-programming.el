;;; settings-programming --- Module for prog-mode settings

;;; Commentary:

;; Some basic prog-mode configuration and programming related utilities.

;;; Code:

;; enable snippets
(use-package yasnippet
  :ensure t
  :defer t
  :config
  (yas-global-mode 1))

;; enable flycheck / flyspell
(use-package flycheck
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'flycheck-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode))

(use-package helm-flycheck
  :ensure t
  :defer t)

;; enable smartparens mode
(use-package smartparens-config
  :ensure smartparens
  :init
  (add-hook 'prog-mode-hook 'smartparens-mode))

;; enable linum mode for programming
(add-hook 'prog-mode-hook 'linum-mode)

;; enable dash-at-point and bind shortcuts
(use-package dash-at-point
  :ensure t
  :defer t
  :bind (("C-c d" . dash-at-point)
         ("C-c e" . dash-at-point-with-docset)))

;; Highlight keywords like TODO, FIXME, etc
(use-package fic-mode
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'fic-mode))

;; Auto-fill comments
(add-hook 'prog-mode-hook (lambda ()
                            (setq-local comment-auto-fill-only-comments t)
                            (auto-fill-mode 1)))

(provide 'settings-programming)
;;; settings-programming ends here
