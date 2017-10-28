;; my-evil.el

(use-package evil
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "<f2>") 'save-buffer)
  (define-key evil-normal-state-map (kbd "<f2>") 'save-buffer)
  (define-key evil-normal-state-map (kbd "SPC TAB") 'evil-buffer)
  (define-key evil-normal-state-map (kbd "SPC f f") 'find-file)
  (define-key evil-normal-state-map (kbd "SPC b b") 'switch-to-buffer)

  (use-package evil-nerd-commenter
    :config
    (define-key evil-normal-state-map (kbd "SPC c l") 'evilnc-comment-or-uncomment-lines)
    (define-key evil-visual-state-map (kbd "SPC c l") 'evilnc-comment-or-uncomment-lines))
  )
