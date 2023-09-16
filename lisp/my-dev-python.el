;; my-dev-python.el -*- lexical-binding: t; -*-

(use-package python-black
  :hook python-mode
  :commands (python-black-buffer
             python-black-region
             python-black-on-save-mode))

(use-package python-isort
  :hook python-mode
  :commands (python-isort-buffer
             python-isort-region
             python-isort-on-save-mode))

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(provide 'my-dev-python)
