;;; settings-js.el --- Module for JS editing settings

;;; Commentary:

;; JS editing config using js2 mode

;;; Code:

(use-package js2-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.es6\\'" . js2-mode))
  :config
  (setq js2-basic-offset 2
        js2-bounce-indent-p t))

(use-package json
  :ensure t)

(provide 'settings-js)
;;; settings-js ends here
