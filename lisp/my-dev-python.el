;; my-dev-python.el -*- lexical-binding: t; -*-

(use-package python-black
  :demand t
  :after python
  :config
  (add-to-list 'safe-local-variable-values (quote (eval (lambda nil (python-black-on-save-mode t))))))

(use-package python-isort
  :demand t
  :after python
  :config
  (add-to-list 'safe-local-variable-values (quote (eval (lambda nil (python-isort-on-save-mode t))))))

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(provide 'my-dev-python)
