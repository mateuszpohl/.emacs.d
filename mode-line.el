
;; pricectile mode-line
(setq projectile-mode-line
      '(:eval (if (file-remote-p default-directory)
                  " P"
                  (format " P[%s]" (projectile-project-name)))))

(setq git-gutter:lighter '" GG")
