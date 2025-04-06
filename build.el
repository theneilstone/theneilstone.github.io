(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpe"  . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'htmlize)

(setq make-backup-files nil)

(require 'ox-publish)

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"/css/worg.css\" />")

(setq org-publish-project-alist
      '(("blog-post"
	 :base-directory "post/"
	 :base-extension "org"
	 :publishing-directory "publish_html/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :org-html-preamble nil
	 :with-author nil
	 :with-creator t
	 :with-toc t
	 :section-numbers nil
	 :time-stamp-file nil
	 :auto-sitemap t
	 :sitemap-filename "index.org"
	 :sitemap-title "Neil's Blog"
	 :sitemap-sort-files anti-chronologically
	 :sitemap-file-entry-format "%d %t"
	 )
	("blog-static"
	 :base-directory "post/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("blog"
	 :components ("blog-post" "blog-static"))))

(org-publish-all t)

(message "Build complete!")
