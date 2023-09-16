;; my-lsp.el -*- lexical-binding: t; -*-

(use-package lsp-mode
  :general
  ("SPC l"  'lsp)
  :commands lsp
  :hook ((rust-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq lsp-rust-server 'rust-analyzer))

;; extensions:

;; (use-package lsp-ui :commands lsp-ui-mode)

;; (use-package lsp-treemacs
;;   :after lsp-mode
;;   :commands lsp-treemacs-errors-list)

;; Debugger:
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(provide 'my-lsp)
