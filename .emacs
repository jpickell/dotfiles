;; Jeff Pickell's .emacs file
;;
;; Author: Jeff Pickell
;; Keywords: dotfile
;; Version: 1.0, started 19 Sep 2000
;; Copyright: (C) 2000 Jeff Pickell
;;
;;
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
;; Latest version should be available at:
;;   https://github.com/jpickell/dots
;;
;;
(setq load-path (cons "~/.emacs.d/lisp/" load-path))
;;
(set-default-font "screen")
;;;(copy-face 'default 'modeline)
;;;(set-face-background 'modeline "Wheat")
;;;(set-face-foreground 'modeline "Black")
(global-font-lock-mode t)
  (setq font-lock-maximum-decoration t)
;;;  (add-to-list 'default-frame-alist '(background-color . "Black"))
;;;  (add-to-list 'default-frame-alist '(foreground-color . "Wheat"))
;;;  ;;
;;;  ;; files needed-
;;;  (require 'crontab-mode)
;;;  (require 'sawfish)
;;;  (require 'festival)
;;;  (require 'bbdb)
;;;  (require 'backup-dir)
;;;  (require 'gnus-toggle)
;;;  (require 'htmlize)
;;;  (require 'recentf)
;;;  (require 'battery-netbsd)
;;;  (require 'erc)
;;;  (require 'epubmode)
;;;  (display-battery)
;;;  (setq bkup-backup-directory-info
;;;     '(( t "~/emacs/.backups/" full-path prepend-name search-upward)))
;;;     ;;
;;     (put 'rmail 'disabled t)              ; avoid mbox destruction
     (server-start)
;;;
;;;     ;;I
;;;     ;; ERC - an IRC client for emacs
;;;     ;;(setq erc-server "irc.openprojects.net"       
;;;     ;;      erc-port 6667
;;;     ;;      erc-nick "random")
;;;     ;;
;;;     ;;
;;;     ;; How to handle specific files-
;;;     (setq auto-mode-alist (cons'(".css" . css-mode)auto-mode-alist))
;;;     (setq auto-mode-alist (cons'(".gnus" . emacs-lisp-mode)auto-mode-alist))
;;;     (setq auto-mode-alist (cons'(".sawfishrc" . sawfish-mode)auto-mode-alist))
(setq auto-fill t)
;;
;;
(setq indent-tabs-mode nil) ; use spaces, not tabs
(global-set-key [print] 'ps-print-buffer) ; hitting "PrtScrn" prints
(global-set-key [f2] 'bury-buffer) ; F3 switches buffers
(global-set-key [f3] 'gnus-toggle) ;switch gnus buffer
;;;     ;;
(custom-set-faces)
(display-time) ; put the current time in the modeline
(setq next-line-add-newlines nil)
(diary 0)
(blink-cursor-mode 0)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq visible-bell t)

(setq inhibit-startup-echo-area-message "pickellj")
(setq default-directory (concat (getenv "HOME") "/"))

;;(setq default-frame-alist '((width . 120)
;;                            (height . 160)
;;                            (top . 0)
;;                            (left . 0)
;;                            (tool-bar-lines . 0)))


;;(setq-default left-margin-width 15 right-margin-width 15) ; Define new widths.
;; (set-window-buffer nil (current-buffer)) ; Use them now.

(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

(set-foreground-color "White")
(set-background-color "Black")

(copy-face 'default 'modeline)
(set-face-background 'modeline "Black")
(set-face-foreground 'modeline "White")

;;(set-frame-parameter (selected-frame) 'alpha '(85 50))
;;(add-to-list 'default-frame-alist '(alpha 85 50))
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t) 

;;(eval-when-compile (require 'cl))
;; (defun toggle-transparency ()
;;   (interactive)
;;   (if (/=
;;        (cadr (frame-parameter nil 'alpha))
;;        100)
;;       (set-frame-parameter nil 'alpha '(100 100))
;;    (set-frame-parameter nil 'alpha '(85 50))))

;; (global-set-key (kbd "C-c t") 'toggle-transparency)

 (setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)
