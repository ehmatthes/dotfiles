;; A humble, growing .emacs file.
;;  Begun 11/2009

;; Changelog as of 3/2013
;; 3/15/2013
;;    added fill-column-indicator

;; Set font size
;;  Value is 1/10pt, ie 80=font size 8
;;  Placed here because placing later affects window/ buffer size
;;  Probably be good to specify a font as well.
(set-face-attribute 'default nil :height 100)

;; Don't make backup files; use git myself instead
(setq make-backup-files nil) ; stop creating ~ files

(add-to-list 'load-path "~/elisp/")
;; Open emacs maximized
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
      		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

(require 'linum)
(require 'column-marker)
(require 'fill-column-indicator)

;; Highlight column 80; not sure how to make it work for all windows/ modes
;; (add-hook 'ipython-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; Add vertical line (fci) at column 80, and 120
;;  works, but would rather get column-marker to work properly
(setq fci-rule-column 80)
(setq fci-rule-column 120)
(add-hook 'after-change-major-mode-hook 'fci-mode)

;; Don't show splash screen at startup.
(setq inhibit-splash-screen t)

;; Turn on line numbering.
(global-linum-mode 1)
;; Add Line numbers when printing (GREAT when printing out code)
(setq ps-line-number t)

;; Set tab size
(setq default-tab-width 3)  ; Tabs are interesting, learn more about this to find good practice

;; Turn off line wrapping
(setq-default truncate-lines t)

;; Make list of buffers appear in current window, using shortcut
;;(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key [(C tab)] 'buffer-menu)


;; Set up Python environment.
;; 5/30/12, don't think ipython installed anymore; record here how to install it.
;;  Fixed; sudo apt-get install ipython worked

;; load ipython.el if ipython is available
(when (executable-find "ipython")
    (require 'ipython nil 'noerror))
(when (featurep 'ipython)
  (setq python-python-command "ipython -cl")
  (setq python-command python-python-command))

;; Turn on transient-mark-mode, to allow commenting regions
(transient-mark-mode 1)

;; Set up initial window layout.
;;  Large left vertical window for program file, upper right window for python interpreter, lower right window for scratch.
;;  Never using scratch, always using two windows only now; comment out scratch window
(split-window-horizontally)
; Open dired buffer in main window
;;(dired "~/Data/Development - Pangolin/")
;;(dired "/srv/python-environments/phs_comp_env/phs_competencies")
(dired "/srv/projects")
(other-window 1)
;;(split-window-vertically)

;; Start python interpreter in upper right window
;;(other-window 1)
(other-window 1)
(run-python)

; Return to dired window.
(other-window 1)


;; Fringes (space between line numbers and text:
; (set-fringe-mode 5)


;; Get rid of gui stuff.
; (menu-bar-mode -1) 	; no menubar
; (scroll-bar-mode -1) 	; no scroll bar
(tool-bar-mode -1)	; no tool bar
