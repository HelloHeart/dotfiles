

(use-package cider
  :hook ((clojure-mode . cider-mode))
  :config(setq nrepl-log-messages t
        cider-repl-display-in-current-window t
        cider-repl-use-clojure-font-lock t
        cider-prompt-save-file-on-load 'always-save
        cider-font-lock-dynamically '(macro core function var)
        nrepl-hide-special-buffers t
        cider-overlays-use-font-lock t)
  (cider-repl-toggle-pretty-printing)
  ;; :bind (:map cider-repl-mode-map
  ;;             ("<up>" . cider-repl-backward-input)
  ;;             ("<down>" . cider-repl-forward-input))
  )


(use-package flycheck-clj-kondo)

(use-package clojure-mode
  :config (require 'flycheck-clj-kondo)
  )


;; (use-package clj-refactor
;;   :hook
;;   ((clojure-mode . clj-refactor-mode)
;;    (clojure-mode . yas-minor-mode))
;;   :config
;;    (cljr-add-keybindings-with-prefix "C-c C-m"))

;; (use-package clojure-mode
;;   :mode (("\\.clj\\'" . clojure-mode)
;;          ("\\.edn$" . clojure-mode))
;;   :config
;;   (setq clojure--prettify-symbols-alist
;;         '(("fn" . ?λ))))

(defun region-or-expr (start end)
  (interactive "r")
  (if (use-region-p)
      (cider-eval-region start end)
    (cider-eval-last-sexp)))
