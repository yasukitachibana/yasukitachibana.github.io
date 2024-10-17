;; No scratch message
(setq initial-scratch-message "")
;; No tool bar
(tool-bar-mode -1)

;; No menu bar
;;(menu-bar-mode -1)

;; No scroll bar
(set-scroll-bar-mode nil)

;; No startup screen
(setq inhibit-startup-screen t)

;;Change theme
(load-theme 'misterioso t)

;;Font size
(set-face-attribute 'default nil :height 150)

;;Assign "Option" key as "Meta"
(setq ns-option-modifier (quote meta))


;;No beeps
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)


;; Visualize taps and full-Japanese spaces
(defface my-face-b-1 '((t (:background "CadetBlue4"))) nil) ; full-Japanese spaces
;;(defface my-face-b-2 '((t (:background "CadetBlue4"))) nil) ; tabs
(defface my-face-u-1 '((t (:background "SteelBlue" :underline t))) nil) ; spaces at ends of lines
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)


(defadvice font-lock-mode (before my-font-lock-mode ())
	   (font-lock-add-keywords
	    major-mode
	    '(("\t" 0 my-face-b-2 append)
	      ("　" 0 my-face-b-1 append)
	      ("[ \t]+$" 0 my-face-u-1 append)
	      )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; Show line numbers
(global-linum-mode t)
(set-face-attribute 'linum nil
		    :foreground "LightSlateGray"
		    :height 0.9)

(add-to-list 'default-frame-alist '(left-fringe . 8))

(add-to-list 'default-frame-alist '(right-fringe . 8))

(face-spec-set 'fringe
	       '((((class color) (background light))
		  :background "gray12")
		  (((class color) (background dark))
		   :background "gray12")
		   (t
		    :background "gray12")))

;; Highlight brackets
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "SlateGray")
