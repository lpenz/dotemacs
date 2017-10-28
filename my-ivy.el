;; my-ivy.el

(use-package ivy
  ;; :bind
  ;; (:map ivy-mode-map
  ;; 	("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; number of result lines to display
  (setq ivy-height 20)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
	;; allow input not in order
	'((t   . ivy--regex-ignore-order))))

(use-package counsel
  :config
  (define-key evil-normal-state-map (kbd "SPC s") 'counsel-rg)
  )
