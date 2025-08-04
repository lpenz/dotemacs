;; my-lsp.el -*- lexical-binding: t; -*-

(use-package lsp-mode
  :general
  ("SPC l"  'lsp)
  :commands lsp
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config
  ;; Disable lsp completion to enable corfu
  (setq lsp-completion-provider :none)
  ;; Disable generic snippets
  (setq lsp-enable-snippet nil)
  )

;; extensions:

;; (use-package lsp-ui :commands lsp-ui-mode)

;; (use-package lsp-treemacs
;;   :after lsp-mode
;;   :commands lsp-treemacs-errors-list)

;; Debugger:
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(provide 'my-lsp)
