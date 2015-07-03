;;
;;; Jeff Pickell's .emacs file
;;;
;;; Author: Jeff Pickell 
;;; Keywords: dotfile
;;; Version: 1.0, started 19 Sep 2000
;;;
;;;
;;     This program is free software; you can redistribute it and/or
;;     modify it under the terms of the GNU General Public License as
;;     published by the Free Software Foundation; either version 2 of
;;     the License, or (at your option) any later version.
;;
;;     This program is distributed in the hope that it will be useful,
;;     but WITHOUT ANY WARRANTY; without even the implied warranty of
;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;;     GNU General Public License for more details.
;;
;;     You should have received a copy of the GNU General Public
;;     License along with this program; if not, write to the Free
;;     Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
;;     MA 02111-1307, USA.
;;
;;
(setq load-path (cons "~/emacs/" load-path))
;;

(copy-face 'default 'modeline)
(set-face-background 'modeline "Blue")
(set-face-foreground 'modeline "Wheat")
(set-cursor-color "Blue")
(global-font-lock-mode t)
  (setq font-lock-maximum-decoration t) 
(add-to-list 'default-frame-alist '(background-color . "Black"))
(add-to-list 'default-frame-alist '(foreground-color . "Wheat"))
(mouse-wheel-mode t)
;;
;; files needed-
(require 'tramp)
;(require 'crontab-mode)

(setq bkup-backup-directory-info
   '(( t "~/emacs/.backups/" full-path prepend-name search-upward)))
;;
(put 'rmail 'disabled t)              ; avoid mbox destruction
(server-start)

;;
;; How to handle specific files-
(setq auto-mode-alist (cons'(".css" . css-mode)auto-mode-alist))
(setq auto-mode-alist (cons'(".gnus" . emacs-lisp-mode)auto-mode-alist))
(setq auto-mode-alist (cons'(".sawfishrc" . sawfish-mode)auto-mode-alist))
(setq auto-fill t)
;;
;;
(setq indent-tabs-mode nil) ; use spaces, not tabs
;;(global-set-key [print] 'ps-print-buffer) ; hitting "PrtScrn" prints
(global-set-key [f2] 'bury-buffer) ; F3 switches buffers
(global-set-key [f3] 'gnus-toggle) ;switch gnus buffer
;;

(display-time) ; put the current time in the modeline
(setq next-line-add-newlines nil) 
(setq frame-title-format "emacs: %b") 
(add-hook 'html-mode-hook 'turn-on-auto-fill) 
;;
;; activate appointment reminders and calendar
(add-hook 'diary-hook 'appt-make-list)
(diary 0)
;(add-hook 'calender-hook 'mark-holiday-entries)
;(calendar)
;(setq mark-holiday-entries t) 
;;
;; Make the cursor follow the mouse.
;(load "follow-mouse")
; (toggle-follow-mouse)
;;
;;
;;; Emacs/W3 Configuration
;;(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))
;;(condition-case () (require 'w3-auto "w3-auto") (error nil))

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))

;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))
