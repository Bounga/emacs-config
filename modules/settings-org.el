;;; settings-org.el --- Module for org-mode settings

;;; Commentary:

;; This module sets org-mode behavior

;;; Code:

(use-package org
  :ensure t
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)
         ("C-c c" . org-capture))
  :init
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

  (setq org-directory "~/Documents/org"
        org-agenda-files (directory-files org-directory t ".org")
        org-log-done t
        org-hide-leading-stars t
        org-startup-indented t
        org-default-notes-file (concat org-directory "/notes.org")
        org-src-fontify-natively t)

  ;; Capture templates
  (defvar org-capture-templates)
  (setq org-capture-templates
      (quote (("t" "Task" entry (file+headline (concat org-directory "/notes.org") "Tasks")
               "* TODO %?\n%u\n%a\n")
              ("w" "Work" entry (file+headline (concat org-directory "/work.org") "Tasks")
               "* TODO %?\n%u\n%a\n")
              ("h" "Home" entry (file+headline (concat org-directory "/home.org") "Tasks")
               "* TODO %?\n%u\n%a\n"))))

  ;; targets for refiling
  (setq org-refile-targets (quote (
                                   (nil :maxlevel . 2)
                                   (org-agenda-files :maxlevel . 2))))

  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (add-hook 'org-mode-hook 'flyspell-mode)
  :config
  ;; load useful babel modes for inline evaluation
  (require 'ob-ruby))

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook
            (lambda()
              (org-bullets-mode t))))

(provide 'settings-org)
;;; settings-org ends here
