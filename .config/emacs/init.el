;; Credits: Arkbois Emacs

;; Elpaca
;; This will be our package manager that I am using through out the configuration
(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; SETUP USE PACKAGE
;; Use Package is a function that we use to make sure a package is installed and required
;;
;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))
;; Make sure it always ensures
(setq use-package-always-ensure t)

;;When installing a package used in the init file itself,
;;e.g. a package which adds a use-package key word,
;;use the :wait recipe keyword to block until that package is installed/configured.
;;For example:
;;(use-package general :ensure (:wait t) :demand t)

;; EVIL MODE
;; Evil Mode is a Vim emulator for Emacs. It brings Vim modes and keybindings to Emacs.
;; This is why Emacs configurations with evil mode are called "The Dark Side"
;;
;; Expands to: (elpaca evil (use-package evil :demand t))
(use-package evil :demand t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  :config
  (evil-mode))
(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  (evil-collection-init))
(use-package evil-tutor)

;;turns off elpaca-use-package-mode current declaration
;;Note this will cause evaluate the declaration immediately. It is not deferred.
;;Useful for configuring built-in emacs features.
(use-package emacs :ensure nil :config (setq ring-bell-function #'ignore))

;; THEME
;; We use the DOOM Themes package, a super useful package from the DOOM Emacs team. This allows to set a theme
;; The default theme is doom-pine.
;; Recommended: doom-vibrant (A vibrant version of the DOOM One theme), doom-gruvbox (A retro groovy theme)
(use-package doom-themes
  :init
  (load-theme 'doom-gruvbox t))
(custom-set-faces
 '(default ((t (:background "#1D2021")))))

;; Enable Vertico.
(use-package vertico
  ;; :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)

;; DOOM MODE LINE
;; This is the status line at the bottom.
;; Emacs has a status line already, hence this is optional
;; DOOM Modeline just makes it a little bit more prettier
(use-package doom-modeline
  :init
  (setq doom-modeline-height 34)
  (doom-modeline-mode 1))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; MARGINILIA
;; This shows permissions, date modified, size and more information to the Find File menu
;; And other info to other menus
(use-package marginalia
  :init
  (marginalia-mode))

;; LSP
;; This is the Language Server Protocol
;; It's must have for programming and turns Emacs into an IDE!
(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-diagnostics t))

;; Completion framework
(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1))

;; Optional: Install lsp-treemacs for better UI integration
(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(with-eval-after-load 'lsp-mode
  (setq lsp-headerline-breadcrumb-enable nil))

;; Language-specific configurations
;; Python (requires pyright or python-language-server installed on your system)
(use-package python-mode
  :hook (python-mode . lsp))

;; TypeScript/JavaScript (requires typescript-language-server installed on your system)
(use-package typescript-mode
  :hook (typescript-mode . lsp))

;; Golang (requires gopls installed on your system)
(use-package go-mode
  :hook (go-mode . lsp))
(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)))

(use-package which-key
  :init
  (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
	which-key-sort-order #'which-key-key-order-alpha
	which-key-sort-uppercase-first nil
	which-key-add-column-padding 1
	which-key-max-display-columns nil
	which-key-min-display-lines 6
	which-key-side-window-slot -10
	which-key-side-window-max-height 0.25
	which-key-idle-delay 0.8
	which-key-max-description-length 25
	which-key-allow-imprecise-window-fit t
	which-key-separator " → " ))

(use-package general
  :config
  (general-create-definer my/goto
    :states '(normal visual insert emacs)
    :prefix "g"
    :non-normal-prefix "M-g")
    
  (my/goto
    "l" '(end-of-line :wk "Goto end of line")
    "h" '(beginning-of-line :wk "Goto beginning of line"))

  (general-create-definer my/leader
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "M-SPC")

  (my/leader
   "." '(find-file :wk "Find file")
   "fc" '((lambda () (interactive) (find-file "~/.config/emacs/init.el")) :wk "Edit emacs config")
   "/" '(comment-line :wk "Comment lines"))

  (my/leader
   "b" '(:ignore t :wk "buffer")
   "bs" '(switch-to-buffer :wk "Switch buffer")
   "bk" '(kill-current-buffer :wk "Kill this buffer")
   "bn" '(next-buffer :wk "Next buffer")
   "bp" '(previous-buffer :wk "Previous buffer")
   "br" '(revert-buffer :wk "Reload buffer"))

  (my/leader
   "e" '(:ignore t :wk "Evaluate")    
   "eb" '(eval-buffer :wk "Evaluate elisp in buffer")
   "ed" '(eval-defun :wk "Evaluate defun containing or after point")
   "ee" '(eval-expression :wk "Evaluate and elisp expression")
   "el" '(eval-last-sexp :wk "Evaluate elisp expression before point")
   "er" '(eval-region :wk "Evaluate elisp in region"))

  (my/leader
   "t" '(:ignore t :wk "Toggle")
   "tl" '(display-line-numbers-mode :wk "Toggle line numbers")
   "tt" '(visual-line-mode :wk "Toggle truncated lines"))

  (my/leader
   "h" '(:ignore t :wk "Help")
   "hf" '(describe-function :wk "Describe function")
   "hv" '(describe-variable :wk "Describe variable")
   ;; "h r r" '((lambda () (interactive) (load-file "~/.config/emacs/init.el")) :wk "Reload emacs config"))
   "hrr" '(reload-init-file :wk "Reload emacs config"))

  (my/leader
   "w" '(:ignore t :wk "Windows")
   ;; Window splits
   "w c" '(evil-window-delete :wk "Close window")
   "w n" '(evil-window-new :wk "New window")
   "w s" '(evil-window-split :wk "Horizontal split window")
   "w v" '(evil-window-vsplit :wk "Vertical split window")
   ;; Window motions
   "w h" '(evil-window-left :wk "Window left")
   "w j" '(evil-window-down :wk "Window down")
   "w k" '(evil-window-up :wk "Window up")
   "w l" '(evil-window-right :wk "Window right")
   "w w" '(evil-window-next :wk "Goto next window"))
)

(defun reload-init-file ()
  (interactive)
  (load-file user-init-file))


(use-package sudo-edit
  :config
  (my/leader
   "fu" '(sudo-edit-find-file :wk "Sudo find file")
   "fU" '(sudo-edit :wk "Sudo edit file")))

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
