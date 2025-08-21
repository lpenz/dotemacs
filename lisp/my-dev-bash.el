;; my-dev-bash.el -*- lexical-binding: t; -*-

(add-hook 'bash-ts-mode-hook
          (lambda()
            (my-treesit-setup-lang
             'bash
             #'bash-ts-mode
             "https://github.com/tree-sitter/tree-sitter-bash")
            (lsp-deferred)
            (setq-local apheleia-formatter 'shfmt)
            (apheleia-mode 1)
            ))

(provide 'my-dev-bash)
