(use-package evil
  :after (evil-leader) ;; to enable evil-leader in initial buffers
  :init (progn
	  (global-evil-leader-mode)
	  (evil-mode))
  :config (setq evil-move-beyond-eol t))
(use-package evil-cleverparens
  :after (evil))
(use-package evil-collection
  :after (evil)
  :init (evil-collection-init))
(use-package evil-nerd-commenter
  :after (evil))
(use-package treemacs-evil
  :after (evil))
(use-package evil-surround
  :after (evil)
  :init (global-evil-surround-mode t))
(use-package evil-escape
  :after (evil)
  :init (evil-escape-mode)
  :config (setq evil-escape-key-sequence "jk"
		evil-escape-delay 0.2
		evil-escape-unordered-key-sequence t))
(use-package evil-goggles
  :after (evil)
  :init (evil-goggles-mode)
  :config (evil-goggles-use-diff-faces))
(use-package evil-leader
  :init (setq evil-want-keybinding nil)
  :config
  (evil-leader/set-leader "<SPC>")
  ;; common
  ;; sorted by comment header alphabetical order
  ;; shouldn't have any commands to edit text, so move the comments to normal vim somehow
  (evil-leader/set-key
    ;; buffer keybinding
    "bb" 'switch-to-buffer
    "bd" 'kill-buffer
    "bi" 'insert-buffer
    "bk" 'kill-buffer-and-window
    "br" 'revert-buffer
    ;; kbd "b TAB" 'evil-switch-to-windows-last-buffer
    ;; comment keybindings
    "cc" 'evilnc-comment-or-uncomment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cr" 'comment-or-uncomment-region
    "ci" 'evilnc-toggle-invert-comment-line-by-line ;; inverts comments instead of just commenting them
    ;; eval keybindings, should go to common lisp bindings (maybe)
    "eb" 'eval-buffer
    "ee" 'eval-last-sexp
    "ef" 'eval-defun
    "er" 'eval-region
    ;; file keybindings
    "fd" 'delete-file
    "ff" 'find-file
    "fo" 'sudo-save
    "fr" 'rename-file
    "fs" 'save-buffer
    ;; git
    "gs" 'magit-status
    ;; jumping
    "jb" 'dumb-jump-back
    "jd" 'dumb-jump-go
    "jj" 'evil-avy-goto-char-timer
    "jl" 'evil-avy-goto-line
    ;; quitting
    "qc" 'server-edit
    "qq" 'save-buffers-kill-terminal
    ;; region keybindings
    "rb" 'append-to-buffer
    "rf" 'append-to-file
    "ri" 'indent-region
    ;; search and replace keybindings
    "sf" 'imenu
    "sr" 'full-buffer-query-replace
    "ss" 'swiper-isearch
    ;; treemacs
    "td" 'treemacs-delete
    "tp" 'treemacs-projectile
    "tt" 'treemacs-select-window
    ;; window keybindings
    "wd" 'delete-window
    "wh" 'split-window-below
    "ww" 'ace-window
    "ws" 'ace-swap-window
    "wv" 'split-window-right
    ;; M-x
    "<SPC>" 'counsel-M-x)
  ;; c-mode
  (evil-leader/set-key-for-mode 'c-mode
    "mc" 'compile
    "md" 'rmsbolt-compile)
  (evil-leader/set-key-for-mode 'clojure-mode
    "eb" 'cider-eval-buffer
    "ee" 'cider-eval-last-sexp
    "ef" 'cider-eval-defun-at-point
    "er" 'cider-eval-region
    "x"  'region-or-expr))

(defun sudo-save ()
  "save the current buffer as a sudo user, overwriting the existing file"
  (interactive)
  (if (not buffer-file-name)
      (write-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (write-file (concat "/sudo:root@localhost:" (buffer-file-name)))))

(defun full-buffer-query-replace ()
  "runs query replace on the entire buffer, might be able to make this a macro or something"
  (interactive)
  (let ((old-point (point)))
    (goto-char (point-min))
    (call-interactively `query-replace-regexp)
    (goto-char old-point)))
