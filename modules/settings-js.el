;;; settings-js.el --- Module for JS editing settings

;;; Commentary:

;; JS editing config using js2 mode

;;; Code:

(require 'js2-mode)
(require 'json-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'"    . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6\\'"    . js2-mode))

(setq-default js2-basic-offset 2)

(provide 'settings-js)
;;; settings-js ends here
