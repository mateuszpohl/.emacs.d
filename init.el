;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

(fset `yes-or-no-p `y-or-n-p)

;; global keybindings
(setq mac-command-modifier 'super)

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; ui
(use-package twilight-theme
  :init (load-theme 'twilight t))

(tool-bar-mode 0)
(menu-bar-mode 0)
(toggle-frame-fullscreen)
;;(scroll-bar-mode 0)

;;(use-package powerline)
;;(powerline-default-theme)

(use-package window-numbering
  :init (window-numbering-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#333333")))))


(global-hl-line-mode 1)
(set-face-background 'hl-line "#383838")
(set-face-foreground 'highlight nil)

;; evil
(use-package evil 
  :init (evil-mode 1))

(use-package evil-escape
  :diminish evil-escape-mode
  :config (evil-escape-mode))

;; ensime
;;(use-package ensime 
;;  :ensure t 
;;  :pin melpa-stable
;;  :bind ("M-RET" . ensime-edit-definition))

;; helm
(use-package helm) 

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-c C-m") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; projectile
;;(use-package flx-ido)
(use-package projectile
  :demand
  :init   (setq projectile-use-git-grep t)
  :config (projectile-global-mode t)
  :bind   (("M-f" . helm-projectile-find-file)
           ("M-r" . helm-projectile-grep)))

(use-package helm-projectile
  :init (helm-projectile-on))

;; dashboard
(use-package dashboard
  :config (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
(setq dashboard-startup-banner 'official)
(setq dashboard-items '((recents  . 10)
                        (bookmarks . 10)))

;; undo
(use-package undo-tree
  :diminish undo-tree-mode
  :config (global-undo-tree-mode)
  :bind ("M-/" . undo-tree-visualize))

;; move-text
(use-package move-text)

(require 'expand-region)
(global-set-key (kbd "M-e") 'er/expand-region)
(global-set-key (kbd "M-E") 'er/contract-region)

;; neotree
 (use-package neotree
  :init (setq neo-smart-open t)
  :bind ("C-c n" . neotree-toggle))

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; editorconfig
;;(use-package editorconfig
;;  :ensure t
;;  :config (editorconfig-mode 1))

;; elscreen
;;(use-package elscreen
;;  :init (elscreen-start)
;;  :config (setq elscreen-display-tab nil))

(define-key evil-normal-state-map "\C-zc" 'elscreen-create)
(define-key evil-normal-state-map "\C-zk" 'elscreen-kill)
(define-key evil-normal-state-map "gt" 'elscreen-next)
(define-key evil-normal-state-map "gT" 'elscreen-previous)

;; which-key
(use-package which-key
  :init (which-key-mode))

;; powerline
(require 'powerline)
(powerline-center-evil-theme)

(custom-theme-set-faces 'twilight '(powerline-active1
                                  ((t (:foreground "#e4e4e4" :background "#105b63" :inherit mode-line)))
                                  :group 'powerline))

(custom-theme-set-faces 'twilight '(powerline-active2
                                  ((t (:foreground "#111111" :background "#db9e36" :inherit mode-line)))
                                  :group 'powerline))

;;(custom-theme-set-faces 'twilight '(powerline-inactive1
;;                                  ((t (:foreground "#e4e4e4" :background "#105b63" :inherit mode-line)))
;;                                  :group 'powerline))

;;(custom-theme-set-faces 'twilight '(powerline-inactive2
;;                                  ((t (:foreground "#222222" :background "#db9e36" :inherit mode-line)))
;;                                  :group 'powerline))

;;(custom-theme-set-faces 'twilight '(modeline
;;                                  ((t (:foreground "#222222" :background "#db9e36" :inherit mode-line)))
;;                                  :group 'modeline))



(setq powerline-default-separator 'curve)


;; windmove
(use-package windmove
  :init (windmove-default-keybindings))

;; rainbow-delimiters
(use-package rainbow-delimiters
  :init (rainbow-delimiters-mode)) 

;; git-gutter
(use-package git-gutter
  :init (global-git-gutter-mode +1))

;; smartparentheses
(use-package smartparens
  :diminish smartparens-mode
  :commands
  smartparens-strict-mode
  smartparens-mode
  sp-restrict-to-pairs-interactive
  sp-local-pair
  :init
  (setq sp-interactive-dwim t)
  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings)

  (sp-pair "(" ")" :wrap "C-(")
  (sp-pair "[" "]" :wrap "s-[")
  (sp-pair "{" "}" :wrap "C-{"))

;; completions
(use-package company)
(global-set-key (kbd "TAB") 'company-complete)
(setq tab-always-indent 'company-complete)

;; magit
(use-package magit)
(global-set-key (kbd "C-x g") 'magit-status)


;; global keybindings
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "<home>") 'back-to-indentation)
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "<S-up>") 'move-text-up)
(global-set-key (kbd "<S-down>") 'move-text-down)

(global-set-key [next]
  (lambda () (interactive)
    (condition-case nil (scroll-up)
      (end-of-buffer (goto-char (point-max))))))

(global-set-key [prior]
  (lambda () (interactive)
    (condition-case nil (scroll-down)
      (beginning-of-buffer (goto-char (point-min))))))

;; hooks
(add-hook 'prog-mode-hook 
  (lambda () 
    (global-company-mode)
    (rainbow-delimiters-mode)
    (smartparens-global-mode)))

(setcdr (assq 'vc-mode mode-line-format)
                '((:eval (replace-regexp-in-string "^ Git" " " vc-mode))))

(setq projectile-mode-line '(:eval (if (file-remote-p default-directory) " P"
                                       (format " P[%s]" (projectile-project-name))
                                     )))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "69831e572dc46ced47c5309bff8fc2f4a9e237e2bad2c76f313da814a4628694" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(package-selected-packages
   (quote
    (magit windresize editorconfig flx flx-ido twilight-theme solarized-theme window-numbering which-key use-package tern smartparens rainbow-delimiters powerline neotree move-text monokai-theme js2-refactor js2-highlight-vars helm-projectile helm-emmet git-gutter flycheck-haskell expand-region evil-escape ensime elscreen dashboard company-ghci company-ghc)))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "node_modules" "/*/node_modules")))
 '(recentf-mode t)
 '(safe-local-variable-values (quote ((projectile-project-name . "orchis-ui")))))

