(deftheme nimbus-tex-im
  "Improve nimbus on tex files")

(custom-theme-set-variables
 'nimbus-tex-im
 '(ansi-color-names-vector ["#454545" "#d65946" "#6aaf50" "#baba36" "#598bc1" "#ab75c3" "#68a5e9" "#bdbdb3"]))

(custom-theme-set-faces
 'nimbus-tex-im
 '(cursor ((t (:foreground "black" :background "#f57e00"))))
 '(fringe ((t (:background "gray11" :bold nil :underline nil))))
 '(link ((t (:foreground "#86b5e8" :underline t))))
 '(link-visited ((t (:foreground "#608079" :underline t))))
 '(highlight ((t (:foreground "gray10" :background "#9ccc65"))))
 '(region ((t (:foreground "gray10" :background "#bdbdb3"))))
 '(shadow ((t (:foreground "#858585"))))
 '(tooltip ((t (:background "#bdbdb3" :foreground "gray10"))))
 '(font-lock-builtin-face ((t (:foreground "#598bc1"))))
 '(font-lock-comment-face ((t (:foreground "#858585" :slant italic))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#858585"))))
 '(font-lock-function-name-face ((t (:foreground "#df5634"))))
 ;; '(font-lock-function-name-face ((t (:foreground "#058945"))))
 '(font-lock-keyword-face ((t (:foreground "#598bc1"))))
 '(font-lock-string-face ((t (:foreground "#6aaf50"))))
 '(font-lock-preprocessor-face ((t (:foreground "#df9522"))))
 '(font-lock-type-face ((t (:foreground "#d65946"))))
 '(font-lock-constant-face ((t (:foreground "#ab75c3"))))
 '(font-lock-warning-face ((t (:foreground "#df9522" :bold t))))
 '(font-lock-variable-name-face ((t (:foreground "#baba36"))))
 '(font-lock-doc-face ((t (:foreground "#8fbc8f"))))
 '(mode-line-inactive ((nil (:background "gray" :foreground "black"))))
 '(mode-line ((nil (:background "light blue" :foreground "black"))))
 '(header-line ((t (:background "#454545" :foreground "#bdbdb3"))))
 '(button ((t (:foreground "#68a5e9" :underline t))))
 '(isearch ((t (:background "#058945" :foreground "white"))))
 '(lazy-highlight ((t (:background "#598bc1" :foreground "white"))))
 '(vertical-border ((t (:foreground "#454545"))))
 '(secondary-selection ((t (:foreground "#bdbdb3" :background "#608079"))))
 '(minibuffer-prompt ((t (:bold t))))
 '(compilation-info ((t (:foreground "#058945" :bold t))))
 '(compilation-warning ((t (:foreground "#df9522" :bold t :background "gray10"))))
 '(compilation-error ((t (:foreground "#d65946" :bold t))))
 '(compilation-mode-line-exit ((t (:inherit compilation-info :background "gray10"))))
 '(compilation-mode-line-run ((t (:inherit compilation-warning :background "gray10"))))
 '(compilation-mode-line-fail ((t (:inherit compilation-error :foreground "#9d2512" :background "gray10"))))
 '(comint-highlight-prompt ((t (:foreground "#6aaf50"))))
 '(show-paren-match ((t (:foreground "white"))))
 '(show-paren-mismatch ((t (:inherit error))))
 '(error ((t (:foreground "red"))))
 '(flx-highlight-face ((t (:foreground "#68a5e9" :underline nil :bold t))))
 '(package-name ((t (:foreground "#86b5e8" :underline t))))
 '(package-status-available ((t (:foreground "#6aaf50"))))
 '(package-description ((t (:foreground "#baba36"))))
 '(ivy-confirm-face ((t (:foreground "#6aaf50"))))
 '(ivy-current-match ((t (:foreground "white" :background "#598bc1"))))
 '(ivy-match-required-face ((t (:foreground "#d65946"))))
 '(ivy-minibuffer-match-face-1 ((t (:foreground "white" :background "#454545"))))
 '(ivy-minibuffer-match-face-2 ((t (:foreground "white" :background "#058945" :weight bold))))
 '(ivy-minibuffer-match-face-3 ((t (:foreground "white" :background "#9d2512" :weight bold))))
 '(ivy-minibuffer-match-face-4 ((t (:foreground "white" :background "#baba36" :weight bold))))
 '(ivy-modified-buffer ((t (:foreground "#df9522"))))
 '(ivy-remote ((t (:foreground "#68a5e9"))))
 '(ivy-subdir ((t (:foreground "#058945"))))
 '(ivy-virtual ((t (:foreground "#598bc1"))))
 '(company-preview-common ((t (:inherit font-lock-comment-face))))
 '(company-scrollbar-bg ((t (:background "#252525"))))
 '(company-scrollbar-fg ((t (:background "#656565"))))
 '(company-tooltip ((t (:foreground "gray10" :background "#bdbdb3"))))
 '(company-tooltip-common ((t (:foreground "#598bc1" :background "#bdbdb3"))))
 '(company-tooltip-common-selection ((t (:foreground "gray10" :background "#598bc1"))))
 '(company-tooltip-mouse ((t (:background "#598bc1"))))
 '(company-tooltip-selection ((t (:foreground "#bdbdb3" :background "#598bc1"))))
 '(diff-added ((t (:background "#284828"))))
 '(diff-changed ((t (:background "#484828"))))
 '(diff-removed ((t (:background "#482828"))))
 '(diff-context ((t (:foreground "#757575"))))
 '(diff-file-header ((t (:foreground "gray10" :background "grey60" :bold t))))
 '(diff-function ((t (:foreground "gray10" :background "grey50"))))
 '(diff-header ((t (:foreground "gray10" :background "grey50"))))
 '(diff-hunk-header ((t (:foreground "gray10" :background "grey50"))))
 '(diff-index ((t (:foreground "gray10" :background "grey50"))))
 '(diff-indicator-added ((t (:inherit diff-added))))
 '(diff-indicator-changed ((t (:inherit diff-changed))))
 '(diff-indicator-removed ((t (:inherit diff-removed))))
 '(diff-nonexistent ((t (:background "grey70"))))
 '(diff-refine-added ((t (:foreground "#6aaf50" :background "#112b47"))))
 '(diff-refine-changed ((t (:foreground "#df9522" :background "#112b47"))))
 '(diff-refine-removed ((t (:foreground "#d65946" :background "#112b47"))))
 '(Info-quoted ((t (:inherit font-lock-constant-face))))
 '(info-menu-header ((t (:foreground "#858585" :weight bold :height 1.4))))
 '(info-menu-star ((t (:foreground "#d65946"))))
 '(info-node ((t (:foreground "#858585" :inherit italic :weight bold))))
 '(info-title-1 ((t (:weight bold :height 1.6))))
 '(info-title-2 ((t (:weight bold :height 1.4))))
 '(info-title-3 ((t (:weight bold :height 1.2))))
 '(info-title-4 ((t (:weight bold :height 1.0))))
 '(org-agenda-date ((t (:foreground "#68a5e9"))))
 '(org-agenda-date-today ((t (:foreground "#86b5e8"))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date :slant italic))))
 '(org-agenda-done ((t (:foreground "#058945"))))
 '(org-agenda-structure ((t (:foreground "#ab75c3"))))
 '(org-date ((t (:inherit link))))
 '(org-date-selected ((t (:foreground "gray10" :background "#baba36" :underline t))))
 '(org-done ((t (:foreground "#058945"))))
 '(org-todo ((t (:foreground "#d65946"))))
 '(org-ellipsis ((t (:foreground "#858585"))))
 '(org-hide ((t (:foreground "gray10"))))
 '(org-level-1 ((t (:foreground "#ab75c3"))))
 '(org-level-2 ((t (:foreground "#68a5e9"))))
 '(org-level-3 ((t (:foreground "#6aaf50"))))
 '(org-level-4 ((t (:foreground "#df9522"))))
 '(org-level-5 ((t (:foreground "#baba36"))))
 '(org-level-6 ((t (:foreground "#9ccc65"))))
 '(org-level-7 ((t (:foreground "#987654"))))
 '(org-level-8 ((t (:foreground "#608079"))))
 '(org-scheduled ((t (:foreground "#6aaf50"))))
 '(org-scheduled-previously ((t (:foreground "#df9522"))))
 '(org-scheduled-today ((t (:foreground "#baba36"))))
 '(org-special-keyword ((t (:inherit font-lock-keyword-face))))
 '(message-cited-text ((t (:inherit font-lock-comment-face))))
 '(message-header-cc ((t (:foreground "#598bc1" :bold t))))
 '(message-header-name ((t (:foreground "#df9522"))))
 '(message-header-newsgroups ((t (:foreground "#7d7c61" :bold t))))
 '(message-header-other ((t (:foreground "#598bc1"))))
 '(message-header-subject ((t (:foreground "#bdbc61"))))
 '(message-header-to ((t (:foreground "#baba36" :bold t))))
 '(message-header-xheader ((t (:foreground "#ab75c3"))))
 '(message-mml ((t (:foreground "#7d7c61"))))
 '(gnus-group-mail-1 ((t (:foreground "#598bc1" :bold t))))
 '(gnus-group-mail-1-empty ((t (:foreground "#598bc1"))))
 '(gnus-group-mail-2 ((t (:foreground "#68a5e9" :bold t))))
 '(gnus-group-mail-2-empty ((t (:foreground "#68a5e9"))))
 '(gnus-group-mail-3 ((t (:foreground "#598bc1" :bold t))))
 '(gnus-group-mail-3-empty ((t (:foreground "#598bc1"))))
 '(gnus-group-mail-low ((t (:foreground "#baba36" :bold t))))
 '(gnus-group-mail-low-empty ((t (:foreground "#baba36"))))
 '(gnus-group-news-1 ((t (:foreground "PaleTurquoise" :bold t))))
 '(gnus-group-news-1-empty ((t (:foreground "PaleTurquoise"))))
 '(gnus-group-news-2 ((t (:foreground "turquoise" :bold t))))
 '(gnus-group-news-2-empty ((t (:foreground "turquoise"))))
 '(gnus-group-news-3 ((t (:bold t))))
 '(gnus-group-news-3-empty ((t (:foreground nil :background nil))))
 '(gnus-group-news-4 ((t (:foreground nil :bold t))))
 '(gnus-group-news-4-empty ((t (:foreground nil :background nil))))
 '(gnus-group-news-5 ((t (:bold t))))
 '(gnus-group-news-5-empty ((t (:foreground nil :background nil))))
 '(gnus-group-news-6 ((t (:bold t))))
 '(gnus-group-news-6-empty ((t (:foreground nil :background nil))))
 '(gnus-group-news-low ((t (:foreground "DarkTurquoise" :bold t))))
 '(gnus-group-news-low-empty ((t (:foreground "DarkTurquoise"))))
 '(gnus-splash ((t (:foreground "#cccccc"))))
 '(gnus-summary-cancelled ((t (:foreground "yellow" :background "black"))))
 '(gnus-summary-high-ancient ((t (:foreground "SkyBlue" :bold t))))
 '(gnus-summary-high-read ((t (:foreground "PaleGreen" :bold t))))
 '(gnus-summary-high-ticked ((t (:foreground "pink" :bold t))))
 '(gnus-summary-high-undownloaded ((t (:foreground "LightGray" :bold t))))
 '(gnus-summary-high-unread ((t (:bold t))))
 '(gnus-summary-low-ancient ((t (:foreground "SkyBlue"))))
 '(gnus-summary-low-read ((t (:foreground "PaleGreen"))))
 '(gnus-summary-low-ticked ((t (:foreground "pink"))))
 '(gnus-summary-low-undownloaded ((t (:foreground "LightGray"))))
 '(gnus-summary-low-unread ((t (:foreground nil :background nil))))
 '(gnus-summary-normal-ancient ((t (:inherit default))))
 '(gnus-summary-normal-read ((t (:foreground "#6aaf50"))))
 '(gnus-summary-normal-ticked ((t (:foreground "#df9522"))))
 '(gnus-summary-normal-undownloaded ((t (:foreground "#656565"))))
 '(gnus-summary-normal-unread ((t (:foreground "#598bc1"))))
 '(gnus-summary-selected ((t (:underline t))))
 '(trailing-whitespace ((t (:background "white" :bold t))))
 '(font-latex-bold-face ((t (:inherit bold :foreground "#058945"))))
 '(font-latex-doctex-documentation-face ((t (:background unspecified))))
 '(font-latex-doctex-preprocessor-face ((t (:inherit (font-latex-doctex-documentation-face font-lock-preprocessor-face)))))
 '(font-latex-italic-face ((t (:inherit italic :foreground "#058945"))))
 '(font-latex-math-face ((t (:foreground "#35a0ed"))))
 ;; '(tex-math ((t (:foreground "#35a0ed"))))
 '(font-latex-sectioning-5-face ((t (:foreground "#f5af33" :weight bold))))
 '(font-latex-sedate-face ((t (:foreground "#e84828"))))
 '(font-latex-slide-title-face ((t (:inherit font-lock-type-face :weight bold :height 1.2))))
 '(font-latex-string-face ((t (:inherit font-lock-string-face))))
 '(font-latex-verbatim-face ((t (:foreground "#bdbc61"))))
 '(font-latex-warning-face ((t (:inherit font-lock-warning-face))))
 '(TeX-error-description-error ((t (:inherit error :bold t))))
 '(TeX-error-description-tex-said ((t (:foreground "#68a5e9"))))
 '(TeX-error-description-warning ((t (:foreground "#df9522" :bold t))))
 '(custom-button ((t (:foreground nil :background nil))))
 '(custom-button-mouse ((t (:foreground nil :background nil))))
 '(custom-button-pressed ((t (:foreground nil :background nil))))
 '(custom-button-pressed-unraised ((t (:foreground "#ab75c3"))))
 '(custom-button-unraised ((t (:foreground nil :background nil))))
 '(custom-changed ((t (:foreground "#d65946"))))
 '(custom-comment ((t (:foreground "gray10" :background "#baba36"))))
 '(custom-comment-tag ((t (:foreground "#bdbdb3"))))
 '(custom-documentation ((t (:foreground nil :background nil))))
 '(custom-face-tag ((t (:foreground "#598bc1"))))
 '(custom-group-subtitle ((t (:bold t))))
 '(custom-group-tag ((t (:foreground "#598bc1" :bold t))))
 '(custom-group-tag-1 ((t (:foreground "#baba36" :bold t))))
 '(custom-invalid ((t (:foreground "gray10" :background "#d65946"))))
 '(custom-link ((t (:inherit button))))
 '(custom-modified ((t (:foreground "#d65946"))))
 '(custom-rogue ((t (:foreground "#baba36" :background "gray10"))))
 '(custom-saved ((t (:underline t))))
 '(custom-set ((t (:foreground "#bdbdb3" :background "#656565"))))
 '(custom-state ((t (:foreground "#6aaf50"))))
 '(custom-themed ((t (:foreground "#d65946"))))
 '(custom-variable-button ((t (:underline t :bold t))))
 '(custom-variable-tag ((t (:foreground "#598bc1" :bold t))))
 '(custom-visibility ((t (:inherit button))))
 '(widget-field ((t (:foreground "#bdbdb3" :background "#656565"))))
 '(default ((t (:foreground "#bdbdb3" :background "gray10")))))

(provide-theme 'nimbus-tex-im)
