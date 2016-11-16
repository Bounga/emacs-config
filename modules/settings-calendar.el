;;; settings-calendar.el --- Module for calendar setup

;;; Commentary:

;; This module setups calendar to fits my preferences

;;; Code:

(defun calendar-show-week (arg)
  "Display week number in calendar-mode if ARG is t."
  (interactive "P")
  (copy-face font-lock-constant-face 'calendar-iso-week-face)
  (set-face-attribute
   'calendar-iso-week-face nil :height 0.7)
  (setq calendar-intermonth-text
        (and arg
             '(propertize
               (format
                "%2d"
                (car (calendar-iso-from-absolute
                      (calendar-absolute-from-gregorian
                       (list month day year)))))
               'font-lock-face 'calendar-iso-week-face))))

(calendar-show-week t)

(use-package solar
  :config
  (setq calendar-latitude 50.4
        calendar-longitude 2.8333
        calendar-location-name "Avion, FR"))

(provide 'settings-calendar)
;;; settings-calendar.el ends here
