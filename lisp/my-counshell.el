;; my-counshell.el -*- lexical-binding: t; -*-

(straight-use-package
 '(counshell :type git :host github :repo "lpenz/counshell"))

(use-package counshell
  :general
  ("SPC e e" 'counshell-projectile-sh)
  ("SPC e ]" 'counshell-projectile-gnuglobal)
  ("SPC e r" 'counshell-projectile-rg)
  )

(provide 'my-counshell)

