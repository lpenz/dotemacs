;; winum.el

(use-package winum
  :config
  (winum-mode)
  (define-key evil-normal-state-map (kbd "M-`") 'winum-select-window-by-number)
  (define-key evil-normal-state-map (kbd "M-1") 'winum-select-window-1)
  (define-key evil-normal-state-map (kbd "M-2") 'winum-select-window-2)
  (define-key evil-normal-state-map (kbd "M-3") 'winum-select-window-3)
  (define-key evil-normal-state-map (kbd "M-4") 'winum-select-window-4)
  (define-key evil-normal-state-map (kbd "M-5") 'winum-select-window-5)
  (define-key evil-normal-state-map (kbd "M-6") 'winum-select-window-6)
  )
