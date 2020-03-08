;; my-ivy.el

(use-package ivy
  :after (evil)
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
  (define-key
    ivy-switch-buffer-map
    (kbd "C-q")
    (lambda ()
      (interactive)
      (ivy-set-action 'kill-buffer)
      (ivy-done)))
  (general-define-key "SPC r" 'ivy-resume)
  (general-define-key "SPC w" 'swiper-isearch)
  (general-define-key "/" 'swiper-isearch)
  (general-define-key "*" 'swiper-isearch-thing-at-point)
  (general-define-key :keymaps 'evil-visual-state-map "*" 'swiper-isearch-thing-at-point)
  )

(use-package ivy-hydra)

(use-package counsel
  :config
  (counsel-mode)
  (general-define-key "SPC f f" 'counsel-find-file)
  (general-define-key "SPC m" 'counsel-bookmark)
  (general-define-key "SPC z" 'counsel-fzf)
  )

(use-package counsel-gtags
  :config
  (general-define-key "SPC t d" 'counsel-gtags-find-definition)
  (general-define-key "SPC t g" 'counsel-gtags-find-reference)
  (general-define-key "SPC t f" 'counsel-gtags-find-file)
  (general-define-key "SPC t ]" 'counsel-gtags-dwim)
  (general-define-key "SPC ]" 'counsel-gtags-dwim)
  )

(use-package counsel-projectile
  :config
  (use-package projectile
    :config
    (setq projectile-completion-system 'ivy)
    (setq projectile-project-compilation-cmd "") ;; workaround for https://github.com/bbatsov/projectile/issues/1270
    (general-define-key "<f10>" 'projectile-compile-project)
    (general-define-key "SPC '" 'projectile-run-eshell)
    )
  (counsel-projectile-mode)
  (general-define-key "SPC p" 'counsel-yank-pop)
  (general-define-key "SPC s" 'counsel-projectile-rg)
  )
