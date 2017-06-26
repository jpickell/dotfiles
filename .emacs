;; Jeff Pickell's .emacs file
;;
;; Author: Jeff Pickell
;; Keywords: dotfile
;; Version: 1.0, started 19 Sep 2000
;; Last Updated: Wed Apr 26 03:57:08 
;;
;; Latest version should be available at:
;;   https://github.com/jpickell/dots
;;
;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(message "* --[ Loading my Emacs init file ]--")

;; uptimes
(setq emacs-load-start-time (current-time))

(put 'rmail 'disabled t) ; avoid mbox destruction

(setq load-path (cons "~/.emacs.d/lisp/" load-path))
;;
(server-start)
(setq auto-fill t)
(setq indent-tabs-mode nil) ; use spaces, not tabs
(global-set-key [print] 'ps-print-buffer) ; hitting "PrtScrn" prints
(global-set-key [f2] 'bury-buffer) ; F3 switches buffers
(display-time) ; put the current time in the modeline

(setq-default left-margin-width 25 right-margin-width 25) ; Define new widths.
(set-window-buffer nil (current-buffer)) ; Use them now.

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))


(setq next-line-add-newlines nil)
(diary 0)
(blink-cursor-mode 0)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq visible-bell t)
(setq inhibit-startup-echo-area-message "Enceladus")
(setq default-directory (concat (getenv "HOME") "/"))
(add-to-list 'default-frame-alist '(foreground-color . "Wheat"))
(add-to-list 'default-frame-alist '(background-color . "Black"))
(set-foreground-color "White")
(set-background-color "Black")
(copy-face 'default 'modeline)
(set-face-background 'modeline "Wheat")
(set-face-foreground 'modeline "Black")
(set-face-attribute 'fringe nil :background "Black" :foreground "#ff0000")
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t) 

(when (display-graphic-p)
    (scroll-bar-mode 0)
    (tool-bar-mode 0)
    (menu-bar-mode 0)
)
