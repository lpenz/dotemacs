;; my-misc.el -*- lexical-binding: t; -*-

(use-package fill-column-indicator
  :commands set-fill-column)

(use-package mood-line
  :straight (mood-line :type git :host gitlab :repo "jessieh/mood-line" :branch "2.3.0")
  :demand t
  :custom
  (mood-line-glyph-alist mood-line-glyphs-unicode)
  :config
  (mood-line-mode 1))

(use-package direnv
  :config
  (direnv-mode))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package dumb-jump
  :demand t
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
