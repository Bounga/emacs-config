;;; settings-gnus.el --- Gnus main preferences

;;; Commentary:

;; This module setup Gnus to store its main config file in emacs.d

;;; Code:

(use-package gnus-start
  :ensure gnus
  :init
  (setq gnus-init-file "~/.emacs.d/gnus.el"
        gnus-startup-file "~/.emacs.d/newsrc"
        gnus-directory "~/.emacs.d/News/"
        message-directory "~/.emacs.d/Mail/"))

(provide 'settings-gnus)
;;; settings-gnus ends here
