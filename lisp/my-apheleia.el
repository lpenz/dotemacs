;; my-apheleia.el -*- lexical-binding: t; -*-

(use-package apheleia
  :general
  ("SPC f" 'apheleia-format-buffer)
  :config
  (setf (alist-get 'isort apheleia-formatters)
        '("isort" "--stdout" "-"))
  (setf (alist-get 'rustfmt apheleia-formatters)
        '("rustfmt" "--edition" "2024" "--quiet" "--emit" "stdout"))
  (setf (alist-get 'yamlfmt apheleia-formatters)
        '("yamlfix" "-"))
  (setf (alist-get 'fishfmt apheleia-formatters)
        '("fish_indent"))
  )

(provide 'my-apheleia)
