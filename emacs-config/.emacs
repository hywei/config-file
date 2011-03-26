;; Emacs Load Path
(setq load-path (cons "~/.emacs.d" load-path))

(require 'find-lisp)
(mapc 'load (find-lisp-find-files "~/.emacs.d/plugin-config-file/" "\\.el$"))



(put 'set-goal-column 'disabled nil)
