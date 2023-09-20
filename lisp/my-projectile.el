;; my-projectile.el -*- lexical-binding: t; -*-

(use-package projectile
  :general
  ("SPC a"  'projectile-find-other-file)
  ("<f10>" 'projectile-compile-project)
  :config
  (setq projectile-project-compilation-cmd ""))

(provide 'my-projectile)

