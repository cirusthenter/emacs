(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
   (quote
    (mew flycheck web-mode helm undo-tree undohist color-moccur auto-complete))))
(custom-set-faces)

(set-default-font "Menlo 15")

;;; package.el
(require 'package)
;; add MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;add  MELPA-stable
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; add Marmalade
(add-to-list 'package-archives  '("marmalade" . "https://marmalade-repo.org/packages/"))
;; add Org
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;; initialize
(package-initialize)


;; do not show the start up message
(setq inhibit-startup-message t)

;; set a tab to 4 spaces
(setq default-tab-width 4)

;; show line number
(global-linum-mode t)

;; show the corresponding brace 
(show-paren-mode 1)

;; set scroll amount when using a mouse
(setq mouse-wheel-scroll-amount '(3 ((shift) . 5)))

;; don't let the cursor have acceleration
(setq mouse-wheel-progressive-speed nil)

;; エラー音をならなくする
(setq ring-bell-function 'ignore)

;; highlighting the current line
(defface my-hl-line-face
  ;; set it to navyblue when if the default background color is dark
  '((((class color) (background dark))
     (:background "NavyBlue" t))
    ;; set it to LightSkyBlue if the default background color is light
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; auto insert ) or }
(electric-pair-mode 1)

;; Alias of replace-string
(defalias 'rs 'replace-string)
;;A lias of query-replace
(defalias 'qr 'query-replace)
;; Alias of M-x align
(defalias 'a 'align)
;; Alias of goto-line
(defalias 'gl 'goto-line)

;;; Highlight if one line has over 80 chars in C, Python
;; C
(add-hook 'c-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
'(("^[^\n]\\{80\\}\\(.*\\)$" 1
  '((((class color) (background dark))
     (:background "Gray" t))
    ;; set it to LightSkyBlue if the default background color is light
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))
;; C++
(add-hook 'c++-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
'(("^[^\n]\\{80\\}\\(.*\\)$" 1
  '((((class color) (background dark))
     (:background "Gray" t))
    ;; set it to LightSkyBlue if the default background color is light
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))
;; Python
(add-hook 'python-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
'(("^[^\n]\\{80\\}\\(.*\\)$" 1
  '((((class color) (background dark))
     (:background "Gray" t))
    ;; set it to LightSkyBlue if the default background color is light
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))

;;; Highlight if one line has over 80 chars in Java
(add-hook 'java-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{100\\}\\(.*\\)$" 1  '((((class color) (background dark))
     (:background "Gray" t))
    ;; set it to LightSkyBlue if the default background color is light
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))

;; setting about auto-complete
(when (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil)
  )

;; setting about color-moccur 
(when (require 'color-moccur nil t)
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  (setq moccur-split-word t)
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  )

;; setting about undohist
(when (require 'undohist nil t)
  (undohist-initialize))

;; setting about undo-tree
(when (require 'undo-tree nil t)
  (define-key global-map (kbd "C-'") 'undo-tree-redo)
  (global-undo-tree-mode)
  )

;; setting about helm
(require 'helm-config)

;; setting about point-undo
(when (require 'point-undo nil t)
  (define-key global-map (kbd "M-[") 'point-undo)
  (define-key global-map (kbd "M-]") 'point-redo)
  )

;; setting about cua-mode (not a package)
;;M-o: add a space after the selected character
;;M-n: replace the character with sequence numbers
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; setting about web-mode
;;add extensions that web-mode is automatically applied to
(add-to-list 'auto-mode-alist '("\\.html     	 \\'" . web-mode ))
(add-to-list 'auto-mode-alist '("\\.css      	 \\'" . web-mode ))
(add-to-list 'auto-mode-alist '("\\.js       	 \\'" . web-mode ))
(add-to-list 'auto-mode-alist '("\\.jsx      	 \\'" . web-mode ))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php    \\'" . web-mode ))
(add-to-list 'auto-mode-alist '("\\.ctp      	 \\'" . web-mode ))
(add-to-list 'auto-mode-alist '("\\.jsp      	 \\'" . web-mode ))
(add-to-list 'auto-mode-alist '("\\.as[cp]x  	 \\'" . web-mode ))
(add-to-list 'auto-mode-alist '("\\.erb      	 \\'" . web-mode ))
;;setting for web-mode indent
(defun web-mode-hook ()
  "Hooks for Web Mode."
  (setq web-mode-markup-indent-offset 2); indent for HTML	
  (setq web-mode-css-indent-offset 2   ); CSS
  (setq web-mode-code-indent-offset 2  ); JS, PHP, Ruby, and so on	
  (setq web-mode-comment-style 2       ); indent for comment in web-mode
  (setq web-mode-style-padding 1       ); indent start level in <style>
  (setq web-mode-script-padding 1      );indent start level in <script>
  )

;; syntax check for python
(setq python-check-command "flake8")

;; flycheck (syntax check service)
(add-hook 'after-init-hook #'global-flycheck-mode)
