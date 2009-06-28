# Aquamacs Emacs Starter Kit

Inspired by [Phil Hagelberg's emacs-starter-kit](http://github.com/technomancy/emacs-starter-kit/tree/master) and fork customizations by [Geoffrey Grosenbach (topfunky)](http://github.com/topfunky/emacs-starter-kit/tree/master), but slimmed down for use with the already heavily customized Aquamacs Mac OS X version of emacs.

Since this starter kit is aimed at Aquamacs it has a very different project layout than Phil Hagelberg's emacs-starter-kit. The Aquamacs Emacs Starter Kit suits the philosophy of Aquamacs to be more Mac like in directory structure. It also slims down the starter kit a lot since Aquamacs already includes many of the same concepts.  This is a new related project, not a fork, and thus code conventions may not be interchangable.

## Guiding concepts in order of precedence

* where possible use configuration (customization.el and Preferences.el) of Aquamacs to achieve desired result.
* use elpa package management to acquire third party extensions to emacs
* use vendor directory for third party code that isn't available any other way
* use ~/Library/Preferences/Aquamacs Emacs/kit/ for Aquamacs Emacs Starter Kit specific code

## Install

* cd ~/Library/Preferences/Aquamacs Emacs/
* git clone git@github.com:walter/aquamacs-emacs-starter-kit.git
* add the following to ~/Library/Preferences/Aquamacs Emacs/Preferences.el

<pre>
<code>
;; Aquamacs Emacs Starter Kit
;; http://github.com/walter/aquamacs-emacs-starter-kit
;; set the dotfiles-dir variable to this directory
(setq kitfiles-dir (concat (file-name-directory
                    (or (buffer-file-name) load-file-name)) "/aquamacs-emacs-starter-kit"))

;; set up our various directories to load
(add-to-list 'load-path kitfiles-dir)
(require 'init)
</code>
</pre>

* optionally set a theme by altering appearance.el to specify either an Aquamacs bundled theme or one included in this kit
* restart Aquamacs

## TODO and Scratch:

enable ido
elpa
        css-mode --handled by aquamacs
        gist
        javascript --handled by aquqmacs
        magit
        rinari --? support for ri built in?
        w3
        yasnippet-bundle -- grab snippets from topfunky?
Break Preferences.el into logical files -- known stuff done
vendor -- add under ~/Library/Preferences/Aquamacs Emacs/?
       applescript-mode --done
       line-num --done
       objc-c-mode.el --done
       xcode.el --done
       yaml-mode --done
       htmlize -- use nxHtml instead as htmlize is not currently compatible with emacs 23
       whitespace --done
       textmate hooks that open file in emacs?
       pull some from starter-kit-defuns.el --done
       starter-kit-elpa
       pull file ->  mode, nxhtml set up, ido setup from
       starter-kit-misc if necessary --not really anything that is necessary with aquamacs, except toolbar-mode being turned off
       starter-kit-ruby ri config if necessary
color-theme already supported in Aquamacs
            set up preferred theme on load --blackboard
            investigate twilight
       color themes --done
       simple green on black --done
rinari config
      tags for projects

