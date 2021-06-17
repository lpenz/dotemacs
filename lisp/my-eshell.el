;; eshell hook

(defun my-eshell-hook ()
  (general-define-key :keymaps 'eshell-mode-map "TAB" 'completion-at-point)
  (general-define-key :keymaps 'eshell-mode-map "M-r" 'counsel-esh-history)
  (general-define-key :keymaps 'eshell-mode-map "C-c r" 'counsel-esh-history))

(add-hook 'eshell-mode-hook 'my-eshell-hook)

(provide 'my-eshell)

