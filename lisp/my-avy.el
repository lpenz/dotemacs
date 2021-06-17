;; my-avy.el

(use-package avy
  :config
  (general-define-key "M-'" 'avy-goto-line)
  (general-define-key :keymaps 'ivy-minibuffer-map "M-'" 'ivy-avy)
  (general-define-key :keymaps 'swiper-map "M-'" 'swiper-avy)
  )

(provide 'my-avy)

