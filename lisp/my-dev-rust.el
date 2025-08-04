;; my-dev-rust.el -*- lexical-binding: t; -*-

(require 'compile)
(add-to-list 'compilation-error-regexp-alist-alist
             '(rustc
               "^\\(?:error\\|warning\\).*\\(?:\n *--> \\)?\\([^:\n]+\\):\\([0-9]+\\):\\([0-9]+\\)"
               1 2 3))
(add-to-list 'compilation-error-regexp-alist 'rustc)

(use-package rust-ts-mode
  :mode "\\.rs\\'"
  :hook ((rust-ts-mode . lsp)
         (rust-ts-mode . my/rust-format-on-save)
         )
  :init
  (require 'treesit)
  ;; Add the grammar recipe manually (in case it's missing)
  (add-to-list 'treesit-language-source-alist
               '(rust "https://github.com/tree-sitter/tree-sitter-rust"))
  ;; Install grammar if it's not already available
  (unless (treesit-language-available-p 'rust)
    (treesit-install-language-grammar 'rust))
  (defun my/rust-format-on-save ()
    "Format Rust buffer using LSP before saving."
    (add-hook 'before-save-hook #'lsp-format-buffer nil t))
  :config
  (setq lsp-rust-analyzer-cargo-extra-env (make-hash-table :test 'equal))
  )

(provide 'my-dev-rust)

