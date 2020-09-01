;;(use-package sly
;;  :config (setq inferior-lisp-program "/usr/bin/sbcl"))

(use-package slime-company
  :defer t
  :commands slime-company)

;; (use-package shackle
;;   :config
;;   (setq shackle-select-reused-windows nil
;;         shackle-default-alignment 'below
;;         shackle-default-size 0.4
;;         shackle-default-rule '(:same t))
;;   (when (not shackle-rules)
;;     (setq shackle-rules '()))
;;   (defun ef-shackle (shackle &rest shackles)
;;     "Adds one or more shackle rules to `shackle-rules'"
;;     (dolist (rule (cons shackle shackles))
;;       (add-to-list 'shackle-rules rule)))
;;   (ef-shackle '(" *undo-tree*" :align below :size .4 :popup t :select t)
;;               '("*company-documentation*" :align below :size .4 :popup t :noselect t)
;;               '("*compilation*" :align below :size .4 :popup t :noselect t)
;;               '(compilation-mode :align below :size .4 :popup t :noselect t)
;;               '("*Checkdoc Status*" :align below :size .3 :popup t :no-select t)
;;               '("*Completions*" :align below :size .3 :popup t :no-select t)
;;               '("*Warnings*" :align below :size .3 :popup t :select t)
;;               '("*Apropos*" :align below :size .3 :popup t :select t)
;;               '("*Help*" :align below :size .4 :popup t :select t))
;;   (shackle-mode t))

(use-package slime
  :defer t
  :commands (slime slime-lisp-mode-hook slime-mode)
  :bind (:map lisp-mode-map
	      ("C-c C-s" . 'slime))
  :config
  (setq slime-contribs '(slime-fancy slime-asdf slime-quicklisp slime-cl-indent)
	inferior-lisp-program "/usr/local/bin/sbcl"
	slime-net-coding-system 'utf-8-unix
	slime-complete-symbol*-fancy t
	slime-complete-symbol-function 'slime-fuzzy-complete-symbol
	company-quickhelp-local-mode 0
	)
  (slime-setup '(slime-fancy slime-asdf slime-quicklisp slime-company))
  (load (expand-file-name "~/.quicklisp/slime-helper.el"))
  ;; (ef-shackle '(sldb-mode :align bottom :size .4 :popup t :select t)
  ;;             '("*slime-compilation*" :align bottom :size .4 :popup t :select t)
  ;;             '("*slime-description*" :align bottom :size .4 :popup t :select t)
  ;;             '("*slime-apropos*" :align bottom :size .4 :popup t :select t))
  )

;; (use-package slime
;;   :defer t
;;   :bind (:map slime-mode-map
;; 	      ("C-/" . 'slime-complete-symbol)
;; 	      ("C-x"))
;;   :config (setq inferior-lisp-program "/usr/bin/sbcl"
;;                 slime-contribs '(slime-fancy
;; 				 ;;slime-company
;; 				 ))
;;   (slime-setup '(slime-fancy ;;slime-company
;; 		 ))
;;   (defvar slime-repl-font-lock-keywords lisp-el-font-lock-keywords-2)
;;   (defun slime-repl-font-lock-setup ()
;;     (setq font-lock-defaults
;;           '(slime-repl-font-lock-keywords
;;             ;; From lisp-mode.el
;;             nil nil (("+-*/.<>=!?$%_&~^:@" . "w")) nil
;;             (font-lock-syntactic-face-function
;;              . lisp-font-lock-syntactic-face-function))))
;;   (add-hook 'slime-repl-mode-hook 'slime-repl-font-lock-setup)
;;   (defadvice slime-repl-insert-prompt (after font-lock-face activate)
;;     (let ((inhibit-read-only t))
;;       (add-text-properties
;;        slime-repl-prompt-start-mark (point)
;;        '(font-lock-face
;;          slime-repl-prompt-face
;;          rear-nonsticky
;;          (slime-repl-prompt read-only font-lock-face intangible)))))
;;   )

;; (use-package slime-company
;;   :after (slime company)
;;   :config (setq slime-company-completion 'fuzzy
;;                 slime-company-after-completion 'slime-company-just-one-space))

;; (defun ora-slime-completion-in-region (_fn completions start end)
;;   (funcall completion-in-region-function start end completions))

;; (advice-add
;;  'slime-display-or-scroll-completions
;;  :around #'ora-slime-completion-in-region)
