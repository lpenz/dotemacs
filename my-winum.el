;; winum.el

(use-package winum
  :config
  (winum-mode)
  (general-define-key "M-`" 'winum-select-window-by-number)
  (general-define-key "M-1" 'winum-select-window-1)
  (general-define-key "M-2" 'winum-select-window-2)
  (general-define-key "M-3" 'winum-select-window-3)
  (general-define-key "M-4" 'winum-select-window-4)
  (general-define-key "M-5" 'winum-select-window-5)
  (general-define-key "M-6" 'winum-select-window-6)
  )
