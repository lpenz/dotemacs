;; my-company.el

(use-package company
  :config
  (setq company-idle-delay nil)
  (setq company-minimum-prefix-length 1)
  (global-company-mode t)
  (general-def "M-/" 'company-complete)
  (general-def 'insert 'override "M-/" 'company-complete)
  ;; Other bindings in my-evil.el in :config of evil-collection
  )
