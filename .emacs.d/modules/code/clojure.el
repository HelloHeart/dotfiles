(use-package cider
  :hook ((clojure-mode . cider-mode))
  :bind (:map cider-repl-mode-map
              ("<up>" . cider-repl-backward-input)
              ("<down>" . cider-repl-forward-input)))
