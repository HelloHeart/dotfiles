(use-package swiper)
(use-package ivy
  :init (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d "
	ivy-display-style 'fancy))
(use-package counsel
  :init (counsel-mode))
(use-package smex)
(use-package which-key
  :init (which-key-mode))
