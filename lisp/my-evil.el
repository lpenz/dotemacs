;; my-evil.el -*- lexical-binding: t; -*-

(use-package general
  :demand t
  :config
  (setq-default general-default-keymaps 'evil-normal-state-map))

(use-package evil
  :demand t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1)
  (general-define-key "<f2>" 'save-buffer)
  (general-define-key "C-w <left>"  'evil-window-left)
  (general-define-key "C-w <right>" 'evil-window-right)
  (general-define-key "C-w <up>"    'evil-window-up)
  (general-define-key "C-w <down>"  'evil-window-down)
  (general-define-key "SPC TAB" 'evil-buffer)
  ;; (general-define-key "SPC f f" 'find-file)
  (general-define-key "SPC b b" 'switch-to-buffer)
  (general-define-key "SPC g s" 'magit-status)
  (general-define-key "SPC SPC" 'execute-extended-command)
  (general-define-key "<f4>" 'next-error)

  ;; Unbind some keys that misbehave when latency is high
  (global-set-key (kbd "M-k") nil)
  (global-set-key (kbd "M-j") nil)
  (global-set-key (kbd "M-h") nil)
  (global-set-key (kbd "M-l") nil))

(use-package evil-nerd-commenter
  :after evil
  :general
  ("SPC c l" 'evilnc-comment-or-uncomment-lines)
  (:keymaps 'evil-visual-state-map "SPC c l" 'evilnc-comment-or-uncomment-lines))

(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(compile
                                    magit
                                    term))
  (evil-collection-init))

(provide 'my-evil)
