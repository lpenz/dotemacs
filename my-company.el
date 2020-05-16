;; my-company.el

(use-package company
  :config
  (setq company-idle-delay nil)
  (setq company-minimum-prefix-length 1)
  (global-company-mode t)
  (general-define-key :keymaps 'evil-insert-state-map "M-/" 'company-complete)
  ;; Other bindings in my-evil.el in :config of evil-collection
  )
