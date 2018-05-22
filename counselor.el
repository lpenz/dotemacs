;;

;; (setq debug-on-error t)

(defun counselor-function (prefix str)
  "Run str using the shell if its size is > 2"
  (if (< (length str) 2)
      (counsel-more-chars 2)
    (counsel--async-command
       (format "bash -c '%s%s; echo EOF' </dev/null | cat" prefix str))
    '("" "working...")))

(defun counselor-projectile-function (str)
  "Run str using the shell if its size is > 2, projectile version"
  (let ((cdstr (if (projectile-project-p) (format "cd %s; " (projectile-project-root)) "")))
       (counselor-function cdstr str)))

(defun counselor-filepath (filename)
  "Figure out the path of the file by checking for projectile"
  (if (projectile-project-p) (projectile-expand-root filename) filename))


(defun counselor-action-file (filename)
  "Open filename if it is an existing file"
  (let ((filepath (counselor-filepath filename)))
    (when (file-exists-p filepath)
      (with-ivy-window
        (find-file filepath)))))


(defun counselor-action-file-linenum (filename linenum)
  "Open filename and go to linenum if filename is an existing file"
  (let ((filepath (counselor-filepath filename)))
    (when (file-exists-p filepath)
      (with-ivy-window
        (progn
          (find-file filepath)
          (goto-char (point-min))
          (forward-line (- linenum 1)))))))

(defun counselor-sh-read (func)
  "Invoke a subprocess through the shell"
  (ivy-read "$ " func
            :initial-input ""
            :dynamic-collection t
            :history 'counselor-history
            :action (lambda (str)
                      (when str
                        (cond
                         ((counselor-action-file str) ())
                         ((counselor-action-file (string-trim-left str)) ())
                         ((counselor-action-file-linenum (replace-regexp-in-string ":.*$" "" str)
                                                         (string-to-number (replace-regexp-in-string "^[^:]+:\\([0-9]+\\):.*" "\\1" str))) ())
                         ;; GNU global:
                         ((counselor-action-file-linenum (replace-regexp-in-string "^[^ ] [0-9]+ \\([^ ]+\\).*" "\\1" str)
                                                         (string-to-number (replace-regexp-in-string "^[^ ] \\([0-9]+\\).*" "\\1" str))) ())
                         ((counselor-action-file (replace-regexp-in-string ":.*$" "" str)) ())
                         (t (message (format "File not found or unable to parse [%s]" str))))))
            :unwind #'counsel-delete-process
	    :caller 'counselor))

;;;###autoload
(defun counselor-projectile-sh ()
  "Invoke a subprocess through the shell"
  (interactive)
  (counselor-sh-read #'counselor-projectile-function)
  )

;;;###autoload
(defun counselor-sh ()
  "Invoke a subprocess through the shell"
  (interactive)
  (counselor-sh-read (lambda (str) (counselor-function "" str)))
  )
