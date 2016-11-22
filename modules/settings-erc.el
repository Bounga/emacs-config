;;; settings-erc.el --- Module for Erc settings

;;; Commentary:

;; Setting for Erc to fit my needs

;;; Code:

(use-package erc
  :ensure t
  :config
  (setq erc-prompt-for-password nil
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
        erc-autojoin-channels-alist '(("freenode.net" "#ruby" "#elixir-lang" "#emacs" "#emacsfr" "#synbioz")))
  (erc-truncate-mode t))

(use-package erc-services
  :init
  (load "~/.emacs.d/personal/ercpass.el.gpg")
  :config
  (setq erc-prompt-for-nickserv-password nil
        erc-nickserv-passwords
        `((freenode     (("nick-one" . ,freenode-pass)))))
  (erc-services-mode t))

(use-package erc-spelling
  :config
  (erc-spelling-mode t)
  (setq erc-spelling-dictionaries '(("irc.freenode.net:6667" "american")
                                    ("#emacsfr" "french"))))

(use-package erc-hl-nicks
  :ensure t)

(provide 'settings-erc)
;;; settings-erc.el ends here
