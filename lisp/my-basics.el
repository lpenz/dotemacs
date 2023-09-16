;; my-basics.el -*- lexical-binding: t; -*-

(setq-default indent-tabs-mode nil) ;; Indent with spaces
(setq inhibit-startup-message t) ;; No startup message
(setq scroll-step 1) ;; smooth scrolling
(setq-default c-basic-offset 4)
(setq-default ediff-split-window-function 'split-window-horizontally)
(setq version-control 'never)
(setq make-backup-files nil)

(provide 'my-basics)
