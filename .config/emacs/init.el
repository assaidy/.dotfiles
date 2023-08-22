;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bar
(scroll-bar-mode -1)

;; Set the default state to 'normal'
(setq evil-default-state 'normal)

;; Load the evil mode
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

