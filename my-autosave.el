;; my-autosave.el

(use-package real-auto-save)
(add-hook 'text-mode-hook 'real-auto-save-mode)
(add-hook 'prog-mode-hook 'real-auto-save-mode)
(setq version-control 'never)
