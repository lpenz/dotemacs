;; my-counshell.el

(straight-use-package
 '(counshell :type git :host github :repo "lpenz/counshell"))

(use-package counshell
  :config
   (general-define-key "SPC e e" 'counshell-projectile-sh)
   (general-define-key "SPC e ]" 'counshell-projectile-gnuglobal)
   (general-define-key "SPC e s" 'counshell-projectile-rg)
   (general-define-key "SPC e f" 'counshell-projectile-fd)
  )

(provide 'my-counshell)

