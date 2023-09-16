;; my-projectile.el -*- lexical-binding: t; -*-

(use-package projectile
  :config
  (setq projectile-project-compilation-cmd "")
  (general-define-key "<f10>" 'projectile-compile-project)
  )

(provide 'my-projectile)

