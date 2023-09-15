;; my-vertico.el

(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-count 20)
  )

(use-package consult
  :config
  (consult-customize
   consult-line
   :add-history (seq-some #'thing-at-point '(region symbol)))
  (defalias 'consult-line-thing-at-point 'consult-line)
  (consult-customize
   consult-line-thing-at-point
   :initial (thing-at-point 'symbol))
  (general-define-key "SPC /" 'consult-line)
  (general-define-key "SPC e s" 'consult-ripgrep)
  (general-define-key "SPC e f" 'consult-fd)
  (general-define-key "SPC e h" 'consult-history)
  (general-define-key "SPC e i" 'consult-imenu)
  (general-define-key "SPC e p" 'consult-yank-pop)
  (general-define-key "SPC p" 'consult-yank-pop)
  (general-define-key "SPC e m" 'consult-bookmark)
  (general-define-key "SPC e b" 'consult-buffer)
  (general-define-key "SPC e c" 'consult-compile-error)
  (general-define-key "SPC e l" 'consult-flymake)
  (general-define-key "*" 'consult-line-thing-at-point)

  ;; (general-define-key "SPC e y" 'consult-isearch-history)
  ;; (general-define-key :keymaps 'isearch-mode-map "M-e" 'consult-isearch-history)
  ;; (general-define-key :keymaps 'isearch-mode-map "M-s e" 'consult-isearch-history)
  (general-define-key :keymaps 'isearch-mode-map "M-l" 'consult-line)
  (general-define-key :keymaps 'isearch-mode-map "M-m" 'consult-line-multi)
  )

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Use the `orderless' completion style.
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(provide 'my-vertico)
