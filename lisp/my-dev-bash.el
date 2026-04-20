;;; my-dev-bash.el --- My dev-bash configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My dev-bash configuration.

;;; Code:

(add-hook 'bash-ts-mode-hook
          (lambda()
            (my-treesit-setup-lang
             'bash
             #'bash-ts-mode
             "https://github.com/tree-sitter/tree-sitter-bash")
            (lsp-deferred)
            (setq-local apheleia-formatter 'shfmt)
            ))

(provide 'my-dev-bash)
;;; my-dev-bash.el ends here
