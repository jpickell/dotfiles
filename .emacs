;; Jeff Pickell's .emacs file
;;
;; Author: Jeff Pickell
;; Keywords: dotfile
;; Initial version: Sep 19 2000
;; Last Updated: Tue Jul 09, 2020 09:37pm 
;;
;; Latest version should be available at:
;;   https://github.com/jpickell/dotfiles
;;

(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(message "* --[ Loading my Emacs init file ]--")

;; uptimes
(setq emacs-load-start-time (current-time))

;; Backup file location
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

(put 'rmail 'disabled t) ; avoid mbox destruction

(server-start)
(setq auto-fill t)
(setq indent-tabs-mode nil) ; use spaces, not tabs

;; ====================
;; insert date and time
(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert "==========\n")
       (insert (format-time-string current-date-time-format (current-time)))
       (insert "\n")
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert "\n")
       )

;; Keybindings
;;; general ;;;
(global-set-key [print] 'ps-print-buffer)
(global-set-key (kbd "C-`") 'bury-buffer)
(global-set-key (kbd "C-f") 'find-file)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; Date / Time
(global-set-key (kbd "M-d") 'insert-current-date-time)
(global-set-key (kbd "M-t") 'insert-current-time)
;;; org-mode ;;;
(global-set-key (kbd "C-l") 'org-store-link)
(global-set-key (kbd "C-a") 'org-agenda)
(global-set-key (kbd "C-c") 'org-capture)
(global-set-key (kbd "C-b") 'org-switchb)
;; End Keybindings

(setq next-line-add-newlines nil)
(blink-cursor-mode 0)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq visible-bell t)
(setq inhibit-startup-echo-area-message "Europa")
(setq default-directory (concat (getenv "HOME") "/"))

;; Set colors
(set-foreground-color "#f0f0f0")
(set-background-color "#151515")
(copy-face 'default 'modeline)
(set-face-foreground 'modeline "#f0f0f0")
(set-face-background 'modeline "#4477aa")
(set-face-attribute 'fringe nil :family "Andale Mono" :background "#151515" :foreground "#ff0000" :height 200)
(fringe-mode 20)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Modeline Settings
(setq jkp-system-identification  
  (substring (system-name) 0
             (string-match "\\..+" (system-name))))

(setq-default mode-line-format
      (list "  "
            (format-time-string current-date-time-format (current-time))
            "\t| "
	    (getenv "USER")
            "@"
            'jkp-system-identification
            ;" | %16m"
	    " | %f %4l %2C "
            '(-3 . "%P")
	    " "
            'mode-line-modified
            "%-"))


;; Set GUI options
(when (display-graphic-p)
    (scroll-bar-mode 0)
    (tool-bar-mode 0)
    (menu-bar-mode 0)
    (set-frame-size (selected-frame) 150 60)
    )

;; Set World Clock locations
(setq display-time-world-list '(("China/Hong_Kong" "Hong Kong")
				("America/Los_Angeles" "Pacific ")
				("America/Denver" "Mountain")
				("America/Chicago" "Central")
				("America/New_York" "Eastern")
				("Europe/London" "London")
				("Europe/Berlin" "Berlin")
				))
(setq display-time-world-time-format "%R")

;;; Requirements
(require 'evil)
(evil-mode 1)

(setq
  org-ellipsis "…"
   ;; ➡, ⚡, ▼, ↴, , ∞, ⬎, ⤷, ⤵
  org-agenda-files (quote ("~/Notes/todo.org" "~/Notes/appointments.org"))
  org-deadline-warning-days 7
  org-agenda-breadcrumbs-separator " ❱ "
  org-directory "~/Notes")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
