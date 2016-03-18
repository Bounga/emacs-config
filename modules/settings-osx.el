;;; settings-osx --- Mac OS X related settings

;;; Commentary:

;; This module defines useful settings to use Emacs on Mac OS X

;;; Code:

(require 'exec-path-from-shell)

(exec-path-from-shell-initialize)

(defvar mac-option-key-is-meta nil)
(defvar mac-command-key-is-meta t)

(setq mac-command-modifier 'meta
      mac-option-modifier nil)

(global-set-key (kbd "C-c c") 'kill-ring-save)
(global-set-key (kbd "C-c v") 'yank)
(global-set-key (kbd "C-c x") 'kill-region)

(provide 'settings-osx)
;;; settings-osx.el ends here
