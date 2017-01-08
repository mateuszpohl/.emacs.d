;; global keybindings
(setq mac-command-modifier 'super)

(global-set-key (kbd "M-x") 'helm-M-x)
;;(global-set-key (kbd "C-x C-m") 'helm-M-x)
;;(global-set-key (kbd "C-c C-m") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)


(global-set-key (kbd "C-x g") 'magit-status)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "<home>") 'back-to-indentation)
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "<S-up>") 'move-text-up)
(global-set-key (kbd "<S-down>") 'move-text-down)

(global-set-key (kbd "C-x w r") 'windresize)
(global-set-key (kbd "C-x w k") 'which-key-show-keymap)

(js2r-add-keybindings-with-prefix "C-c C-m")

(global-set-key [next]
  (lambda () (interactive)
    (condition-case nil (scroll-up)
      (end-of-buffer (goto-char (point-max))))))

(global-set-key [prior]
  (lambda () (interactive)
    (condition-case nil (scroll-down)
      (beginning-of-buffer (goto-char (point-min))))))
