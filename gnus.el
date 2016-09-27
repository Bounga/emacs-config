;;; gnus.el --- Gnus settings

;;; Commentary:

;; Setting for Gnus

;;; Code:
(require 'nnir)
(require 'smtpmail)
(require 'mml2015)
(require 'gnus-async)
(require 'gnus-msg)

;; Personal Information
(setq user-full-name "Nicolas Cavigneaux"
      user-mail-address "nico@bounga.org"

      mml-secure-openpgp-sign-with-sender t
      mml-secure-openpgp-encrypt-to-self t
      mm-verify-option 'always
      mm-decrypt-option 'always
      mm-discouraged-alternatives '("text/html" "text/richtext")

      gnus-fetch-old-headers t
      gnus-message-archive-group nil)

;; IMAP server info
(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port "imaps")
               (nnimap-stream ssl)
               (nnir-search-engine imap)
               ;; @see http://www.gnu.org/software/emacs/manual/html_node/gnus/Expiring-Mail.html
               ;; press 'E' to expire email
               (nnmail-expiry-target "nnimap+gmail:[Gmail]/Trash")
               (nnmail-expiry-wait (quote immediate))))

;; Archive outgoing email in Sent folder on imap.gmail.com:
(setq gnus-message-archive-method '(nnimap "imap.gmail.com")
    gnus-message-archive-group "[Gmail]/Sent Mail")

;; Send email through SMTP
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "bounga")

;; Sort emails by descending date
(setq gnus-thread-sort-functions
      '((not gnus-thread-sort-by-date)
        (not gnus-thread-sort-by-number)))

;; Attempt to sign and encrypt all the mails we'll be sending.
(add-hook 'gnus-message-setup-hook 'mml-secure-message-sign-encrypt)

;; Reply to mails with matching email address
(add-to-list 'gnus-extra-headers 'To)
(setq gnus-posting-styles
      '((".*" ; Matches all groups of messages
         (address "nico@bounga.org"))
        ((header "to" "nicolas@cavigneaux.net")
         (address "nicolas@cavigneaux.net"))))

;; Show all subscribed groups in groups buffer
(add-hook 'gnus-started-hook
          (lambda()
            (interactive "P")
            (gnus-group-list-all-groups 5)))

(provide 'gnus)
;;; gnus.el ends here
