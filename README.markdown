# Aquamacs Emacs Starter Kit

## IMPORTANT NOTE:

The emacs_24_and_packages branch is based off Aquamacs nightly development snapshots from the aquamacs24 branch rather than the stable release. To use Aquamacs stable release, use master branch for this starter kit.

Inspired by [Phil Hagelberg's emacs-starter-kit](http://github.com/technomancy/emacs-starter-kit/tree/master) and fork customizations by [Geoffrey Grosenbach (topfunky)](http://github.com/topfunky/emacs-starter-kit/tree/master), but slimmed down for use with the already heavily customized Aquamacs Mac OS X version of emacs.

Since this starter kit is aimed at Aquamacs it has a very different project layout than Phil Hagelberg's emacs-starter-kit. The Aquamacs Emacs Starter Kit suits the philosophy of Aquamacs to be more Mac like in directory structure. It also slims down the starter kit a lot since Aquamacs already includes many of the same concepts.  This is a new related project, not a fork, and thus code conventions may not be interchangable.

Aquamacs includes a number of "sensible defaults" in addition to what emacs includes. Take a peek into /Applications/Aquamacs.app/Contents/Resources/lisp/ for details (for how to view this via the Finder, see [here](http://www.macosxtips.co.uk/index_files/peek-inside-mac-os-x-packages.php)).

## Guiding concepts in order of precedence

* where possible use configuration (customization.el and Preferences.el) of Aquamacs to achieve desired result.
* use elpa package management to acquire third party extensions to emacs
* use vendor directory for third party code that isn't available any other way
* use ~/Library/Preferences/Aquamacs Emacs/aquamacs-emacs-starter-kit/ for Aquamacs Emacs Starter Kit specific code
* this starter kit is aimed at Ruby, Ruby on Rails, Xcode, and iPhone development
* new windows (frames) should be used sparingly ala traditional emacs, in contrast to Aquamacs defaults

I've also never been a Textmate user, so I don't include textmate mode or other the textmate keybindings that may smooth the transition for those that are coming form Textmate. Check out topfunky's for lots of that stuff. Feel free to fork and add them to your fork.

However, I do occasionally include useful features (snippets, etc.) that originated from Textmate. Again, fork and add if you have some.

## External Required Software

I've switched from bash shell to [zsh](http://www.zsh.org) with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) (see adjust-shell.el). Adjusting PATH for emacs is now longer necessary as we now pick up the environment from ~/.zshrc (which inturn loads ~/.zshenv for our PATH, etc.).

Also note that [rbenv](http://rbenv.org) along with [ruby-build](https://github.com/sstephenson/ruby-build) is now assumed for managing ruby versions.

## MELPA packages that will be downloaded

Packages that add features:

* gist -- wrapper for gist API to be integrated with emacs
* magit -- enhancements for use of git with emacs, see http://zagadka.vm.bytemark.co.uk/magit/magit.html
* magithub -- adds integration from magit to github
* rinari -- enhancements to emacs aimed at Ruby on Rails developers
* ruby-hash-syntax -- provides ruby-hash-syntax-toggle which converts region between 1.8 and 1.9 hash styles
* yasnippet -- snippet functionality ala textmate, including standard distribution of snippets

Packages for source code type specific editing modes:

* coffee-mode
* haml-mode
* handlebars-mode
* js2-mode
* sass-mode
* scss-mode
* slim-mode
* yaml-mode

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

* for earlier versions of git, you may have to do the following to get submodule code such as coffee-mode:

```
cd aquamacs-emacs-starter-kit; git submodule init; git submodule update # gets latest code for submodules such as coffee-mode
```

* restart Aquamacs -- Note: you may have to do this more than once to get all the ELPA packages downloaded and compiled

* optional -- use included customizations.el.walter as guide to settings that you can access via Aquamacs menu > Preferences OR (be careful hand editing this, can break things) you can merge them into your ~/Library/Preferences/Aquamacs Emacs/customizations.el file by merging in settings from customizations.el.walter by hand. If merging by hand, make sure to replace the ERC "your..." setting with actual values instead of the included placeholders.
* restart

## TODO and Scratch:
       rinari config
             tags for projects
             
## GOTCHAS

If installing the starter kit causes Acquamacs to crash on launch, it may be because of extra customization files created by other versions of emacs.  By default, Aquamacs checks for customizations in both `~/Library/Preferences/Aquamacs Emacs/Preferences.el` and `~/.emacs.d/init.el` as part of the startup process.  This second file, `~/.emacs.d/init.el`, will only exist if you have previously installed a version of emacs (such as Emacs 24) that uses `init.el` for customizations.  

Since this starter kit calls `acquamacs-emacs-starter-kit/init.el`, it is necessary to delete or rename any preexisting `./emacs.d/init.el` to avoid collisions.