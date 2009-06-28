# Aquamacs Emacs Starter Kit

Inspired by [Phil Hagelberg's emacs-starter-kit](http://github.com/technomancy/emacs-starter-kit/tree/master) and fork customizations by [Geoffrey Grosenbach (topfunky)](http://github.com/topfunky/emacs-starter-kit/tree/master), but slimmed down for use with the already heavily customized Aquamacs Mac OS X version of emacs.

Since this starter kit is aimed at Aquamacs it has a very different project layout than Phil Hagelberg's emacs-starter-kit. The Aquamacs Emacs Starter Kit suits the philosophy of Aquamacs to be more Mac like in directory structure. It also slims down the starter kit a lot since Aquamacs already includes many of the same concepts.  This is a new related project, not a fork, and thus code conventions may not be interchangable.

## Guiding concepts in order of precedence

* where possible use configuration (customization.el and Preferences.el) of Aquamacs to achieve desired result.
* use elpa package management to acquire third party extensions to emacs
* use vendor directory for third party code that isn't available any other way
* use ~/Library/Preferences/Aquamacs Emacs/kit/ for Aquamacs Emacs Starter Kit specific code

## TODO and Scratch:

enable ido
elpa
        css-mode
        gist
        javascript or js2-mode (see what works with rinari)
        magit
        rinari --? support for ri built in?
        w3
        yasnippet-bundle -- grab snippets from topfunky?
Break Preferences.el into logical files
vendor -- add under ~/Library/Preferences/Aquamacs Emacs/?
       applescript-mode
       line-num
       objc-c-mode.el
       xcode.el
       yaml-mode
       htmlize
       whitespace
       textmate hooks that open file in emacs?
       pull some from starter-kit-defuns.el
       starter-kit-elpa
       pull file ->  mode, nxhtml set up, ido setup from
       starter-kit-misc if necessary
       starter-kit-ruby ri config if necessary
color-theme already supported in Aquamacs
            set up preferred theme on load --blackboard
            investigate twilight

rinari config
      tags for projects

