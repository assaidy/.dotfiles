(add-to-list 'default-frame-alist '(font . "Maple Mono NF-16"))

(setq x-select-enable-clipboard t)
(setq-default truncate-lines t) ;; disable word wrapping

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(setq inhibit-splash-screen t)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

(setq make-backup-files nil)       ;; stop creating backup~ files
(setq auto-save-default nil)       ;; stop creating #autosave# files

;; Disable package.el since we use elpaca
(setq package-enable-at-startup nil)
