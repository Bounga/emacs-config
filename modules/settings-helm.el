;;; settings-helm.el --- Module for Helm configuration

;;; Commentary:

;; Helm settings to use it everywhere it is possible
;; It also adds keybindings to ease Helm use

;;; Code:
(use-package helm-config
  :ensure helm
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-b" . helm-buffer-list)
         ("C-x C-f" . helm-find-files)
         ("C-c h o" . helm-occur)
         ("C-h f" . helm-apropos)
         ("C-h r" . helm-info-emacs)
         ("C-h C-l" . helm-locate-library)
         ("C-c f" . helm-recentf)
         :map minibuffer-local-map
         ("C-c C-l" . helm-minibuffer-history)
         :map shell-mode-map
         ("C-c C-l" . helm-comint-input-ring))
  :init
  (require 'helm)
  (require 'helm-config)
  (add-hook 'eshell-mode-hook
            #'(lambda ()
                (substitute-key-definition 'eshell-list-history 'helm-eshell-history eshell-mode-map)))
  :config
  (substitute-key-definition 'find-tag 'helm-etags-select global-map)
  (helm-mode 1))

(use-package helm-projectile
  :ensure t
  :config
  (setq helm-split-window-in-side-p           t
        helm-buffers-fuzzy-matching           t
        helm-move-to-line-cycle-in-source     t
        helm-ff-search-library-in-sexp        t
        helm-ff-file-name-history-use-recentf t))

(provide 'settings-helm)
;;; settings-helm.el ends here
