;; my-projectile.el

(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (general-define-key "SPC a" 'projectile-find-other-file)
  (general-define-key "SPC p l" 'projectile-switch-project)
  (general-define-key "SPC p f" 'projectile-find-file)
  (general-define-key "<f10>" 'projectile-compile-project)
  (general-define-key "SPC '" 'projectile-run-eshell)
  )
