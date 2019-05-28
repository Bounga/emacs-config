;;; gnus.el --- Gnus settings

;;; Commentary:

;; Setting for Gnus

;;; Code:
(require 'nnir)
(require 'smtpmail)
(require 'mml2015)
(require 'gnus-async)
(require 'gnus-msg)

(use-package google-contacts
  :ensure t
  :config
  (require 'google-contacts-gnus)
  (require 'google-contacts-message))

;; Personal Information
(setq user-full-name "Nicolas Cavigneaux"
      user-mail-address "nico@bounga.org"

      mml-secure-openpgp-sign-with-sender t
      mml-secure-openpgp-encrypt-to-self t
      mm-verify-option 'always
      mm-decrypt-option 'always
      mm-discouraged-alternatives '("text/html" "text/richtext")

      gnus-fetch-old-headers t
      gnus-message-archive-group nil
      gnus-always-read-dribble-file t)

;; personal IMAP server info
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq gnus-select-method
      '(nnimap "home"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port "imaps")
               (nnimap-stream ssl)
               (nnir-search-engine imap)
               ;; @see http://www.gnu.org/software/emacs/manual/html_node/gnus/Expiring-Mail.html
               ;; press 'E' to expire email
               (nnmail-expiry-target "nnimap+home:[Gmail]/Trash")
               (nnmail-expiry-wait 'immediate)))

;; work IMAP server info
(setq gnus-secondary-select-methods
      '((nnimap "work"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port "imaps")
                (nnimap-stream ssl)
                (nnir-search-engine imap)
                (nnmail-expiry-target "nnimap+work:[Gmail]/Trash")
                (nnmail-expiry-wait 'immediate))))

;; Archive outgoing email in Sent folder on imap.gmail.com:
(setq gnus-message-archive-method '(nnimap "home")
      gnus-message-archive-group "[Gmail]/Sent Mail")

;; Send email through SMTP
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "bounga")

;; Use topic mode
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

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
         (address "nicolas@cavigneaux.net"))
        ("work"
         (address "ncavigneaux@synbioz.com")
         (organization "Synbioz")
         (signature-file "~/.signature-work"))))

;; Show all subscribed groups in groups buffer
(add-hook 'gnus-started-hook
          (lambda()
            (interactive "P")
            (gnus-group-list-all-groups 5)))

;; Attachments handling
(mailcap-add-mailcap-entry "application" "pdf" '((viewer . "open %s") (type . "application/pdf")))
(mailcap-add-mailcap-entry "application" "*" '((viewer . "open %s") (type . "application/*")))
(mailcap-add-mailcap-entry "image" "*" '((viewer . "open %s") (type . "image/*")))

;; Convert Atom feeds to RSS feeds readable by Gnus
(require 'mm-url)
(defadvice mm-url-insert (after DE-convert-atom-to-rss () )
  "Convert atom to RSS by calling xsltproc."
  (when (re-search-forward "xmlns=\"http://www.w3.org/.*/Atom\""
               nil t)
    (message "Converting Atom to RSS... ")
    (goto-char (point-min))
    (call-process-region (point-min) (point-max)
             "xsltproc"
             t t nil
             (expand-file-name "~/.emacs.d/atom2rss.xsl") "-")
    (goto-char (point-min))
    (message "Converting Atom to RSS... done")))

(ad-activate 'mm-url-insert)

(provide 'gnus)
;;; gnus.el ends here
