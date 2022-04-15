;; my-lsp.el

(use-package lsp-mode
  :init
  (general-define-key "SPC l"  'lsp)
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (rust-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; extensions:

;; (use-package lsp-ui :commands lsp-ui-mode)

(use-package lsp-ivy
  :after lsp-mode ivy
  :commands lsp-ivy-workspace-symbol)

;; (use-package lsp-treemacs
;;   :after lsp-mode
;;   :commands lsp-treemacs-errors-list)

;; Debugger:
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(provide 'my-lsp)
