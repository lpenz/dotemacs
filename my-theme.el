;; my-theme.el

(use-package spacemacs-theme
  :defer t
  :init
  (setq spacemacs-theme-custom-colors '((green-bg-s . "#00ff00")))
  (load-theme 'spacemacs-dark t))

(set-default-font "Inconsolata:size=19:antialias=true:autohint=false")
