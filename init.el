;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
   (quote
    (mew flycheck web-mode helm undo-tree undohist color-moccur auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-default-font "Menlo 15")

;; 起動時のサイズ,表示
(setq default-frame-alist
 (append (list
  '(foreground-color . "white") ;文字色：白
  '(background-color . "black") ;背景色：黒
  '(top . 0) ;ウィンドウの表示位置(Y座標)
  '(left . 730) ;ウィンドウの表示位置(X座標）
  '(width . (text-pixels . 680)) ;ウィンドウ幅
  '(height . (text-pixels . 750)) ;ウィンドウ高
  )
 default-frame-alist)
 )

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


;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; タブ文字1つあたりのスペースの数
(setq default-tab-width 4)

;;c-modeでタブ文字を入力するときの移動量
(add-hook `c-mode-common-hook
 (lambda() (progn (setq c-basic-offset 4))))

;; 行数を表示する
(global-linum-mode t)

;;カラム番号も表示する
(column-number-mode t)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; C-kでカーソルから先の行全体を削除する
(setq kill-whole-line t)

;; スクロールは1行ごとに
(setq mouse-wheel-scroll-amount '(3 ((shift) . 5)))

;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)

;; bufferの最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))

;; エラー音をならなくする
(setq ring-bell-function 'ignore)

;;現在行のハイライト
(defface my-hl-line-face
  ;;背景がdarkならば背景色を紺に
  '((((class color) (background dark))
     (:background "NavyBlue" t))
    ;;背景がlightならば背景色を青に
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;;auto insert ) or }
(electric-pair-mode 1)

;;Alias of replace-string
(defalias 'rs 'replace-string)
;;Alias of query-replace
(defalias 'qr 'query-replace)
;;Alias of M-x align
(defalias 'a 'align)
;;Alias of goto-line
(defalias 'gl 'goto-line)

;;; C系統,Pythonにて1行80文字を超えるとハイライト
(add-hook 'c-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
'(("^[^\n]\\{80\\}\\(.*\\)$" 1
  '((((class color) (background dark))
     (:background "Gray" t))
    ;;背景がlightならば背景色を青に
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))
(add-hook 'c++-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
'(("^[^\n]\\{80\\}\\(.*\\)$" 1
  '((((class color) (background dark))
     (:background "Gray" t))
    ;;背景がlightならば背景色を青に
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))
(add-hook 'python-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
'(("^[^\n]\\{80\\}\\(.*\\)$" 1
  '((((class color) (background dark))
     (:background "Gray" t))
    ;;背景がlightならば背景色を青に
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))

;;; Javaで1行100文字を超えるとハイライト
(add-hook 'java-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{100\\}\\(.*\\)$" 1  '((((class color) (background dark))
     (:background "Gray" t))
    ;;背景がlightならば背景色を青に
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))

;;setting about auto-complete added by Cirus on Oct 5, 2019
(when (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil)
  )

;;setting about color-moccur added by Cirus on Oct 5, 2019
(when (require 'color-moccur nil t)
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  (setq moccur-split-word t)
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  )

;;setting about undohist added by Cirus on Oct 5, 2019
(when (require 'undohist nil t)
  (undohist-initialize))

;;setting about undo-tree added by Cirus on Oct 5, 2019
(when (require 'undo-tree nil t)
  (define-key global-map (kbd "C-'") 'undo-tree-redo)
  (global-undo-tree-mode)
  )

;;setting about helm added by Cirus on Oct 5, 2019
(require 'helm-config)

;;setting about point-undo added by Cirus on Oct 5, 2019
(when (require 'point-undo nil t)
  (define-key global-map (kbd "M-[") 'point-undo)
  (define-key global-map (kbd "M-]") 'point-redo)
  )

;;setting about cua-mode (not a package) added by Cirus on Oct 5, 2019
;;M-o: add a space after the selected character
;;M-n: replace the character with sequence numbers
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;setting about web-mode added by Cirus on Oct 5, 2019
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

;;syntax check for python
(setq python-check-command "flake8")

;;flycheck (syntax check service)
(add-hook 'after-init-hook #'global-flycheck-mode)
