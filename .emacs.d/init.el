;; there shouldn't be a single use-package call in this file
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; load modules
(defun load-directory (dir-path)
  (let ((files (directory-files-recursively dir-path "\.el$")))
    (mapcar 'load-file files)))
(load-directory "~/.emacs.d/modules/")
(toggle-frame-maximized)

(put 'dired-find-alternate-file 'disabled nil)
