;;

(defun counsel-lor-function (str)
  "Run str using the shell if its size is > 2"
  (if (< (length str) 2)
      (counsel-more-chars 2)
    (counsel--async-command
     (format "bash -c 'cd %s; %s' </dev/null | cat" (projectile-project-root) str))
    '("" "working...")))


(defun counsel-lor-action-file (filename)
  "Open filename if it is an existing file"
  (let ((filepath (projectile-expand-root filename)))
    (when (file-exists-p filepath)
      (with-ivy-window
	(find-file filepath)))))


(defun counsel-lor-action-file-linenum (filename linenum)
  "Open filename and go to linenum if filename is an existing file"
  (let ((filepath (projectile-expand-root filename)))
    (when (file-exists-p filepath)
      (with-ivy-window
	(progn
	  (find-file filepath)
	  (goto-char (point-min))
	  (forward-line (- linenum 1)))))))

;;;###autoload
(defun counsel-lor ()
  "Invoke a subprocess through the shell"
  (interactive)
  (ivy-read "$ " #'counsel-lor-function
	    :initial-input ""
	    :dynamic-collection t
	    :history 'counsel-lor-history
	    :action (lambda (str)
		      (when str
			(cond
			 ((counsel-lor-action-file str) ())
			 ((counsel-lor-action-file (string-trim-left str)) ())
			 ((counsel-lor-action-file-linenum (replace-regexp-in-string ":.*$" "" str)
							   (string-to-number (replace-regexp-in-string "^[^:]+:\\([0-9]\\):.*" "\\1" str))) ())
			 ((counsel-lor-action-file (replace-regexp-in-string ":.*$" "" str)) ())
			 (t (message (format "File not found or unable to parse [%s]" str))))))
	    :unwind #'counsel-delete-process
	    :caller 'counsel-lor))
