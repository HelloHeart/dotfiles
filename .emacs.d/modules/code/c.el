(use-package disaster
  :after (c-mode)
  :config (setq disaster-objdump "objdump -d -M intel -Sl --no-show-raw-insn"))
