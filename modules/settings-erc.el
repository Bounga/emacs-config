;;; settings-erc.el --- Module for Erc settings

;;; Commentary:

;; Setting for Erc to fit my needs

;;; Code:

(defvar erc-hide-list '("JOIN" "PART" "QUIT"))
(defvar erc-kill-buffer-on-part t)
(defvar erc-kill-queries-on-quit t)
(defvar erc-kill-server-buffer-on-quit t)
(defvar erc-server-coding-system '(utf-8 . utf-8))
(defvar erc-modules
   (quote
    (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands notifications readonly ring services smiley stamp track)))

(defvar erc-nick "Bounga")
(defvar erc-server "irc.freenode.net")
(defvar erc-autojoin-channels-alist '(("freenode.net" "#ruby" "#emacs" "#emacsfr")))

(erc-truncate-mode +1)

(provide 'settings-erc)
;;; settings-erc.el ends here
