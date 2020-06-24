;; Jeff Pickell's .emacs file
;;
;; Author: Jeff Pickell
;; Keywords: dotfile
;; Initial version: Sep 19 2000
;; Last Updated: Tue Jun 23, 2020 09:37pm 
;;
;; Latest version should be available at:
;;   https://github.com/jpickell/dotfiles
;;


(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(message "* --[ Loading my Emacs init file ]--")

;; Set size if running in GUI mode
(when (display-graphic-p) (set-frame-size (selected-frame) 120 50))

;; uptimes
(setq emacs-load-start-time (current-time))

(put 'rmail 'disabled t) ; avoid mbox destruction

(server-start)
(setq auto-fill t)
(setq indent-tabs-mode nil) ; use spaces, not tabs


;; Keybindings
;;; general ;;;
(global-set-key [print] 'ps-print-buffer)
(global-set-key (kbd "C-`") 'bury-buffer)
(global-set-key (kbd "C-f") 'find-file)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;;; org-mode ;;;
(global-set-key (kbd "C-l") 'org-store-link)
(global-set-key (kbd "C-a") 'org-agenda)
(global-set-key (kbd "C-c") 'org-capture)
(global-set-key (kbd "C-b") 'org-switchb)
;;; End Keybindings

;; Modeline Settings
(display-time) ; put the current time in the modeline

(setq next-line-add-newlines nil)
(blink-cursor-mode 0)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq visible-bell t)
(setq inhibit-startup-echo-area-message "Europa")
(setq default-directory (concat (getenv "HOME") "/"))

(add-to-list 'default-frame-alist '(foreground-color . "#f0f0f0"))
(add-to-list 'default-frame-alist '(background-color . "#222255"))
(set-foreground-color "#f0f0f0")
(set-background-color "#151515")
(copy-face 'default 'modeline)
(set-face-background 'modeline "#f0f0f0")
(set-face-foreground 'modeline "#000000")
(set-face-attribute 'fringe nil :background "#151515" :foreground "#ff0000")
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(when (display-graphic-p)
    (scroll-bar-mode 0)
    (tool-bar-mode 0)
    (menu-bar-mode 0)
    )

;;; Requirements
(require 'evil)
(evil-mode 1)

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
