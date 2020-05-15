;; auto save often
;; save every 20 characters typed (this is the minimum)

(setq  auto-save-interval 20)

;; Write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old
;; backup settings                                                        ;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; https://www.emacswiki.org/emacs/BackupFiles
;; (setq
;;  backup-by-copying t     ; don't clobber symlinks
;;  kept-new-versions 10    ; keep 10 latest versions
;;  kept-old-versions 0     ; don't bother with old versions
;;  delete-old-versions t   ; don't ask about deleting old versions
;;  version-control t       ; number backups
;;  vc-make-backup-files t) ; backup version controlled files

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; backup every save                                                      ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
;; ;; https://www.emacswiki.org/emacs/backup-each-save.el
;; (defvar bjm/backup-file-size-limit (* 5 1024 1024)
;;   "Maximum size of a file (in bytes) that should be copied at each savepoint.

;; If a file is greater than this size, don't make a backup of it.
;; Default is 5 MB")

;; (defvar bjm/backup-location (expand-file-name "~/.emacs.d/.cache/emacs-backups/")
;;   "Base directory for backup files.")

;; (defvar bjm/backup-trash-dir (expand-file-name "~/.Trash")
;;   "Directory for unwanted backups.")

;; (defvar bjm/backup-exclude-regexp "\\[Gmail\\]"
;;   "Don't back up files matching this regexp.
;; Files whose full name matches this regexp are backed up to `bjm/backup-trash-dir'. Set to nil to disable this.")

;; ;; Default and per-save backups go here:
;; ;; N.B. backtick and comma allow evaluation of expression
;; ;; when forming list
;; (setq backup-directory-alist
;;       `(("." . ,(expand-file-name "per-save/" bjm/backup-location))))

;; ;; add trash dir if needed
;; (if bjm/backup-exclude-regexp
;;     (add-to-list 'backup-directory-alist `(,bjm/backup-exclude-regexp . ,bjm/backup-trash-dir)))

;; (defun bjm/backup-every-save ()
;;   "Backup files every time they are saved.

;; Files are backed up to `bjm/backup-location' in subdirectories \"per-session\" once per Emacs session, and \"per-save\" every time a file is saved.

;; Files whose names match the REGEXP in `bjm/backup-exclude-regexp' are copied to `bjm/backup-trash-dir' instead of the normal backup directory.

;; Files larger than `bjm/backup-file-size-limit' are not backed up."

;;   ;; Make a special "per session" backup at the first save of each
;;   ;; emacs session.
;;   (when (not buffer-backed-up)
;;     ;;
;;     ;; Override the default parameters for per-session backups.
;;     ;;
;;     (let ((backup-directory-alist
;;            `(("." . ,(expand-file-name "per-session/" bjm/backup-location))))
;;           (kept-new-versions 3))
;;       ;;
;;       ;; add trash dir if needed
;;       ;;
;;       (if bjm/backup-exclude-regexp
;;           (add-to-list
;;            'backup-directory-alist
;;            `(,bjm/backup-exclude-regexp . ,bjm/backup-trash-dir)))
;;       ;;
;;       ;; is file too large?
;;       ;;
;;       (if (<= (buffer-size) bjm/backup-file-size-limit)
;;           (progn
;;             (message "Made per session backup of %s" (buffer-name))
;;             (backup-buffer))
;;         (message "WARNING: File %s too large to backup - increase value of bjm/backup-file-size-limit" (buffer-name)))))
;;   ;;
;;   ;; Make a "per save" backup on each save.  The first save results in
;;   ;; both a per-session and a per-save backup, to keep the numbering
;;   ;; of per-save backups consistent.
;;   ;;
;;   (let ((buffer-backed-up nil))
;;     ;;
;;     ;; is file too large?
;;     ;;
;;     (if (<= (buffer-size) bjm/backup-file-size-limit)
;;         (progn
;;           (message "Made per save backup of %s" (buffer-name))
;;           (backup-buffer))
;;       (message "WARNING: File %s too large to backup - increase value of bjm/backup-file-size-limit" (buffer-name)))))

;; ;; add to save hook
;; (add-hook 'before-save-hook 'bjm/backup-every-save)
