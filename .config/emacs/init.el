(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-org base16-theme monitor org-evil evil-surround evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 

(require 'evil)
(require 'key-chord)
(require 'evil-surround)
(require 'evil-org)

(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(evil-mode 1)
(key-chord-mode 1)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)
(setq evil-want-C-i-jump nil)
(with-eval-after-load 'evil
  (evil-define-key 'normal outline-mode-map (kbd "<tab>") #'org-cycle)
        (evil-define-key 'normal outline-mode-map (kbd "TAB") #'org-cycle))

(load-theme 'base16-harmonic-dark t)
