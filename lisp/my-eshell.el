;; eshell -*- lexical-binding: t; -*-

(straight-use-package
 '(aweshell :type git :host github :repo "manateelazycat/aweshell"))

(use-package aweshell
   :config
   (general-define-key "SPC #" 'aweshell-switch-buffer))

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode))

(defun my-eshell-hook ()
  (general-define-key :keymaps 'eshell-mode-map "TAB" 'completion-at-point))

(add-hook 'eshell-mode-hook 'my-eshell-hook)

(provide 'my-eshell)

