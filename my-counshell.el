;; my-counshell.el

(use-package counshell
  :quelpa ((counshell :fetcher github :repo "lpenz/counshell") :upgrade t)
  ;; :quelpa ((counshell :fetcher file :path "/home/lpenz/projs/counshell/counshell.el") :upgrade t)
  :config
   (general-define-key "SPC e e" 'counshell-projectile-sh)
   (general-define-key "SPC e ]" 'counshell-projectile-gnuglobal)
   (general-define-key "SPC e s" 'counshell-projectile-rg)
   (general-define-key "SPC e f" 'counshell-projectile-fd)
  )

