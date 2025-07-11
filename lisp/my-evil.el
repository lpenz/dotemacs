;; my-evil.el -*- lexical-binding: t; -*-

(use-package general
  :demand t
  :config
  (setq-default general-default-keymaps 'evil-normal-state-map))

(use-package evil
  :demand t
  :after general
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-redo)
  :general
  ("<f2>" 'save-buffer)
  ("C-w <left>"  'evil-window-left)
  ("C-w <right>" 'evil-window-right)
  ("C-w <up>"    'evil-window-up)
  ("C-w <down>"  'evil-window-down)
  ("C-w e"  'delete-other-windows)
  ("C-w C-e"  'delete-other-windows)
  ("SPC TAB" 'evil-buffer)
  ;; ("SPC f f" 'find-file)
  ("SPC b b" 'switch-to-buffer)
  ("SPC SPC" 'execute-extended-command)
  (:keymaps 'evil-visual-state-map "SPC a" 'my-align-regexp)
  :config
  (evil-mode 1)
  (defun my-align-regexp (start end regexp)
    "Repeat alignment with respect to the given regular expression."
    (interactive "r\nsAlign regexp: ")
    (align-regexp start end (concat "\\(\\s-*\\)" regexp) 1 1 t))
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
  :demand t
  :after evil
  :after cape
  :init
  (setq-default evil-collection-mode-list
                '(compile
                  consult
                  corfu
                  eshell
                  magit
                  magit-section
                  vertico))
  :config
  (evil-collection-init))

(provide 'my-evil)
