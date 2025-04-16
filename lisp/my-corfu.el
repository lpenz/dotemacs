;; my-corfu.el -*- lexical-binding: t; -*-

;; corfu.el - COmpletion in Region FUnction
(use-package corfu
  :demand t
  :config
  (global-corfu-mode)
  ;; (corfu-history-mode)
  ;; (corfu-popupinfo-mode)
  )

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)
  )

;; Makes corfu works in terminal
;; (remove this after upgrading to Emacs 31)
(straight-use-package
 '(corfu-terminal
   :type git
   :repo "https://codeberg.org/akib/emacs-corfu-terminal.git"))

(use-package corfu-terminal
  :demand t
  :after corfu
  :config
  (corfu-terminal-mode)
  )

(use-package cape
  :demand t
  :after corfu
  :after general
  :general
  ("C-p" 'cape-dabbrev)
  ("C-n" 'cape-prefix-map)
  (:keymaps 'evil-insert-state-map "C-p" 'cape-dabbrev)
  (:keymaps 'evil-insert-state-map "C-n" 'cape-prefix-map)
  (:keymaps 'cape-prefix-map "C-n" 'completion-at-point)
  :config
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
)

(use-package nerd-icons-corfu
  :demand t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(provide 'my-corfu)
