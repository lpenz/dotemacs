;; my-evil.el

(use-package evil
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
  (general-define-key "<f4>" 'next-error)

  (use-package evil-nerd-commenter
    :config
    (general-define-key "SPC c l" 'evilnc-comment-or-uncomment-lines)
    (define-key evil-visual-state-map (kbd "SPC c l") 'evilnc-comment-or-uncomment-lines))

  (use-package evil-visualstar
    :config
    (global-evil-visualstar-mode))
  )
