;; my-projectile.el -*- lexical-binding: t; -*-

(use-package projectile
  :general
  ("<f10>" 'projectile-compile-project)
  :config
  (setq projectile-project-compilation-cmd ""))

(provide 'my-projectile)

