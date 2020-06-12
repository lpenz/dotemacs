;; my-magit.el

(use-package magit
  :init
  (setq magit-save-repository-buffers 'dontask)
  :config
  (add-to-list 'magit-section-initial-visibility-alist '(unpulled . show))
  (add-to-list 'magit-section-initial-visibility-alist '(unpushed . show))
  (add-to-list 'magit-section-initial-visibility-alist '(recent . show)))

(use-package evil-magit)

