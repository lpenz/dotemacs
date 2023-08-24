;; shell config and hook

(setq explicit-shell-file-name "/bin/bash")

(let ((bashrc (list
               (concat user-emacs-directory
                       (convert-standard-filename "bash.bashrc")))))
  (setq explicit-bash-args
        (append '("--rcfile") bashrc '("-i"))))

(provide 'my-shell)

