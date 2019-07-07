;; my-theme.el

(use-package spacemacs-theme
  :defer t
  :init
  (setq spacemacs-theme-custom-colors '((green-bg-s . "#00ff00" ) (bg1 . "#262626")))
  (load-theme 'spacemacs-dark t))

(set-default-font "InconsolataForPowerline Nerd Font:pixelsize=18")
