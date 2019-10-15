(use-package cider
  :hook ((clojure-mode . cider-mode)
	 (clojure-mode . evil-cleverparens-mode))
  :bind (:map cider-repl-mode-map
              ("<up>" . cider-repl-backward-input)
              ("<down>" . cider-repl-forward-input)))

(defun region-or-expr (start end)
  (interactive "r")
  (if (use-region-p)
      (cider-eval-region start end)
    (cider-eval-last-sexp)))

(use-package flycheck-clj-kondo)

(use-package clojure-mode
  :config (require 'flycheck-clj-kondo))
