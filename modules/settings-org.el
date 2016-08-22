;;; settings-org.el --- Module for org-mode settings

;;; Commentary:

;; This module sets org-mode behavior

;;; Code:

(require 'org)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(setq org-agenda-files (list "~/Documents/org/code.org"
                             "~/Documents/org/emacs.org"
                             "~/Documents/org/games.org"
                             "~/Documents/org/guitar.org"
                             "~/Documents/org/work.org"
                             "~/Documents/org/home.org"))

(provide 'settings-org)
;;; settings-org ends here
