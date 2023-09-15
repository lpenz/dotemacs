;; my-projectile.el

(use-package projectile
  :config
  (setq projectile-project-compilation-cmd "")
  (general-define-key "<f10>" 'projectile-compile-project)
  (general-define-key "SPC '" 'projectile-run-shell)
  )

(provide 'my-projectile)

