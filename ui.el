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

;; custom colors
(global-hl-line-mode 1)
(set-face-background 'hl-line "#383838")
(set-face-foreground 'highlight nil)
(set-face-background 'region "#555555")
(set-face-background 'mode-line "#555555")
(set-face-foreground 'mode-line "#e4e4e4")

;; powerline
(require 'powerline)
(powerline-center-evil-theme)

(custom-theme-set-faces 'twilight '(powerline-active1
                                  ((t (:foreground "#e4e4e4" :background "#105b63" :inherit mode-line)))
                                  :group 'powerline))

(custom-theme-set-faces 'twilight '(powerline-active2
                                  ((t (:foreground "#111111" :background "#db9e36" :inherit mode-line)))
                                  :group 'powerline))

;; neotree
 (use-package neotree
  :init (setq neo-smart-open t)
  :bind ("C-c n" . neotree-toggle))

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; windmove
(use-package windmove
  :init (windmove-default-keybindings))

;; dashboard
(use-package dashboard
  :config (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
(setq dashboard-startup-banner 'official)
(setq dashboard-items '((recents  . 10)
                        (bookmarks . 10)))

;; which-key
(use-package which-key
  :init (which-key-mode))

(setq projectile-mode-line '(:eval (if (file-remote-p default-directory) " P"
                                       (format " P[%s]" (projectile-project-name))
                                     )))

