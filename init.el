;;; init --- Initialize Emacs by reading org configuration file

;;; Commentary:

;; This file has a limited purpose. It initializes package manager
;; then loads Org configuration file.

;;; Code:
(package-initialize)
(org-babel-load-file (concat user-emacs-directory "config.org"))

(provide 'init)
;;; init.el ends here
