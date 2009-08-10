# Aquamacs Emacs Starter Kit

Inspired by [Phil Hagelberg's emacs-starter-kit](http://github.com/technomancy/emacs-starter-kit/tree/master) and fork customizations by [Geoffrey Grosenbach (topfunky)](http://github.com/topfunky/emacs-starter-kit/tree/master), but slimmed down for use with the already heavily customized Aquamacs Mac OS X version of emacs.

Since this starter kit is aimed at Aquamacs it has a very different project layout than Phil Hagelberg's emacs-starter-kit. The Aquamacs Emacs Starter Kit suits the philosophy of Aquamacs to be more Mac like in directory structure. It also slims down the starter kit a lot since Aquamacs already includes many of the same concepts.  This is a new related project, not a fork, and thus code conventions may not be interchangable.

## Guiding concepts in order of precedence

* where possible use configuration (customization.el and Preferences.el) of Aquamacs to achieve desired result.
* use elpa package management to acquire third party extensions to emacs
* use vendor directory for third party code that isn't available any other way
* use ~/Library/Preferences/Aquamacs Emacs/aquamacs-emacs-starter-kit/ for Aquamacs Emacs Starter Kit specific code
* this starter kit is aimed at Ruby, Ruby on Rails, Xcode, and iPhone development
* new windows (frames) should be used sparingly ala traditional emacs, in contrast to Aquamacs defaults

I've also never been a Textmate user, so I don't include textmate mode or other the textmate keybindings that may smooth the transition for those that are coming form Textmate. Check out topfunky's for lots of that stuff. Feel free to fork and add them to your fork.

However, I do occasionally include useful features (snippets, etc.) that originated from Textmate. Again, fork and add if you have some.

## ELPA packages that will be downloaded

* gist -- wrapper for gist API to be integrated with emacs
* magit -- enhancements for use of git with emacs, see http://zagadka.vm.bytemark.co.uk/magit/magit.html
* paredit -- parenthesis matching, nice addition for lisp editing
* rinari -- enhancements to emacs aimed at Ruby on Rails developers
* w3 -- lynx-like built in browser for emacs
* yasnippet-bundle -- snippet functionality ala textmate, including standard distribution of snippets

## Install

* cd ~/Library/Preferences/Aquamacs Emacs/
* git clone git://github.com/walter/aquamacs-emacs-starter-kit.git
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
* restart Aquamacs -- Note: you may have to do this more than once to get all the ELPA packages downloaded and compiled

* optional -- use included customizations.el.walter as guide to settings that you can access via Aquamacs menu > Preferences OR (be careful hand editing this, can break things) you can merge them into your ~/Library/Preferences/Aquamacs Emacs/customizations.el file by merging in settings from customizations.el.walter by hand. If merging by hand, make sure to replace the ERC "your..." setting with actual values instead of the included placeholders.
* restart

## TODO and Scratch:
       rinari config
             tags for projects

