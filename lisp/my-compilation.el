;; my-compilation.el -*- lexical-binding: t; -*-

(use-package ansi-color
  :hook (compilation-filter . ansi-color-compilation-filter))

(setq-default compilation-window-height 10)
(setq-default compilation-scroll-output 'first-error)

;; Make window at bottom
(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (if (= (count-windows) 1)
            (let* ((w (split-window-horizontally)))
              (select-window w)
              (switch-to-buffer "*compilation*")
              (evil-goto-line))
          (let* ((w (split-window-vertically))
                 (h (window-height w)))
            (select-window w)
            (switch-to-buffer "*compilation*")
            (shrink-window (- h compilation-window-height))
            (evil-window-move-very-bottom)
            (evil-goto-line)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

(provide 'my-compilation)
