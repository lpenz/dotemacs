;; my-projectile.el

(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (define-key evil-normal-state-map (kbd "SPC p l") 'projectile-switch-project)
  (define-key evil-normal-state-map (kbd "SPC p f") 'projectile-find-file)
  (define-key evil-normal-state-map (kbd "<f10>") 'projectile-compile-project)
  (define-key evil-normal-state-map (kbd "SPC '") 'projectile-run-eshell)
  )
