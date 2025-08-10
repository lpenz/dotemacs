;; my-corfu.el -*- lexical-binding: t; -*-

;; corfu.el - COmpletion in Region FUnction
(use-package corfu
  :demand t
  :general
  (:keymaps 'evil-insert-state-map "C-f" 'completion-at-point)
  :config
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  (corfu-history-mode)
  :custom
  (corfu-auto t)
  (corfu-popupinfo-delay 0.2)
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
  (:keymaps 'evil-insert-state-map "C-p" 'my/cape-dabbrev-completion)
  (:keymaps 'evil-insert-state-map "C-n" 'cape-prefix-map)
  (:keymaps 'cape-prefix-map "C-n" 'completion-at-point)
  :config
  ;; Run completion with just cape-dabbrev
  (defun my/cape-dabbrev-completion ()
    "Run completion using only `cape-dabbrev`."
    (interactive)
    (let ((completion-at-point-functions '(cape-dabbrev)))
      (completion-at-point)))
  ;; Restrict words to current buffer
  (defun my/dabbrev-current-buffer-only ()
    (list (current-buffer)))
  (advice-add 'dabbrev--select-buffers :override #'my/dabbrev-current-buffer-only)
  )

(provide 'my-corfu)
