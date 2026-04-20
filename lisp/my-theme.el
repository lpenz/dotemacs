;;; my-theme.el --- My theme configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My theme configuration.

;;; Code:

(use-package spacemacs-theme
  :demand t
  :init
  (defvar spacemacs-theme-custom-colors nil)
  (setq spacemacs-theme-custom-colors '((green-bg-s . "#00ff00" ) (bg1 . "#262626")))
  :config
  (load-theme 'spacemacs-dark t))


(when (display-graphic-p)
  ;; (set-frame-font "Inconsolata-12")
  (set-frame-font "MesloLGS Nerd Font Mono-12")
  ;; (set-fontset-font t 'unicode "Symbola" nil 'prepend)
  (set-fontset-font t 'unicode "Noto Color Emoji" nil 'prepend))

(provide 'my-theme)
;;; my-theme.el ends here
