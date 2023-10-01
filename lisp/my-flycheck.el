;; my-flycheck.el -*- lexical-binding: t; -*-

(use-package flycheck
  :init
  (global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc python-mypy python-pylint))
  (setq-default flycheck-python-flake8-executable "/usr/bin/flake8")
  (add-to-list 'safe-local-variable-values (quote ((flycheck-gcc-language-standard . "c++17"))))
  (add-to-list 'safe-local-variable-values (quote ((flycheck-clang-language-standard . "c++17"))))
  )

(provide 'my-flycheck)

