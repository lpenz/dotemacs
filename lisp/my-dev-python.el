;; my-dev-python.el -*- lexical-binding: t; -*-

(use-package lsp-pyright
  :demand t
  :after python)

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(add-hook 'python-ts-mode-hook
          (lambda()
            (my-treesit-setup-lang
             'python
             #'python-ts-mode
             "https://github.com/tree-sitter/tree-sitter-python")
            (lsp-deferred)
            (setq-local apheleia-formatter '(ruff-isort black))
            ))

(provide 'my-dev-python)
