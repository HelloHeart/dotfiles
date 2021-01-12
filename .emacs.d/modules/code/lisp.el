(use-package highlight-quoted
  :hook ((lisp-mode . highlight-quoted-mode)
	 (emacs-lisp-mode . highlight-quoted-mode)))

(use-package aggressive-indent
  :hook (lisp-mode . aggressive-indent-mode))

;; (use-package rainbow-blocks
;;   :hook (lisp-mode . rainbow-blocks-mode))

;; (use-package adjust-parens
;;   :hook (lisp-mode . adjust-parens-mode))



(use-package slime-company
  :defer t
  :commands slime-company)

(use-package slime
  :defer t
  ;;:hook (slime-mode . 'start-slime)
  :commands (slime slime-lisp-mode-hook slime-mode)
  :bind (:map lisp-mode-map
	      ("C-c C-s" . 'slime)
	      :map slime-mode-map
	      ("TAB" . 'slime-indent-and-complete-symbol)
	      ("C-c i" . 'slime-inspect)
	      ("C-c C-s" . 'slime-selector))
  :config
  (setq slime-contribs '(slime-fancy slime-asdf slime-quicklisp slime-cl-indent)
	inferior-lisp-program "/usr/local/bin/sbcl"
	slime-net-coding-system 'utf-8-unix
	slime-complete-symbol*-fancy t
	slime-complete-symbol-function 'slime-fuzzy-complete-symbol
	company-quickhelp-local-mode 0
	slime-autodoc-use-multiline-p t
	slime-enable-evaluate-in-emacs t
        slime-fuzzy-completion-in-place t
	)
  (slime-setup '(slime-fancy slime-asdf slime-quicklisp slime-company))
  (load (expand-file-name "~/.quicklisp/slime-helper.el")))

(bind-key (kbd "C-c b") 'slime-eval-buffer)
(bind-key (kbd "C-c M-s") 'slime)

(use-package parinfer
  :bind
  (("C-," . parinfer-toggle-mode))
  :hook
  ((common-lisp-mode . parinfer-mode))
  :init
  (progn
    (setq parinfer-auto-switch-indent-mode t
     parinfer-extensions
          '(defaults       ; should be included.
            ;;pretty-parens  ; different paren styles for different modes.
            ;;evil           ; If you use Evil.
            ;;lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
            smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
            smart-yank))   ; Yank behavior depend on mode.
    ;; (add-hook 'clojure-mode-hook #'parinfer-mode)
    ;; (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    ;; (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    ;; (add-hook 'scheme-mode-hook #'parinfer-mode)
    ;; (add-hook 'lisp-mode-hook #'parinfer-mode)
    ))

(defun start-slime ()
  (unless (slime-connected-p)
    (save-excursion (slime))))
