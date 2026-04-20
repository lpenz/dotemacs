;;; my-compilation.el --- My compilation configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My compilation configuration.

;;; Code:

;; Make compilation buffer tail by default

(with-eval-after-load 'compile
  ;; set cursor to follow compilation output
  (setq compilation-scroll-output t))

;; Add ansi support to compilation buffer:

(require 'ansi-color)

(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(provide 'my-compilation)
;;; my-compilation.el ends here
