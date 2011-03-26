;; auctex setting
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;; set evince as the default pdf viewer  ( hot-key: c-c c-v)
(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))
;; set xelatex as the default compile command (hot-key: c-c c-c)
(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
            (setq TeX-command-default "XeLaTeX")))

(put 'upcase-region 'disabled nil)
