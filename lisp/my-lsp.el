;; my-lsp.el -*- lexical-binding: t; -*-

(use-package lsp-mode
  :general
  ("SPC l"  'lsp)
  :commands lsp
  :hook ((rust-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-lens-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-diagnostics-provider :none)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-diagnostics nil)
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-completion-provider :none)
  (setq lsp-completion-show-detail nil)
  (setq lsp-completion-show-kind nil)
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
