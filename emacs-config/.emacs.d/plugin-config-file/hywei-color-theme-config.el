;; color theme
(add-to-list 'load-path
          "~/.emacs.d/plugins/color-theme")

(require 'color-theme)
(color-theme-initialize)
(color-theme-robin-hood)
;(defun color-theme-face-attr-construct (face frame)
;      (if (atom face)
;           (custom-face-attributes-get face frame)
;         (if (and (consp face) (eq (car face) 'quote))
;             (custom-face-attributes-get (cadr face) frame)
;           (custom-face-attributes-get (car face) frame))))

;(color-theme-dark-vee)
;(color-theme-taylor)
