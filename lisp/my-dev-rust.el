;; my-dev-rust.el -*- lexical-binding: t; -*-

(use-package rust-ts-mode
  :mode "\\.rs\\'"
  :hook
  (rust-ts-mode . (lambda()
                    (lsp-deferred)
                    (setq-local apheleia-formatter 'rustfmt)
                    (apheleia-mode 1)
                    (require 'compile)
                    (add-to-list 'compilation-error-regexp-alist-alist
                                 '(rustc
                                   "^\\(?:error\\|warning\\).*\\(?:\n *--> \\)?\\([^:\n]+\\):\\([0-9]+\\):\\([0-9]+\\)"
                                   1 2 3))
                    (add-to-list 'compilation-error-regexp-alist 'rustc)
                    ))
  :init
  (my-treesit-setup-lang
   'rust
   #'rust-ts-mode
   "https://github.com/tree-sitter/tree-sitter-rust")
  :config
  (setq lsp-rust-analyzer-cargo-extra-env (make-hash-table :test 'equal))
  )

(provide 'my-dev-rust)

