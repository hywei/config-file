;; compile hot key setting
(global-set-key [(f7)] 'compile)
;; set compilation-window-height
(setq compilation-window-height 8)
;; make the compilation window go away if no errors
(setq compilation-finish-function
       (lambda (buf str)
         (if (string-match "exited abnormally" str)
             ;;there were errors
             (message "compilation errors, press C-x ` to visit")
           ;;no errors, make the compilation window go away in 0.5 seconds
;           (run-at-time 0.5 nil 'delete-windows-on buf)
           (message "NO COMPILATION ERRORS!"))))
