;; my-theme.el

(use-package spacemacs-theme
  :defer t
  :init
  (setq spacemacs-theme-custom-colors '((green-bg-s . "#00ff00" ) (bg1 . "#262626")))
  (load-theme 'spacemacs-dark t))

(set-frame-font "MesloLGS NFM:size=14")

(provide 'my-theme)

