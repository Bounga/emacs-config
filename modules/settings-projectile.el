;;; settings-projectile.el --- Module for projectile settings

;;; Commentary:

;; This module enable projectile and sets it to fit my usage

;;; Code:

(use-package projectile
  :ensure t
  :defer t
  :config
  (setq projectile-switch-project-action 'projectile-find-file
        projectile-completion-system 'helm
        projectile-globally-ignored-directories
        (quote
         (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "public/system" "vendor/bundle" "node_modules" "bower_components" ".bundle" ".sass-cache" ".yardoc" "tmp" "_build" "deps"))
        projectile-globally-ignored-file-suffixes (quote ("DS_Store" "log" "db" "pdf")))
  (projectile-global-mode)
  (helm-projectile-on))

(use-package ag
  :ensure t
  :defer t)

(use-package helm-ag
  :ensure t
  :defer t)

(provide 'settings-projectile)
;;; settings-projectile ends here
