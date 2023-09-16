;; my-flycheck.el -*- lexical-binding: t; -*-

(use-package flycheck
  :init
  (global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc python-mypy python-pylint))
  (setq-default flycheck-python-flake8-executable "/usr/bin/flake8")
  )

(provide 'my-flycheck)

