;; shell config and hook

(setq explicit-shell-file-name "/bin/bash")

(let ((bashrc (list
               (concat user-emacs-directory
                       (convert-standard-filename "bash.bashrc")))))
  (setq explicit-bash-args
        (append '("--rcfile") bashrc '("-i"))))

(defun my-shell-hook ()
  (general-define-key :keymaps 'shell-mode-map "TAB" 'completion-at-point)
  (general-define-key :keymaps 'shell-mode-map "M-r" 'counsel-shell-history)
  (general-define-key :keymaps 'shell-mode-map "C-c r" 'counsel-shell-history))

(add-hook 'shell-mode-hook 'my-shell-hook)

(provide 'my-shell)

