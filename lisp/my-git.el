;; my-git.el -*- lexical-binding: t; -*-

(use-package magit
  :init
  (setq magit-save-repository-buffers 'dontask)
  :general
  ("SPC g s" 'magit-status)
  :config
  (add-to-list 'magit-section-initial-visibility-alist '(unpulled . show))
  (add-to-list 'magit-section-initial-visibility-alist '(unpushed . show))
  (add-to-list 'magit-section-initial-visibility-alist '(recent . show)))

(use-package git-gutter
  :config
  (global-git-gutter-mode +1))

(provide 'my-git)
