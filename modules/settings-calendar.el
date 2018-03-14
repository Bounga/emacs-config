;;; settings-calendar.el --- Module for calendar setup

;;; Commentary:

;; This module setups calendar to fits my preferences

;;; Code:

(setq calendar-week-start-day 1)

(setq calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'font-lock-warning-face))

(setq calendar-intermonth-header
      (propertize "Wk"
                  'font-lock-face 'font-lock-keyword-face))

(use-package solar
  :config
  (setq calendar-latitude 50.4
        calendar-longitude 2.8333
        calendar-location-name "Avion, FR"))

(provide 'settings-calendar)
;;; settings-calendar.el ends here
