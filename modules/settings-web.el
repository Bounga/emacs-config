;;; settings-web.el --- Module for web templates

;;; Commentary:

;; This module setup web templates editing

;;; Code:

(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))

  :config
  ;; Auto-close tags
  (setq web-mode-enable-auto-closing t)

  ;; make web-mode play nice with smartparens
  (sp-with-modes '(web-mode)
    (sp-local-pair "%" "%"
                   :unless '(sp-in-string-p)
                   :post-handlers '(((lambda (&rest _ignored)
                                       (just-one-space)
                                       (save-excursion (insert " ")))
                                     "SPC" "=" "#")))
    (sp-local-tag "%" "<% "  " %>")
    (sp-local-tag "=" "<%= " " %>")
    (sp-local-tag "#" "<%# " " %>")))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'web-mode-hook 'emmet-mode))

(provide 'settings-web)
;;; settings-web ends here
