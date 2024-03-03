;; my-vertico.el -*- lexical-binding: t; -*-

(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-count 20)
  :general
  ("<f4>" 'vertico-down-from-outside)
  (:keymaps 'vertico-map "<next>" 'vertico-scroll-up)
  (:keymaps 'vertico-map "<prior>" 'vertico-scroll-down)
  :config
  (defun vertico-down-from-outside ()
    "Move to next candidate in minibuffer, even when minibuffer isn't selected."
    (interactive)
    (with-selected-window (active-minibuffer-window)
      (execute-kbd-macro [down]))))

(use-package consult
  :demand t
  :after embark-consult
  :config

  ;; Adds support for * as consult-line-thing-at-point
  (consult-customize
   consult-line
   :add-history (seq-some #'thing-at-point '(region symbol)))
  (defalias 'consult-line-thing-at-point 'consult-line)
  (consult-customize
   consult-line-thing-at-point
   :initial (thing-at-point 'symbol))
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  :general
  ("SPC /" 'consult-line)
  ("SPC e s" 'consult-ripgrep)
  ("SPC e f" 'consult-fd)
  ("SPC e h" 'consult-history)
  ("SPC e i" 'consult-imenu)
  ("SPC e p" 'consult-yank-pop)
  ("SPC p" 'consult-yank-pop)
  ("SPC e m" 'consult-bookmark)
  ("SPC e b" 'consult-buffer)
  ("SPC e c" 'consult-compile-error)
  ("SPC e l" 'consult-flymake)
  ("*" 'consult-line-thing-at-point)

  ;; (general-define-key "SPC e y" 'consult-isearch-history)
  ;; (general-define-key :keymaps 'isearch-mode-map "M-e" 'consult-isearch-history)
  ;; (general-define-key :keymaps 'isearch-mode-map "M-s e" 'consult-isearch-history)
  (:keymaps 'isearch-mode-map "M-l" 'consult-line)
  (:keymaps 'isearch-mode-map "M-m" 'consult-line-multi))

(use-package consult-flycheck
  :after consult
  :general
  ("SPC e y" 'consult-flycheck))

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

(use-package embark
  :demand t
  :general
  (:keymaps 'evil-normal-state-map "M-j" 'embark-act)
  (:keymaps 'evil-normal-state-map "M-k" 'embark-dwim)
  (:keymaps 'minibuffer-local-map "M-j" 'embark-act)
  (:keymaps 'minibuffer-local-map "M-k" 'embark-dwim)
  ;; Alternative for `describe-bindings':
  (:keymaps 'evil-normal-state-map "C-h B" 'embark-bindings)
  (:keymaps 'minibuffer-local-map "C-h B" 'embark-bindings)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(provide 'my-vertico)
