;;; settings-erc.el --- Module for Erc settings

;;; Commentary:

;; Setting for Erc to fit my needs

;;; Code:

(require 'erc)
(require 'erc-services)

(load "~/.emacs.d/personal/ercpass.el.gpg")

(setq erc-prompt-for-password nil
      erc-prompt-for-nickserv-password nil
      erc-hide-list '("JOIN" "PART" "QUIT")
      erc-kill-buffer-on-part t
      erc-kill-queries-on-quit t
      erc-kill-server-buffer-on-quit t
      erc-server-coding-system '(utf-8 . utf-8)
      erc-modules
      (quote
       (autojoin button completion fill irccontrols match netsplit networks noncommands notifications readonly ring services smiley stamp track))
      erc-nick "Bounga"
      erc-user-full-name "Nicolas Cavigneaux"
      erc-server "irc.freenode.net"
      erc-autojoin-channels-alist '(("freenode.net" "#ruby" "#elixir-lang" "#emacs" "#emacsfr")))

(erc-truncate-mode +1)
(erc-services-mode 1)

(setq erc-nickserv-passwords
      `((freenode     (("nick-one" . ,freenode-pass)))))

(provide 'settings-erc)
;;; settings-erc.el ends here
