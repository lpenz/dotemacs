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
  (general-define-key :keymaps 'evil-normal-state-map "SPC r" 'ivy-resume)
  )

(use-package ivy-hydra)

(use-package counsel
  :config
  (general-define-key "SPC f f" 'counsel-find-file)
  (general-define-key "SPC m" 'counsel-bookmark)
  (general-define-key "SPC z" 'counsel-fzf)
  )

(use-package counsel-gtags
  :config
  (general-define-key "SPC t d" 'counsel-gtags-find-definition)
  (general-define-key "SPC t g" 'counsel-gtags-find-reference)
  )

(use-package counsel-projectile
  :config
  (general-define-key "SPC s" 'counsel-projectile-rg)
  )
