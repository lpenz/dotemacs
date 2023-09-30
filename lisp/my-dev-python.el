;; my-dev-python.el -*- lexical-binding: t; -*-

(use-package python-black
  :hook python-mode)

(use-package python-isort
  :hook python-mode)

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(provide 'my-dev-python)
