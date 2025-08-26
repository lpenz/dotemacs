;; my-apheleia.el -*- lexical-binding: t; -*-

(use-package apheleia
  :demand t
  :general
  ("SPC f" 'apheleia-format-buffer)
  :config
  (setf (alist-get 'rustfmt apheleia-formatters)
        '("rustfmt" "--edition" "2024" "--quiet" "--emit" "stdout"))
  (setf (alist-get 'yamlfmt apheleia-formatters)
        '("yamlfix" "-"))
  (apheleia-global-mode 1)
  )

(provide 'my-apheleia)
