;;; init.el --- Emacs configuration entry

;;; Commentary:

;; This file simply sets up the default load path and requires
;; the various modules.

;;; Code:

;; Always load newest byte code
(setq load-prefer-newer t)

(defvar modules-dir (expand-file-name  "modules" user-emacs-directory)
  "This directory houses all of the modules.")
(defvar savefile-dir (expand-file-name "savefile" user-emacs-directory)
  "This folder stores all the automatically generated save/history-files.")
(defvar personal-dir (expand-file-name "personal" user-emacs-directory)
  "This folder stores all personal customizations.")

(unless (file-exists-p savefile-dir)
  (make-directory savefile-dir))

;; add directories to Emacs's `load-path'
(add-to-list 'load-path modules-dir)

;; Modules loading
(require 'settings-packages "~/.emacs.d/modules/settings-packages.el")

;; OSX specific settings
(when (eq system-type 'darwin)
  (require 'settings-osx "~/.emacs.d/modules/settings-osx.el"))

(require 'settings-core "~/.emacs.d/modules/settings-core.el")
(require 'settings-ui "~/.emacs.d/modules/settings-ui.el")
(require 'settings-editing "~/.emacs.d/modules/settings-editing.el")
(require 'settings-programming "~/.emacs.d/modules/settings-programming.el")
(require 'settings-dired "~/.emacs.d/modules/settings-dired.el")
(require 'settings-projectile "~/.emacs.d/modules/settings-projectile.el")
(require 'settings-helm "~/.emacs.d/modules/settings-helm.el")
(require 'settings-erc "~/.emacs.d/modules/settings-erc.el")
(require 'settings-ruby "~/.emacs.d/modules/settings-ruby.el")
(require 'settings-markdown "~/.emacs.d/modules/settings-markdown.el")
(require 'settings-js "~/.emacs.d/modules/settings-js.el")
(require 'settings-coffee "~/.emacs.d/modules/settings-coffee.el")
(require 'settings-css "~/.emacs.d/modules/settings-css.el")
(require 'settings-org "~/.emacs.d/modules/settings-org.el")
(require 'settings-diminish "~/.emacs.d/modules/settings-diminish.el")
(require 'settings-versioning "~/.emacs.d/modules/settings-versioning.el")
(require 'settings-elixir "~/.emacs.d/modules/settings-elixir.el")
(require 'settings-web "~/.emacs.d/modules/settings-web.el")

;; config changes made through the customize UI will be store here
(setq custom-file (expand-file-name "custom.el" personal-dir))

;; load the personal settings (this includes `custom-file')
(when (file-exists-p personal-dir)
  (mapc 'load (directory-files personal-dir 't "^[^#].*el$")))

;;; init.el ends here
