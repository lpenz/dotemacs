;;; my-counshell.el --- My counshell configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My counshell configuration.

;;; Code:

(straight-use-package
 '(counshell :type git :host github :repo "lpenz/counshell"))

(use-package counshell
  :general
  ("SPC e e" 'counshell-projectile-sh)
  ("SPC e ]" 'counshell-projectile-gnuglobal)
  ("SPC e r" 'counshell-projectile-rg)
  )

(provide 'my-counshell)
;;; my-counshell.el ends here
