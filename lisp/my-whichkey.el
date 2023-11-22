;; my-whichkey.el -*- lexical-binding: t; -*-

(use-package which-key
  :demand t
  :after evil
  :config
  (which-key-mode)
  :custom
  (which-key-idle-delay 0.7))

(provide 'my-whichkey)

