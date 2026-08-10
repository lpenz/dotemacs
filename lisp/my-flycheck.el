;;; my-flycheck.el --- My flycheck configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My flycheck configuration.

;;; Code:

(use-package flycheck
  :init
  (global-flycheck-mode)
  (global-flycheck-annotate-mode)
  :config
  (global-flycheck-eglot-mode 1)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc python-pylint))
  (setq-default flycheck-python-flake8-executable "/usr/bin/flake8")
  (add-to-list 'safe-local-variable-values (quote ((flycheck-gcc-language-standard . "c++17"))))
  (add-to-list 'safe-local-variable-values (quote ((flycheck-clang-language-standard . "c++17"))))
  )

(provide 'my-flycheck)
;;; my-flycheck.el ends here
