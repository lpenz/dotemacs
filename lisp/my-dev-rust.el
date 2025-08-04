;; my-dev-rust.el -*- lexical-binding: t; -*-

(use-package rust-mode
  :mode "\\.rs\\'"
  :custom
  (rust-match-angle-brackets t)
  (rust-format-on-save t))

(provide 'my-dev-rust)

