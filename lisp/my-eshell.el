;; eshell -*- lexical-binding: t; -*-

(straight-use-package
 '(aweshell :type git :host github :repo "manateelazycat/aweshell"))

(use-package aweshell
  :general
  ("SPC #" 'aweshell-switch-buffer)
  :config
  (defun my-eshell-hook ()
    (general-define-key :keymaps 'eshell-mode-map "TAB" 'completion-at-point))
  (add-hook 'eshell-mode-hook 'my-eshell-hook))

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode))

(provide 'my-eshell)

