;; helm
(use-package helm) 

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

;; rainbow-delimiters
(use-package rainbow-delimiters
  :init (rainbow-delimiters-mode)) 

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

;; git-gutter
(use-package git-gutter
  :init (global-git-gutter-mode +1))

;; magit
(use-package magit)
