;;; my-apheleia.el --- My apheleia configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My apheleia configuration.

;;; Code:

(use-package apheleia
  :demand t
  :general
  ("SPC f" 'apheleia-format-buffer)
  :config
  (setf (alist-get 'rustfmt apheleia-formatters)
        '("rustfmt" "--edition" "2024" "--quiet" "--emit" "stdout"))
  (setf (alist-get 'yamlfmt apheleia-formatters)
        '("yamlfix" "-"))
  (setf (alist-get 'fish-indent apheleia-formatters)
        '("fish" "-c" "fish_indent"))
  (apheleia-global-mode 1)
  )

(provide 'my-apheleia)
;;; my-apheleia.el ends here
