(use-package slime-company
  :defer t
  :commands slime-company)

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
  (load (expand-file-name "~/.quicklisp/slime-helper.el")))

(bind-key (kbd "C-c b") 'slime-eval-buffer)
(bind-key (kbd "C-c M-s") 'slime)
