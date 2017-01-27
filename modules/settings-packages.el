;;; settings-packages.el --- Settings for packages handling

;;; Commentary:

;; This module provides usefull packages related settings and tools

;;; Code:

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/")
             t)

(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; use paradox for complex package search
(use-package paradox
  :ensure t
  :config
  (setq paradox-github-token private/paradox-github-token
        paradox-automatically-star nil
        paradox-execute-asynchronously t))

(use-package diminish
  :ensure t)

(provide 'settings-packages)
;;; settings-packages.el ends here
