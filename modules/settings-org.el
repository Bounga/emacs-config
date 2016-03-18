;;; settings-org.el --- Module for org-mode settings

;;; Commentary:

;; This module sets org-mode behavior

;;; Code:

(require 'org)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/emacs.org"
                             "~/org/work.org"
                             "~/org/personal.org"))

(provide 'settings-org)
;;; settings-org ends here
