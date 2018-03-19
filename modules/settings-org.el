;;; settings-org.el --- Module for org-mode settings

;;; Commentary:

;; This module sets org-mode behavior

;;; Code:

(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)
         ("C-c c" . org-capture))
  :init
  (setq org-directory "~/Documents/org"
        org-agenda-files (directory-files org-directory t ".org$")
        org-log-done t
        org-hide-leading-stars t
        org-startup-indented t
        org-default-notes-file (concat org-directory "/notes.org")
        org-src-fontify-natively t
        org-confirm-babel-evaluate nil
        org-clock-idle-time 10
        org-global-properties '(("Effort_ALL". "0 0:10 0:20 0:30 1:00 2:00 3:00 4:00 6:00 8:00"))
        org-columns-default-format '"%38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM(Clock){:}")

  ;; targets for refiling
  (setq org-refile-targets (quote (
                                   (nil :maxlevel . 2)
                                   (org-agenda-files :maxlevel . 2))))

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

;; Capture templates
(use-package org-capture
  :config
  (setq org-capture-templates
      (quote (("t" "Task" entry (file+headline (lambda () (concat org-directory "/notes.org")) "Tasks")
               "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n%a")
              ("n" "Note" entry (file+headline (lambda () (concat org-directory "/notes.org")) "Notes")
               "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n")
              ("w" "Work" entry (file+headline (lambda () (concat org-directory "/work.org")) "Tasks")
               "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n%a")
              ("h" "Home" entry (file+headline (lambda () (concat org-directory "/notes.org")) "Home")
               "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n")
              ("l" "Link" entry (file+headline (lambda () (concat org-directory "/notes.org")) "Links")
               "* %^L %^g \n:PROPERTIES:\n:CREATED: %U\n:END:\n\n" :empty-line 1 :prepend t)
              ("j" "Journal" entry (file+olp+datetree (lambda () (concat org-directory "/journal.org")))
               "* %?\nEntered on %U\n  %i" :clock-in t :clock-resume t :clock-keep t)
              ("a" "Appointment" entry (file (lambda () (concat org-directory "/gcal.org")))
               "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")))))

;; Custom agenda commands
(use-package org-agenda
  :config
  (setq org-agenda-include-diary t)
  
  (add-to-list 'org-agenda-custom-commands
               '("w" "Work agenda and TODOs"
                 ((agenda)
                  (tags-todo "CATEGORY=\"work\"")
                  )
                 ((org-agenda-category-filter-preset '("+work"))))))

;; Exporters
(use-package ox-gfm
  :ensure t)

(use-package ox-twbs
  :ensure t)

(use-package ob-elixir
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
