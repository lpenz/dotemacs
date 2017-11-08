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
	'((t   . ivy--regex-ignore-order)))
  (define-key evil-normal-state-map (kbd "SPC r") 'ivy-resume)
  )

(use-package counsel
  :config
  (general-define-key "SPC s" 'counsel-rg)
  (general-define-key "SPC f f" 'counsel-find-file)
  (general-define-key "SPC m" 'counsel-bookmark)
  (general-define-key "SPC z" 'counsel-fzf)
  )
