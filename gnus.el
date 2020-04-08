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

      gnus-asynchronous t
      gnus-novice-user nil
      gnus-fetch-old-headers t
      gnus-message-archive-group nil
      gnus-always-read-dribble-file t)

;; Newsgroup related setup
(setq gnus-startup-file "~/.emacs.d/newsrc"
      gnus-save-killed-list nil
      gnus-save-newsrc-file nil)

;; Customize the way threads are displayed
(setq gnus-summary-line-format
      (concat
       "%0{%U%R%z%}"
       "%3{│%}" "%1{%d%}" "%3{│%}" ;; date
       "  "
       "%4{%-20,20f%}"               ;; name
       "  "
       "%3{│%}"
       " "
       "%1{%B%}"
       "%s\n")
      gnus-sum-thread-tree-indent "  "
      gnus-sum-thread-tree-root "● "
      gnus-sum-thread-tree-false-root "◯ "
      gnus-sum-thread-tree-single-indent "◎ "
      gnus-sum-thread-tree-vertical        "│"
      gnus-sum-thread-tree-leaf-with-other "├─► "
      gnus-sum-thread-tree-single-leaf     "╰─► ")

;; personal IMAP server info
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; IMAP server info
(setq gnus-select-method '(nnnil nil))
(setq gnus-secondary-select-methods
      '((nntp "news.gwene.org")
        (nnimap "home"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port "imaps")
                (nnimap-stream ssl)
                (nnir-search-engine imap)
                ;; @see http://www.gnu.org/software/emacs/manual/html_node/gnus/Expiring-Mail.html
                ;; press 'E' to expire email
                (nnmail-expiry-target "nnimap+home:[Gmail]/Corbeille")
                (nnmail-expiry-wait 'immediate))
        (nnimap "work"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port "imaps")
                (nnimap-stream ssl)
                (nnir-search-engine imap)
                (nnmail-expiry-target "nnimap+work:[Gmail]/Corbeille")
                (nnmail-expiry-wait 'immediate))))

;; Send email through SMTP
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "bounga")

;; Use topic mode
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; Sort emails by descending date
(setq gnus-thread-sort-functions
      '((not gnus-thread-sort-by-date)
        (not gnus-thread-sort-by-number)))

;; Attempt to sign and encrypt all the mails we'll be sending.
(defun bounga/message-recipients ()
  "Return a list of all recipients in the message, looking at TO, CC and BCC.

Each recipient is in the format of `mail-extract-address-components'."
  (mapcan (lambda (header)
            (let ((header-value (message-fetch-field header)))
              (and
               header-value
               (mail-extract-address-components header-value t))))
          '("To" "Cc" "Bcc")))

(defun bounga/message-all-epg-keys-available-p ()
  "Return non-nil if the pgp keyring has a public key for each recipient."
  (require 'epa)
  (let ((context (epg-make-context epa-protocol)))
    (catch 'break
      (dolist (recipient (message-recipients))
        (let ((recipient-email (cadr recipient)))
          (when (and recipient-email (not (epg-list-keys context recipient-email)))
            (throw 'break nil))))
      t)))

(defun bounga/message-sign-encrypt-if-all-keys-available ()
  "Add MML tag to encrypt message when there is a key for each recipient, sign it otherwise.

Consider adding this function to `message-send-hook' to
systematically send signed / encrypted emails when possible."
  (if (message-all-epg-keys-available-p)
      (mml-secure-message-sign-encrypt)
    (mml-secure-message-sign)))

(add-hook 'message-send-hook 'bounga/message-sign-encrypt-if-all-keys-available)

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

(provide 'gnus)
;;; gnus.el ends here
