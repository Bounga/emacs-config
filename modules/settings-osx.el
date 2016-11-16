;;; settings-osx --- Mac OS X related settings

;;; Commentary:

;; This module defines useful settings to use Emacs on Mac OS X

;;; Code:

(use-package exec-path-from-shell
  :ensure t
  :init
  (defvar mac-option-key-is-meta nil)
  (defvar mac-command-key-is-meta t)

  (setq mac-command-modifier 'meta
        mac-option-modifier 'super
        mac-right-option-modifier nil)

  :config
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(provide 'settings-osx)
;;; settings-osx.el ends here
