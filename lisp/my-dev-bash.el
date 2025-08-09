;; my-dev-bash.el -*- lexical-binding: t; -*-

(use-package shfmt
  :hook (bash-ts-mode . shfmt-on-save-mode)
  :custom
  (shfmt-arguments '("-i" "4")))

(add-hook 'bash-ts-mode-hook
          (lambda() (my-treesit-setup-lang
                     'bash
                     #'bash-ts-mode
                     "https://github.com/tree-sitter/tree-sitter-bash")))

(provide 'my-dev-bash)
