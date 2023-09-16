;; my-misc.el -*- lexical-binding: t; -*-

(use-package fill-column-indicator)

(use-package mood-line
  :config
  (mood-line-mode))

(use-package direnv
  :config
  (direnv-mode))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package dumb-jump
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(add-hook 'after-init-hook (lambda () (require 'my-afterinit)))

;; Local configurations
(if (file-exists-p "~/.emacs-local.el")
    (load "~/.emacs-local.el"))

;; Customizations go to another file, not to this one
(setq custom-file "~/.emacs-custom.el")
(write-region "" nil custom-file)
(load custom-file)

(provide 'my-misc)
