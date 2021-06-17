;; my-company.el

(use-package company
  :defines company-dabbrev-downcase company-dabbrev-ignore-case
  :config
  (setq company-idle-delay nil)
  (setq company-selection-wrap-around t)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case nil)
  (global-company-mode t)
  (general-def "M-/" 'company-complete)
  (general-def 'insert 'override "M-/" 'company-complete)
  (general-def company-active-map "C-f" 'company-filter-candidates)
  (general-def company-active-map "C-y" 'company-complete-selection)
  (general-def company-active-map "RET" 'company-complete-selection)
  ;; Other bindings in my-evil.el in :config of evil-collection
  )

(provide 'my-company)

