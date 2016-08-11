;;; settings-packages.el --- Settings for packages handling

;;; Commentary:

;; This module provides usefull packages related settings and tools

;;; Code:

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)
(package-initialize)

;; use paradox for complex package search
(require 'paradox)
(setq paradox-github-token "673358454681b557ff442763bcdacdea328ca79c"
      paradox-automatically-star nil
      paradox-execute-asynchronously t)

(provide 'settings-packages)
;;; settings-packages.el ends here
