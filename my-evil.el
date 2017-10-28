;; my-evil.el

(use-package evil
    :config
    (evil-mode 1)
    (define-key evil-insert-state-map (kbd "<f2>") 'save-buffer)
    (define-key evil-normal-state-map (kbd "<f2>") 'save-buffer)
    (define-key evil-normal-state-map (kbd "SPC TAB") 'evil-buffer)
    (define-key evil-normal-state-map (kbd "SPC f f") 'helm-find-files)
    (define-key evil-normal-state-map (kbd "SPC b b") 'helm-buffers-list)
    )

(use-package evil-nerd-commenter)
