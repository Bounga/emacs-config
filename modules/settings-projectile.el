;;; settings-projectile.el --- Module for projectile settings

;;; Commentary:

;; This module enable projectile and sets it to fit my usage

;;; Code:

(require 'projectile)
(require 'ag)
(require 'helm-ag)

(projectile-global-mode)

(setq projectile-switch-project-action 'projectile-find-file
      projectile-completion-system 'helm
      projectile-globally-ignored-directories
      (quote
       (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "public/system" "vendor/bundle" "node_modules" "bower_components" ".bundle" ".sass-cache" ".yardoc" "tmp"))
      projectile-globally-ignored-file-suffixes (quote ("DS_Store" "log" "db" "pdf")))

(helm-projectile-on)

(provide 'settings-projectile)
;;; settings-projectile ends here
