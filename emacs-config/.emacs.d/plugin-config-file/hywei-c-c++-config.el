;; semantic configure

;; c/c++ setting
(require 'cc-mode)
(add-hook 'c-mode-common-hook 'my-c-mode-hook)
(load "../plugins/google-c-style")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
