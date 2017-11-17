;;; settings-org.el --- Module for org-mode settings

;;; Commentary:

;; This module sets org-mode behavior

;;; Code:

(use-package ob-elixir
  :ensure t)

(use-package org
  :ensure t
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)
         ("C-c c" . org-capture))
  :init
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

  (setq org-directory "~/Documents/org"
        org-agenda-files (directory-files org-directory t ".org$")
        org-agenda-include-diary t
        org-log-done t
        org-hide-leading-stars t
        org-startup-indented t
        org-default-notes-file (concat org-directory "/notes.org")
        org-src-fontify-natively t
        org-confirm-babel-evaluate nil)

  ;; Capture templates
  (defvar org-capture-templates)
  (setq org-capture-templates
      (quote (("t" "Task" entry (file+headline (lambda () (concat org-directory "/notes.org")) "Tasks")
               "* TODO %?\n%u\n%a")
              ("n" "Note" entry (file+headline (lambda () (concat org-directory "/notes.org")) "Notes")
               "* %?\n%u")
              ("w" "Work" entry (file+headline (lambda () (concat org-directory "/work.org")) "Tasks")
               "* TODO %?\n%u\n%a")
              ("h" "Home" entry (file+headline (lambda () (concat org-directory "/home.org")) "Tasks")
               "* TODO %?\n%u")
              ("l" "Link" entry (file+headline (lambda () (concat org-directory "/links.org")) "Links")
               "* %^L %^g \n%T" :prepend t)
              ("j" "Journal" entry (file+olp+datetree (lambda () (concat org-directory "/journal.org")))
               "* %?\nEntered on %U\n  %i\n  %a")
              ("a" "Appointment" entry (file (lambda () (concat org-directory "/gcal.org")))
               "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n"))))

  ;; targets for refiling
  (setq org-refile-targets (quote (
                                   (nil :maxlevel . 3)
                                   (org-agenda-files :maxlevel . 3))))

  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (add-hook 'org-mode-hook 'flyspell-mode)
  :config
  ;; load useful babel modes for inline evaluation
  (org-babel-do-load-languages
   (quote org-babel-load-languages)
   (quote ((emacs-lisp . t)
           (elixir . t)
           (ruby . t)
           (css . t)
           (sh . t)
           (org . t)
           (sass . t)
           (latex . t)))))

;; Exporters
(use-package ox-gfm
  :ensure t)

(use-package ox-twbs
  :ensure t)

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook
            (lambda()
              (org-bullets-mode t))))

;; Sync with gcal
(use-package org-gcal
  :ensure t
  :config
  (setq org-gcal-client-id private/org-gcal-client-id
        org-gcal-client-secret private/org-gcal-client-secret
        org-gcal-file-alist `((,private/org-gcal-username . ,(expand-file-name "gcal.org" org-directory)))))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

(provide 'settings-org)
;;; settings-org ends here
