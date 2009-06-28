<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: whitespace.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=whitespace.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: whitespace.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=whitespace.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for whitespace.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=whitespace.el" /><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22whitespace.el%22">whitespace.el</a></h1></div><div class="wrapper"><div class="content browse"><p><a href="http://www.emacswiki.org/emacs/download/whitespace.el">Download</a></p><pre class="code"><span class="linecomment">;;; whitespace.el --- minor mode to visualize TAB, (HARD) SPACE, NEWLINE</span>

<span class="linecomment">;; Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008</span>
<span class="linecomment">;;   Free Software Foundation, Inc.</span>

<span class="linecomment">;; Author: Vinicius Jose Latorre &lt;viniciusjl@ig.com.br&gt;</span>
<span class="linecomment">;; Maintainer: Vinicius Jose Latorre &lt;viniciusjl@ig.com.br&gt;</span>
<span class="linecomment">;; Keywords: data, wp</span>
<span class="linecomment">;; Version: 11.2.2</span>
<span class="linecomment">;; X-URL: http://www.emacswiki.org/cgi-bin/wiki/ViniciusJoseLatorre</span>

<span class="linecomment">;; This file is part of GNU Emacs.</span>

<span class="linecomment">;; GNU Emacs is free software: you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation, either version 3 of the License, or</span>
<span class="linecomment">;; (at your option) any later version.</span>

<span class="linecomment">;; GNU Emacs is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with GNU Emacs.  If not, see &lt;http://www.gnu.org/licenses/&gt;.</span>

<span class="linecomment">;;; Commentary:</span>

<span class="linecomment">;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Introduction</span>
<span class="linecomment">;; ------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This package is a minor mode to visualize blanks (TAB, (HARD) SPACE</span>
<span class="linecomment">;; and NEWLINE).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; whitespace uses two ways to visualize blanks: faces and display</span>
<span class="linecomment">;; table.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; * Faces are used to highlight the background with a color.</span>
<span class="linecomment">;;   whitespace uses font-lock to highlight blank characters.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; * Display table changes the way a character is displayed, that is,</span>
<span class="linecomment">;;   it provides a visual mark for characters, for example, at the end</span>
<span class="linecomment">;;   of line (?\xB6), at SPACEs (?\xB7) and at TABs (?\xBB).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; The `whitespace-style' variable selects which way blanks are</span>
<span class="linecomment">;; visualized.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Note that when whitespace is turned on, whitespace saves the</span>
<span class="linecomment">;; font-lock state, that is, if font-lock is on or off.  And</span>
<span class="linecomment">;; whitespace restores the font-lock state when it is turned off.  So,</span>
<span class="linecomment">;; if whitespace is turned on and font-lock is off, whitespace also</span>
<span class="linecomment">;; turns on the font-lock to highlight blanks, but the font-lock will</span>
<span class="linecomment">;; be turned off when whitespace is turned off.  Thus, turn on</span>
<span class="linecomment">;; font-lock before whitespace is on, if you want that font-lock</span>
<span class="linecomment">;; continues on after whitespace is turned off.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; When whitespace is on, it takes care of highlighting some special</span>
<span class="linecomment">;; characters over the default mechanism of `nobreak-char-display'</span>
<span class="linecomment">;; (which see) and `show-trailing-whitespace' (which see).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; There are two ways of using whitespace: local and global.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; * Local whitespace affects only the current buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; * Global whitespace affects all current and future buffers.  That</span>
<span class="linecomment">;;   is, if you turn on global whitespace and then create a new</span>
<span class="linecomment">;;   buffer, the new buffer will also have whitespace on.  The</span>
<span class="linecomment">;;   `whitespace-global-modes' variable controls which major-mode will</span>
<span class="linecomment">;;   be automagically turned on.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You can mix the local and global usage without any conflict.  But</span>
<span class="linecomment">;; local whitespace has priority over global whitespace.  Whitespace</span>
<span class="linecomment">;; mode is active in a buffer if you have enabled it in that buffer or</span>
<span class="linecomment">;; if you have enabled it globally.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; When global and local whitespace are on:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; * if local whitespace is turned off, whitespace is turned off for</span>
<span class="linecomment">;;   the current buffer only.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; * if global whitespace is turned off, whitespace continues on only</span>
<span class="linecomment">;;   in the buffers in which local whitespace is on.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; To use whitespace, insert in your ~/.emacs:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (require 'whitespace-mode)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Or autoload at least one of the commands`whitespace-mode',</span>
<span class="linecomment">;; `whitespace-toggle-options', `global-whitespace-mode' or</span>
<span class="linecomment">;; `global-whitespace-toggle-options'.  For example:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (autoload 'whitespace-mode           "whitespace"</span>
<span class="linecomment">;;      "Toggle whitespace visualization."        t)</span>
<span class="linecomment">;;    (autoload 'whitespace-toggle-options "whitespace"</span>
<span class="linecomment">;;      "Toggle local `whitespace-mode' options." t)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; whitespace was inspired by:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    whitespace.el            Rajesh Vaidheeswarran &lt;rv@gnu.org&gt;</span>
<span class="linecomment">;;	Warn about and clean bogus whitespaces in the file</span>
<span class="linecomment">;;	(inspired the idea to warn and clean some blanks)</span>
<span class="linecomment">;;	This was the original `whitespace.el' which was replaced by</span>
<span class="linecomment">;;	`blank-mode.el'.  And later `blank-mode.el' was renamed to</span>
<span class="linecomment">;;	`whitespace.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    show-whitespace-mode.el  Aurelien Tisne &lt;aurelien.tisne@free.fr&gt;</span>
<span class="linecomment">;;       Simple mode to highlight whitespaces</span>
<span class="linecomment">;;       (inspired the idea to use font-lock)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    whitespace-mode.el       Lawrence Mitchell &lt;wence@gmx.li&gt;</span>
<span class="linecomment">;;       Major mode for editing Whitespace</span>
<span class="linecomment">;;       (inspired the idea to use display table)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    visws.el                 Miles Bader &lt;miles@gnu.org&gt;</span>
<span class="linecomment">;;       Make whitespace visible</span>
<span class="linecomment">;;       (handle display table, his code was modified, but the main</span>
<span class="linecomment">;;       idea was kept)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Using whitespace</span>
<span class="linecomment">;; ----------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; There is no problem if you mix local and global minor mode usage.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; * LOCAL whitespace:</span>
<span class="linecomment">;;    + To toggle whitespace options locally, type:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;         M-x whitespace-toggle-options RET</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    + To activate whitespace locally, type:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;         C-u 1 M-x whitespace-mode RET</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    + To deactivate whitespace locally, type:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;         C-u 0 M-x whitespace-mode RET</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    + To toggle whitespace locally, type:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;         M-x whitespace-mode RET</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; * GLOBAL whitespace:</span>
<span class="linecomment">;;    + To toggle whitespace options globally, type:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;         M-x global-whitespace-toggle-options RET</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    + To activate whitespace globally, type:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;         C-u 1 M-x global-whitespace-mode RET</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    + To deactivate whitespace globally, type:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;         C-u 0 M-x global-whitespace-mode RET</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    + To toggle whitespace globally, type:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;         M-x global-whitespace-mode RET</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; There are also the following useful commands:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-newline-mode'</span>
<span class="linecomment">;;    Toggle NEWLINE minor mode visualization ("nl" on modeline).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `global-whitespace-newline-mode'</span>
<span class="linecomment">;;    Toggle NEWLINE global minor mode visualization ("NL" on modeline).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-report'</span>
<span class="linecomment">;;    Report some blank problems in buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-report-region'</span>
<span class="linecomment">;;    Report some blank problems in a region.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-cleanup'</span>
<span class="linecomment">;;    Cleanup some blank problems in all buffer or at region.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-cleanup-region'</span>
<span class="linecomment">;;    Cleanup some blank problems at region.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; The problems, which are cleaned up, are:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. empty lines at beginning of buffer.</span>
<span class="linecomment">;; 2. empty lines at end of buffer.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value `empty', remove all</span>
<span class="linecomment">;;    empty lines at beginning and/or end of buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 3. 8 or more SPACEs at beginning of line.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value `indentation':</span>
<span class="linecomment">;;    replace 8 or more SPACEs at beginning of line by TABs, if</span>
<span class="linecomment">;;    `indent-tabs-mode' is non-nil; otherwise, replace TABs by</span>
<span class="linecomment">;;    SPACEs.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value `indentation::tab',</span>
<span class="linecomment">;;    replace 8 or more SPACEs at beginning of line by TABs.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value `indentation::space',</span>
<span class="linecomment">;;    replace TABs by SPACEs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 4. SPACEs before TAB.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value `space-before-tab':</span>
<span class="linecomment">;;    replace SPACEs by TABs, if `indent-tabs-mode' is non-nil;</span>
<span class="linecomment">;;    otherwise, replace TABs by SPACEs.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value</span>
<span class="linecomment">;;    `space-before-tab::tab', replace SPACEs by TABs.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value</span>
<span class="linecomment">;;    `space-before-tab::space', replace TABs by SPACEs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 5. SPACEs or TABs at end of line.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value `trailing', remove all</span>
<span class="linecomment">;;    SPACEs or TABs at end of line.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 6. 8 or more SPACEs after TAB.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value `space-after-tab':</span>
<span class="linecomment">;;    replace SPACEs by TABs, if `indent-tabs-mode' is non-nil;</span>
<span class="linecomment">;;    otherwise, replace TABs by SPACEs.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value `space-after-tab::tab',</span>
<span class="linecomment">;;    replace SPACEs by TABs.</span>
<span class="linecomment">;;    If `whitespace-style' includes the value</span>
<span class="linecomment">;;    `space-after-tab::space', replace TABs by SPACEs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Hooks</span>
<span class="linecomment">;; -----</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; whitespace has the following hook variables:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-mode-hook'</span>
<span class="linecomment">;;    It is evaluated always when whitespace is turned on locally.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `global-whitespace-mode-hook'</span>
<span class="linecomment">;;    It is evaluated always when whitespace is turned on globally.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-load-hook'</span>
<span class="linecomment">;;    It is evaluated after whitespace package is loaded.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Options</span>
<span class="linecomment">;; -------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Below it's shown a brief description of whitespace options, please,</span>
<span class="linecomment">;; see the options declaration in the code for a long documentation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-style'		Specify which kind of blank is</span>
<span class="linecomment">;;				visualized.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-space'		Face used to visualize SPACE.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-hspace'		Face used to visualize HARD SPACE.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-tab'		Face used to visualize TAB.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-newline'		Face used to visualize NEWLINE char</span>
<span class="linecomment">;;				mapping.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-trailing'	Face used to visualize trailing</span>
<span class="linecomment">;;				blanks.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-line'		Face used to visualize "long" lines.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-space-before-tab'	Face used to visualize SPACEs</span>
<span class="linecomment">;;					before TAB.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-indentation'	Face used to visualize 8 or more</span>
<span class="linecomment">;;				SPACEs at beginning of line.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-empty'		Face used to visualize empty lines at</span>
<span class="linecomment">;;				beginning and/or end of buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-space-after-tab'	Face used to visualize 8 or more</span>
<span class="linecomment">;;				SPACEs after TAB.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-space-regexp'	Specify SPACE characters regexp.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-hspace-regexp'	Specify HARD SPACE characters regexp.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-tab-regexp'	Specify TAB characters regexp.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-trailing-regexp'	Specify trailing characters regexp.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-space-before-tab-regexp'	Specify SPACEs before TAB</span>
<span class="linecomment">;;					regexp.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-indentation-regexp'	Specify regexp for 8 or more</span>
<span class="linecomment">;;					SPACEs at beginning of line.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-empty-at-bob-regexp'	Specify regexp for empty lines</span>
<span class="linecomment">;;					at beginning of buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-empty-at-eob-regexp'	Specify regexp for empty lines</span>
<span class="linecomment">;;					at end of buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-space-after-tab-regexp'	Specify regexp for 8 or more</span>
<span class="linecomment">;;					SPACEs after TAB.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-line-column'	Specify column beyond which the line</span>
<span class="linecomment">;;				is highlighted.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-display-mappings'	Specify an alist of mappings</span>
<span class="linecomment">;;					for displaying characters.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-global-modes'	Modes for which global</span>
<span class="linecomment">;;				`whitespace-mode' is automagically</span>
<span class="linecomment">;;				turned on.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; `whitespace-action'		Specify which action is taken when a</span>
<span class="linecomment">;;				buffer is visited or written.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Acknowledgements</span>
<span class="linecomment">;; ----------------</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to David Reitter &lt;david.reitter@gmail.com&gt; for suggesting a</span>
<span class="linecomment">;; `whitespace-newline' initialization with low contrast relative to</span>
<span class="linecomment">;; the background color.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Stephen Deasey &lt;sdeasey@gmail.com&gt; for the</span>
<span class="linecomment">;; `indent-tabs-mode' usage suggestion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Eric Cooper &lt;ecc@cmu.edu&gt; for the suggestion to have hook</span>
<span class="linecomment">;; actions when buffer is written as the original whitespace package</span>
<span class="linecomment">;; had.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to nschum (EmacsWiki) for the idea about highlight "long"</span>
<span class="linecomment">;; lines tail.  See EightyColumnRule (EmacsWiki).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Juri Linkov &lt;juri@jurta.org&gt; for suggesting:</span>
<span class="linecomment">;;    * `define-minor-mode'.</span>
<span class="linecomment">;;    * `global-whitespace-*' name for global commands.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Robert J. Chassell &lt;bob@gnu.org&gt; for doc fix and testing.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Drew Adams &lt;drew.adams@oracle.com&gt; for toggle commands</span>
<span class="linecomment">;; suggestion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Antti Kaihola &lt;antti.kaihola@linux-aktivaattori.org&gt; for</span>
<span class="linecomment">;; helping to fix `find-file-hooks' reference.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Andreas Roehler &lt;andreas.roehler@easy-emacs.de&gt; for</span>
<span class="linecomment">;; indicating defface byte-compilation warnings.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to TimOCallaghan (EmacsWiki) for the idea about highlight</span>
<span class="linecomment">;; "long" lines.  See EightyColumnRule (EmacsWiki).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Yanghui Bian &lt;yanghuibian@gmail.com&gt; for indicating a new</span>
<span class="linecomment">;; NEWLINE character mapping.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Pete Forman &lt;pete.forman@westgeo.com&gt; for indicating</span>
<span class="linecomment">;; whitespace-mode.el on XEmacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Miles Bader &lt;miles@gnu.org&gt; for handling display table via</span>
<span class="linecomment">;; visws.el (his code was modified, but the main idea was kept).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to:</span>
<span class="linecomment">;;    Rajesh Vaidheeswarran &lt;rv@gnu.org&gt;	(original) whitespace.el</span>
<span class="linecomment">;;    Aurelien Tisne &lt;aurelien.tisne@free.fr&gt;	show-whitespace-mode.el</span>
<span class="linecomment">;;    Lawrence Mitchell &lt;wence@gmx.li&gt;		whitespace-mode.el</span>
<span class="linecomment">;;    Miles Bader &lt;miles@gnu.org&gt;		visws.el</span>
<span class="linecomment">;; And to all people who contributed with them.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

<span class="linecomment">;;; code:</span>

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; User Variables:</span>


<span class="linecomment">;;; Interface to the command system</span>


(defgroup whitespace nil
  "<span class="quote">Visualize blanks (TAB, (HARD) SPACE and NEWLINE).</span>"
  :link '(emacs-library-link :tag "<span class="quote">Source Lisp File</span>" "<span class="quote">whitespace.el</span>")
  :version "<span class="quote">23.1</span>"
  :group 'wp
  :group 'data)


(defcustom whitespace-style
  '(tabs spaces trailing lines space-before-tab newline
	 indentation empty space-after-tab
	 space-mark tab-mark newline-mark)
  "<span class="quote">*Specify which kind of blank is visualized.

It's a list containing some or all of the following values:

   trailing		trailing blanks are visualized via faces.

   tabs			TABs are visualized via faces.

   spaces		SPACEs and HARD SPACEs are visualized via
			faces.

   lines		lines whose have columns beyond
			`whitespace-line-column' are highlighted via
			faces .
			Whole line is highlighted.
			It has precedence over `lines-tail' (see
			below).

   lines-tail		lines whose have columns beyond
			`whitespace-line-column' are highlighted via
			faces.
			But only the part of line which goes
			beyond `whitespace-line-column' column.
			It has effect only if `lines' (see above)
			is not present in `whitespace-style'.

   newline		NEWLINEs are visualized via faces.

   empty		empty lines at beginning and/or end of buffer
			are visualized via faces.

   indentation::tab	8 or more SPACEs at beginning of line are
			visualized via faces.

   indentation::space	TABs at beginning of line are visualized via
			faces.

   indentation		8 or more SPACEs at beginning of line are
			visualized, if `indent-tabs-mode' (which see)
			is non-nil; otherwise, TABs at beginning of
			line are visualized via faces.

   space-after-tab::tab		8 or more SPACEs after a TAB are
				visualized via faces.

   space-after-tab::space	TABs are visualized when occurs 8 or
				more SPACEs after a TAB via faces.

   space-after-tab		8 or more SPACEs after a TAB are
				visualized, if `indent-tabs-mode'
				(which see) is non-nil; otherwise,
				the TABs are visualized via faces.

   space-before-tab::tab	SPACEs before TAB are visualized via
				faces.

   space-before-tab::space	TABs are visualized when occurs SPACEs
				before TAB via faces.

   space-before-tab		SPACEs before TAB are visualized, if
				`indent-tabs-mode' (which see) is
				non-nil; otherwise, the TABs are
				visualized via faces.

   space-mark		SPACEs and HARD SPACEs are visualized via
			display table.

   tab-mark		TABs are visualized via display table.

   newline-mark		NEWLINEs are visualized via display table.

Any other value is ignored.

If nil, don't visualize TABs, (HARD) SPACEs and NEWLINEs via faces and
via display table.

There is an evaluation order for some values, if some values are
included in `whitespace-style' list.  For example, if
indentation, indentation::tab and/or indentation::space are
included in `whitespace-style' list.  The evaluation order for
these values is:

 * For indentation:
   1. indentation
   2. indentation::tab
   3. indentation::space

 * For SPACEs after TABs:
   1. space-after-tab
   2. space-after-tab::tab
   3. space-after-tab::space

 * For SPACEs before TABs:
   1. space-before-tab
   2. space-before-tab::tab
   3. space-before-tab::space

So, for example, if indentation and indentation::space are
included in `whitespace-style' list, the indentation value is
evaluated instead of indentation::space value.

See also `whitespace-display-mappings' for documentation.</span>"
  :type '(repeat :tag "<span class="quote">Kind of Blank</span>"
		 (choice :tag "<span class="quote">Kind of Blank Face</span>"
			 (const :tag "<span class="quote">(Face) Trailing TABs, SPACEs and HARD SPACEs</span>"
				trailing)
			 (const :tag "<span class="quote">(Face) SPACEs and HARD SPACEs</span>"
				spaces)
			 (const :tag "<span class="quote">(Face) TABs</span>" tabs)
			 (const :tag "<span class="quote">(Face) Lines</span>" lines)
			 (const :tag "<span class="quote">(Face) SPACEs before TAB</span>"
				space-before-tab)
			 (const :tag "<span class="quote">(Face) NEWLINEs</span>" newline)
			 (const :tag "<span class="quote">(Face) Indentation SPACEs</span>"
				indentation)
			 (const :tag "<span class="quote">(Face) Empty Lines At BOB And/Or EOB</span>"
				empty)
			 (const :tag "<span class="quote">(Face) SPACEs after TAB</span>"
				space-after-tab)
			 (const :tag "<span class="quote">(Mark) SPACEs and HARD SPACEs</span>"
				space-mark)
			 (const :tag "<span class="quote">(Mark) TABs</span>" tab-mark)
			 (const :tag "<span class="quote">(Mark) NEWLINEs</span>" newline-mark)))
  :group 'whitespace)


(defcustom whitespace-space 'whitespace-space
  "<span class="quote">*Symbol face used to visualize SPACE.

Used when `whitespace-style' includes the value `spaces'.</span>"
  :type 'face
  :group 'whitespace)


(defface whitespace-space
  '((((class color) (background dark))
     (:background "<span class="quote">grey20</span>"      :foreground "<span class="quote">aquamarine3</span>"))
    (((class color) (background light))
     (:background "<span class="quote">LightYellow</span>" :foreground "<span class="quote">aquamarine3</span>"))
    (t (:inverse-video t)))
  "<span class="quote">Face used to visualize SPACE.</span>"
  :group 'whitespace)


(defcustom whitespace-hspace 'whitespace-hspace
  "<span class="quote">*Symbol face used to visualize HARD SPACE.

Used when `whitespace-style' includes the value `spaces'.</span>"
  :type 'face
  :group 'whitespace)


(defface whitespace-hspace		<span class="linecomment">; 'nobreak-space</span>
  '((((class color) (background dark))
     (:background "<span class="quote">grey24</span>"        :foreground "<span class="quote">aquamarine3</span>"))
    (((class color) (background light))
     (:background "<span class="quote">LemonChiffon3</span>" :foreground "<span class="quote">aquamarine3</span>"))
    (t (:inverse-video t)))
  "<span class="quote">Face used to visualize HARD SPACE.</span>"
  :group 'whitespace)


(defcustom whitespace-tab 'whitespace-tab
  "<span class="quote">*Symbol face used to visualize TAB.

Used when `whitespace-style' includes the value `tabs'.</span>"
  :type 'face
  :group 'whitespace)


(defface whitespace-tab
  '((((class color) (background dark))
     (:background "<span class="quote">grey22</span>" :foreground "<span class="quote">aquamarine3</span>"))
    (((class color) (background light))
     (:background "<span class="quote">beige</span>"  :foreground "<span class="quote">aquamarine3</span>"))
    (t (:inverse-video t)))
  "<span class="quote">Face used to visualize TAB.</span>"
  :group 'whitespace)


(defcustom whitespace-newline 'whitespace-newline
  "<span class="quote">*Symbol face used to visualize NEWLINE char mapping.

See `whitespace-display-mappings'.

Used when `whitespace-style' includes the values `newline-mark'
and `newline'.</span>"
  :type 'face
  :group 'whitespace)


(defface whitespace-newline
  '((((class color) (background dark))
     (:foreground "<span class="quote">darkgray</span>" :bold nil))
    (((class color) (background light))
     (:foreground "<span class="quote">lightgray</span>" :bold nil))
    (t (:underline t :bold nil)))
  "<span class="quote">Face used to visualize NEWLINE char mapping.

See `whitespace-display-mappings'.</span>"
  :group 'whitespace)


(defcustom whitespace-trailing 'whitespace-trailing
  "<span class="quote">*Symbol face used to visualize trailing blanks.

Used when `whitespace-style' includes the value `trailing'.</span>"
  :type 'face
  :group 'whitespace)


(defface whitespace-trailing		<span class="linecomment">; 'trailing-whitespace</span>
  '((((class mono)) (:inverse-video t :bold t :underline t))
    (t (:background "<span class="quote">red1</span>" :foreground "<span class="quote">yellow</span>" :bold t)))
  "<span class="quote">Face used to visualize trailing blanks.</span>"
  :group 'whitespace)


(defcustom whitespace-line 'whitespace-line
  "<span class="quote">*Symbol face used to visualize \"long\" lines.

See `whitespace-line-column'.

Used when `whitespace-style' includes the value `line'.</span>"
  :type 'face
  :group 'whitespace)


(defface whitespace-line
  '((((class mono)) (:inverse-video t :bold t :underline t))
    (t (:background "<span class="quote">gray20</span>" :foreground "<span class="quote">violet</span>")))
  "<span class="quote">Face used to visualize \"long\" lines.

See `whitespace-line-column'.</span>"
  :group 'whitespace)


(defcustom whitespace-space-before-tab 'whitespace-space-before-tab
  "<span class="quote">*Symbol face used to visualize SPACEs before TAB.

Used when `whitespace-style' includes the value `space-before-tab'.</span>"
  :type 'face
  :group 'whitespace)


(defface whitespace-space-before-tab
  '((((class mono)) (:inverse-video t :bold t :underline t))
    (t (:background "<span class="quote">DarkOrange</span>" :foreground "<span class="quote">firebrick</span>")))
  "<span class="quote">Face used to visualize SPACEs before TAB.</span>"
  :group 'whitespace)


(defcustom whitespace-indentation 'whitespace-indentation
  "<span class="quote">*Symbol face used to visualize 8 or more SPACEs at beginning of line.

Used when `whitespace-style' includes the value `indentation'.</span>"
  :type 'face
  :group 'whitespace)


(defface whitespace-indentation
  '((((class mono)) (:inverse-video t :bold t :underline t))
    (t (:background "<span class="quote">yellow</span>" :foreground "<span class="quote">firebrick</span>")))
  "<span class="quote">Face used to visualize 8 or more SPACEs at beginning of line.</span>"
  :group 'whitespace)


(defcustom whitespace-empty 'whitespace-empty
  "<span class="quote">*Symbol face used to visualize empty lines at beginning and/or end of buffer.

Used when `whitespace-style' includes the value `empty'.</span>"
  :type 'face
  :group 'whitespace)


(defface whitespace-empty
  '((((class mono)) (:inverse-video t :bold t :underline t))
    (t (:background "<span class="quote">yellow</span>" :foreground "<span class="quote">firebrick</span>")))
  "<span class="quote">Face used to visualize empty lines at beginning and/or end of buffer.</span>"
  :group 'whitespace)


(defcustom whitespace-space-after-tab 'whitespace-space-after-tab
  "<span class="quote">*Symbol face used to visualize 8 or more SPACEs after TAB.

Used when `whitespace-style' includes the value `space-after-tab'.</span>"
  :type 'face
  :group 'whitespace)


(defface whitespace-space-after-tab
  '((((class mono)) (:inverse-video t :bold t :underline t))
    (t (:background "<span class="quote">yellow</span>" :foreground "<span class="quote">firebrick</span>")))
  "<span class="quote">Face used to visualize 8 or more SPACEs after TAB.</span>"
  :group 'whitespace)


(defcustom whitespace-hspace-regexp
  "<span class="quote">\\(\\(\xA0\\|\x8A0\\|\x920\\|\xE20\\|\xF20\\)+\\)</span>"
  "<span class="quote">*Specify HARD SPACE characters regexp.

If you're using `mule' package, there may be other characters besides:

   \"\\xA0\"   \"\\x8A0\"   \"\\x920\"   \"\\xE20\"   \"\\xF20\"

that should be considered HARD SPACE.

Here are some examples:

   \"\\\\(^\\xA0+\\\\)\"		\
visualize only leading HARD SPACEs.
   \"\\\\(\\xA0+$\\\\)\"		\
visualize only trailing HARD SPACEs.
   \"\\\\(^\\xA0+\\\\|\\xA0+$\\\\)\"	\
visualize leading and/or trailing HARD SPACEs.
   \"\\t\\\\(\\xA0+\\\\)\\t\"		\
visualize only HARD SPACEs between TABs.

NOTE: Enclose always by \\\\( and \\\\) the elements to highlight.
      Use exactly one pair of enclosing \\\\( and \\\\).

Used when `whitespace-style' includes `spaces'.</span>"
  :type '(regexp :tag "<span class="quote">HARD SPACE Chars</span>")
  :group 'whitespace)


(defcustom whitespace-space-regexp "<span class="quote">\\( +\\)</span>"
  "<span class="quote">*Specify SPACE characters regexp.

If you're using `mule' package, there may be other characters
besides \" \" that should be considered SPACE.

Here are some examples:

   \"\\\\(^ +\\\\)\"		visualize only leading SPACEs.
   \"\\\\( +$\\\\)\"		visualize only trailing SPACEs.
   \"\\\\(^ +\\\\| +$\\\\)\"	\
visualize leading and/or trailing SPACEs.
   \"\\t\\\\( +\\\\)\\t\"	visualize only SPACEs between TABs.

NOTE: Enclose always by \\\\( and \\\\) the elements to highlight.
      Use exactly one pair of enclosing \\\\( and \\\\).

Used when `whitespace-style' includes `spaces'.</span>"
  :type '(regexp :tag "<span class="quote">SPACE Chars</span>")
  :group 'whitespace)


(defcustom whitespace-tab-regexp "<span class="quote">\\(\t+\\)</span>"
  "<span class="quote">*Specify TAB characters regexp.

If you're using `mule' package, there may be other characters
besides \"\\t\" that should be considered TAB.

Here are some examples:

   \"\\\\(^\\t+\\\\)\"		visualize only leading TABs.
   \"\\\\(\\t+$\\\\)\"		visualize only trailing TABs.
   \"\\\\(^\\t+\\\\|\\t+$\\\\)\"	\
visualize leading and/or trailing TABs.
   \" \\\\(\\t+\\\\) \"	visualize only TABs between SPACEs.

NOTE: Enclose always by \\\\( and \\\\) the elements to highlight.
      Use exactly one pair of enclosing \\\\( and \\\\).

Used when `whitespace-style' includes `tabs'.</span>"
  :type '(regexp :tag "<span class="quote">TAB Chars</span>")
  :group 'whitespace)


(defcustom whitespace-trailing-regexp
  "<span class="quote">\\(\\(\t\\| \\|\xA0\\|\x8A0\\|\x920\\|\xE20\\|\xF20\\)+\\)$</span>"
  "<span class="quote">*Specify trailing characters regexp.

If you're using `mule' package, there may be other characters besides:

   \" \"  \"\\t\"  \"\\xA0\"  \"\\x8A0\"  \"\\x920\"  \"\\xE20\"  \
\</span>"\\xF20\"<span class="quote">

that should be considered blank.

NOTE: Enclose always by \"\\\\(\" and \"\\\\)$\" the elements to highlight.
      Use exactly one pair of enclosing elements above.

Used when `whitespace-style' includes `trailing'.</span>"
  :type '(regexp :tag "<span class="quote">Trailing Chars</span>")
  :group 'whitespace)


(defcustom whitespace-space-before-tab-regexp "<span class="quote">\\( +\\)\\(\t+\\)</span>"
  "<span class="quote">*Specify SPACEs before TAB regexp.

If you're using `mule' package, there may be other characters besides:

   \" \"  \"\\t\"  \"\\xA0\"  \"\\x8A0\"  \"\\x920\"  \"\\xE20\"  \
\</span>"\\xF20\"<span class="quote">

that should be considered blank.

Used when `whitespace-style' includes `space-before-tab',
`space-before-tab::tab' or  `space-before-tab::space'.</span>"
  :type '(regexp :tag "<span class="quote">SPACEs Before TAB</span>")
  :group 'whitespace)


(defcustom whitespace-indentation-regexp
  '("<span class="quote">^\t*\\(\\( \\{%d\\}\\)+\\)[^\n\t]</span>"
    . "<span class="quote">^ *\\(\t+\\)[^\n]</span>")
  "<span class="quote">*Specify regexp for 8 or more SPACEs at beginning of line.

It is a cons where the cons car is used for SPACEs visualization
and the cons cdr is used for TABs visualization.

If you're using `mule' package, there may be other characters besides:

   \" \"  \"\\t\"  \"\\xA0\"  \"\\x8A0\"  \"\\x920\"  \"\\xE20\"  \
\</span>"\\xF20\"<span class="quote">

that should be considered blank.

Used when `whitespace-style' includes `indentation',
`indentation::tab' or  `indentation::space'.</span>"
  :type '(cons (regexp :tag "<span class="quote">Indentation SPACEs</span>")
	       (regexp :tag "<span class="quote">Indentation TABs</span>"))
  :group 'whitespace)


(defcustom whitespace-empty-at-bob-regexp "<span class="quote">\\`\\(\\([ \t]*\n\\)+\\)</span>"
  "<span class="quote">*Specify regexp for empty lines at beginning of buffer.

If you're using `mule' package, there may be other characters besides:

   \" \"  \"\\t\"  \"\\xA0\"  \"\\x8A0\"  \"\\x920\"  \"\\xE20\"  \
\</span>"\\xF20\"<span class="quote">

that should be considered blank.

Used when `whitespace-style' includes `empty'.</span>"
  :type '(regexp :tag "<span class="quote">Empty Lines At Beginning Of Buffer</span>")
  :group 'whitespace)


(defcustom whitespace-empty-at-eob-regexp "<span class="quote">^\\([ \t\n]+\\)\\'</span>"
  "<span class="quote">*Specify regexp for empty lines at end of buffer.

If you're using `mule' package, there may be other characters besides:

   \" \"  \"\\t\"  \"\\xA0\"  \"\\x8A0\"  \"\\x920\"  \"\\xE20\"  \
\</span>"\\xF20\"<span class="quote">

that should be considered blank.

Used when `whitespace-style' includes `empty'.</span>"
  :type '(regexp :tag "<span class="quote">Empty Lines At End Of Buffer</span>")
  :group 'whitespace)


(defcustom whitespace-space-after-tab-regexp
  '("<span class="quote">\t+\\(\\( \\{%d\\}\\)+\\)</span>"
    . "<span class="quote">\\(\t+\\) +</span>")
  "<span class="quote">*Specify regexp for 8 or more SPACEs after TAB.

It is a cons where the cons car is used for SPACEs visualization
and the cons cdr is used for TABs visualization.

If you're using `mule' package, there may be other characters besides:

   \" \"  \"\\t\"  \"\\xA0\"  \"\\x8A0\"  \"\\x920\"  \"\\xE20\"  \
\</span>"\\xF20\"<span class="quote">

that should be considered blank.

Used when `whitespace-style' includes `space-after-tab',
`space-after-tab::tab' or `space-after-tab::space'.</span>"
  :type '(regexp :tag "<span class="quote">SPACEs After TAB</span>")
  :group 'whitespace)


(defcustom whitespace-line-column 80
  "<span class="quote">*Specify column beyond which the line is highlighted.

Used when `whitespace-style' includes `lines' or `lines-tail'.</span>"
  :type '(integer :tag "<span class="quote">Line Length</span>")
  :group 'whitespace)


<span class="linecomment">;; Hacked from `visible-whitespace-mappings' in visws.el</span>
(defcustom whitespace-display-mappings
  (if (&gt;= emacs-major-version 23)
      <span class="linecomment">;; Emacs 23 and higher:</span>
      '(
	(space-mark   ?\     [?\xB7]       [?.]) <span class="linecomment">; space - centered dot</span>
	(space-mark   ?\xA0  [?\xA4]       [?_]) <span class="linecomment">; hard space - currency</span>
	(space-mark   ?\x8A0 [?\x8A4]      [?_]) <span class="linecomment">; hard space - currency</span>
	(space-mark   ?\x920 [?\x924]      [?_]) <span class="linecomment">; hard space - currency</span>
	(space-mark   ?\xE20 [?\xE24]      [?_]) <span class="linecomment">; hard space - currency</span>
	(space-mark   ?\xF20 [?\xF24]      [?_]) <span class="linecomment">; hard space - currency</span>
	<span class="linecomment">;; NEWLINE is displayed using the face `whitespace-newline'</span>
	(newline-mark ?\n    [?$ ?\n])	<span class="linecomment">; eol - dollar sign</span>
	<span class="linecomment">;; (newline-mark ?\n    [?\u21B5 ?\n] [?$ ?\n])	; eol - downwards arrow</span>
	<span class="linecomment">;; (newline-mark ?\n    [?\xB6 ?\n]   [?$ ?\n])	; eol - pilcrow</span>
	<span class="linecomment">;; (newline-mark ?\n    [?\x8AF ?\n]  [?$ ?\n])	; eol - overscore</span>
	<span class="linecomment">;; (newline-mark ?\n    [?\x8AC ?\n]  [?$ ?\n])	; eol - negation</span>
	<span class="linecomment">;; (newline-mark ?\n    [?\x8B0 ?\n]  [?$ ?\n])	; eol - grade</span>
	<span class="linecomment">;;</span>
	<span class="linecomment">;; WARNING: the mapping below has a problem.</span>
	<span class="linecomment">;; When a TAB occupies exactly one column, it will display the</span>
	<span class="linecomment">;; character ?\xBB at that column followed by a TAB which goes to</span>
	<span class="linecomment">;; the next TAB column.</span>
	<span class="linecomment">;; If this is a problem for you, please, comment the line below.</span>
	(tab-mark     ?\t    [?\xBB ?\t]   [?\\ ?\t]) <span class="linecomment">; tab - left quote mark</span>
	)
    <span class="linecomment">;; Emacs 21 and 22:</span>
    <span class="linecomment">;; Due to limitations of glyph representation, the char code can not</span>
    <span class="linecomment">;; be above ?\x1FFFF.  Probably, this will be fixed after Emacs</span>
    <span class="linecomment">;; unicode merging.</span>
    '(
      (space-mark   ?\     [?\xB7]       [?.]) <span class="linecomment">; space - centered dot</span>
      (space-mark   ?\xA0  [?\xA4]       [?_]) <span class="linecomment">; hard space - currency</span>
      (space-mark   ?\x8A0 [?\x8A4]      [?_]) <span class="linecomment">; hard space - currency</span>
      (space-mark   ?\x920 [?\x924]      [?_]) <span class="linecomment">; hard space - currency</span>
      (space-mark   ?\xE20 [?\xE24]      [?_]) <span class="linecomment">; hard space - currency</span>
      (space-mark   ?\xF20 [?\xF24]      [?_]) <span class="linecomment">; hard space - currency</span>
      <span class="linecomment">;; NEWLINE is displayed using the face `whitespace-newline'</span>
      (newline-mark ?\n    [?$ ?\n])	<span class="linecomment">; eol - dollar sign</span>
      <span class="linecomment">;; (newline-mark ?\n    [?\u21B5 ?\n] [?$ ?\n])	; eol - downwards arrow</span>
      <span class="linecomment">;; (newline-mark ?\n    [?\xB6 ?\n]   [?$ ?\n])	; eol - pilcrow</span>
      <span class="linecomment">;; (newline-mark ?\n    [?\x8AF ?\n]  [?$ ?\n])	; eol - overscore</span>
      <span class="linecomment">;; (newline-mark ?\n    [?\x8AC ?\n]  [?$ ?\n])	; eol - negation</span>
      <span class="linecomment">;; (newline-mark ?\n    [?\x8B0 ?\n]  [?$ ?\n])	; eol - grade</span>
      <span class="linecomment">;;</span>
      <span class="linecomment">;; WARNING: the mapping below has a problem.</span>
      <span class="linecomment">;; When a TAB occupies exactly one column, it will display the</span>
      <span class="linecomment">;; character ?\xBB at that column followed by a TAB which goes to</span>
      <span class="linecomment">;; the next TAB column.</span>
      <span class="linecomment">;; If this is a problem for you, please, comment the line below.</span>
      (tab-mark     ?\t    [?\xBB ?\t]   [?\\ ?\t]) <span class="linecomment">; tab - left quote mark</span>
      ))
  "<span class="quote">*Specify an alist of mappings for displaying characters.

Each element has the following form:

   (KIND CHAR VECTOR...)

Where:

KIND	is the kind of character.
	It can be one of the following symbols:

	tab-mark	for TAB character

	space-mark	for SPACE or HARD SPACE character

	newline-mark	for NEWLINE character

CHAR	is the character to be mapped.

VECTOR	is a vector of characters to be displayed in place of CHAR.
	The first display vector that can be displayed is used;
	if no display vector for a mapping can be displayed, then
	that character is displayed unmodified.

The NEWLINE character is displayed using the face given by
`whitespace-newline' variable.

Used when `whitespace-style' includes `tab-mark', `space-mark' or
`newline-mark'.</span>"
  :type '(repeat
	  (list :tag "<span class="quote">Character Mapping</span>"
		(choice :tag "<span class="quote">Char Kind</span>"
			(const :tag "<span class="quote">Tab</span>" tab-mark)
			(const :tag "<span class="quote">Space</span>" space-mark)
			(const :tag "<span class="quote">Newline</span>" newline-mark))
		(character :tag "<span class="quote">Char</span>")
		(repeat :inline t :tag "<span class="quote">Vector List</span>"
			(vector :tag "<span class="quote"></span>"
				(repeat :inline t
					:tag "<span class="quote">Vector Characters</span>"
					(character :tag "<span class="quote">Char</span>"))))))
  :group 'whitespace)


(defcustom whitespace-global-modes t
  "<span class="quote">*Modes for which global `whitespace-mode' is automagically turned on.

Global `whitespace-mode' is controlled by the command
`global-whitespace-mode'.

If nil, means no modes have `whitespace-mode' automatically
turned on.

If t, all modes that support `whitespace-mode' have it
automatically turned on.

Else it should be a list of `major-mode' symbol names for which
`whitespace-mode' should be automatically turned on.  The sense
of the list is negated if it begins with `not'.  For example:

   (c-mode c++-mode)

means that `whitespace-mode' is turned on for buffers in C and
C++ modes only.</span>"
  :type '(choice :tag "<span class="quote">Global Modes</span>"
		 (const :tag "<span class="quote">None</span>" nil)
		 (const :tag "<span class="quote">All</span>" t)
		 (set :menu-tag "<span class="quote">Mode Specific</span>" :tag "<span class="quote">Modes</span>"
		      :value (not)
		      (const :tag "<span class="quote">Except</span>" not)
		      (repeat :inline t
			      (symbol :tag "<span class="quote">Mode</span>"))))
  :group 'whitespace)


(defcustom whitespace-action nil
  "<span class="quote">*Specify which action is taken when a buffer is visited or written.

It's a list containing some or all of the following values:

   nil			no action is taken.

   cleanup		cleanup any bogus whitespace always when local
			whitespace is turned on.
			See `whitespace-cleanup' and
			`whitespace-cleanup-region'.

   report-on-bogus	report if there is any bogus whitespace always
			when local whitespace is turned on.

   auto-cleanup		cleanup any bogus whitespace when buffer is
			written.
			See `whitespace-cleanup' and
			`whitespace-cleanup-region'.

   abort-on-bogus	abort if there is any bogus whitespace and the
			buffer is written.

   warn-if-read-only	give a warning if `cleanup' or `auto-cleanup'
			is included in `whitespace-action' and the
			buffer is read-only.

Any other value is treated as nil.</span>"
  :type '(choice :tag "<span class="quote">Actions</span>"
		 (const :tag "<span class="quote">None</span>" nil)
		 (repeat :tag "<span class="quote">Action List</span>"
		  (choice :tag "<span class="quote">Action</span>"
			  (const :tag "<span class="quote">Cleanup When On</span>" cleanup)
			  (const :tag "<span class="quote">Report On Bogus</span>" report-on-bogus)
			  (const :tag "<span class="quote">Auto Cleanup</span>" auto-cleanup)
			  (const :tag "<span class="quote">Abort On Bogus</span>" abort-on-bogus)
			  (const :tag "<span class="quote">Warn If Read-Only</span>" warn-if-read-only))))
  :group 'whitespace)

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; User commands - Local mode</span>


<span class="linecomment">;;;###autoload</span>
(define-minor-mode whitespace-mode
  "<span class="quote">Toggle whitespace minor mode visualization (\"ws\" on modeline).

If ARG is null, toggle whitespace visualization.
If ARG is a number greater than zero, turn on visualization;
otherwise, turn off visualization.
Only useful with a windowing system.

See also `whitespace-style', `whitespace-newline' and
`whitespace-display-mappings'.</span>"
  :lighter    "<span class="quote"> ws</span>"
  :init-value nil
  :global     nil
  :group      'whitespace
  (cond
   (noninteractive			<span class="linecomment">; running a batch job</span>
    (setq whitespace-mode nil))
   (whitespace-mode			<span class="linecomment">; whitespace-mode on</span>
    (whitespace-turn-on)
    (whitespace-action-when-on))
   (t					<span class="linecomment">; whitespace-mode off</span>
    (whitespace-turn-off))))


<span class="linecomment">;;;###autoload</span>
(define-minor-mode whitespace-newline-mode
  "<span class="quote">Toggle NEWLINE minor mode visualization (\"nl\" on modeline).

If ARG is null, toggle NEWLINE visualization.
If ARG is a number greater than zero, turn on visualization;
otherwise, turn off visualization.
Only useful with a windowing system.

Use `whitespace-newline-mode' only for NEWLINE visualization
exclusively.  For other visualizations, including NEWLINE
visualization together with (HARD) SPACEs and/or TABs, please,
use `whitespace-mode'.

See also `whitespace-newline' and `whitespace-display-mappings'.</span>"
  :lighter    "<span class="quote"> nl</span>"
  :init-value nil
  :global     nil
  :group      'whitespace
  (let ((whitespace-style '(newline-mark newline)))
    (whitespace-mode whitespace-newline-mode)
    <span class="linecomment">;; sync states (running a batch job)</span>
    (setq whitespace-newline-mode whitespace-mode)))

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; User commands - Global mode</span>


<span class="linecomment">;;;###autoload</span>
(define-minor-mode global-whitespace-mode
  "<span class="quote">Toggle whitespace global minor mode visualization (\"WS\" on modeline).

If ARG is null, toggle whitespace visualization.
If ARG is a number greater than zero, turn on visualization;
otherwise, turn off visualization.
Only useful with a windowing system.

See also `whitespace-style', `whitespace-newline' and
`whitespace-display-mappings'.</span>"
  :lighter    "<span class="quote"> WS</span>"
  :init-value nil
  :global     t
  :group      'whitespace
  (cond
   (noninteractive			<span class="linecomment">; running a batch job</span>
    (setq global-whitespace-mode nil))
   (global-whitespace-mode		<span class="linecomment">; global-whitespace-mode on</span>
    (save-excursion
      (add-hook (if (boundp 'find-file-hook)
		    'find-file-hook
		  'find-file-hooks)
		'whitespace-turn-on-if-enabled)
      (dolist (buffer (buffer-list))	<span class="linecomment">; adjust all local mode</span>
	(set-buffer buffer)
	(unless whitespace-mode
	  (whitespace-turn-on-if-enabled)))))
   (t					<span class="linecomment">; global-whitespace-mode off</span>
    (save-excursion
      (remove-hook (if (boundp 'find-file-hook)
		       'find-file-hook
		     'find-file-hooks)
		   'whitespace-turn-on-if-enabled)
      (dolist (buffer (buffer-list))	<span class="linecomment">; adjust all local mode</span>
	(set-buffer buffer)
	(unless whitespace-mode
	  (whitespace-turn-off)))))))


(defun whitespace-turn-on-if-enabled ()
  (when (cond
	 ((eq whitespace-global-modes t))
	 ((listp whitespace-global-modes)
	  (if (eq (car-safe whitespace-global-modes) 'not)
	      (not (memq major-mode (cdr whitespace-global-modes)))
	    (memq major-mode whitespace-global-modes)))
	 (t nil))
    (let (inhibit-quit)
      <span class="linecomment">;; Don't turn on whitespace mode if...</span>
      (or
       <span class="linecomment">;; ...we don't have a display (we're running a batch job)</span>
       noninteractive
       <span class="linecomment">;; ...or if the buffer is invisible (name starts with a space)</span>
       (eq (aref (buffer-name) 0) ?\ )
       <span class="linecomment">;; ...or if the buffer is temporary (name starts with *)</span>
       (and (eq (aref (buffer-name) 0) ?*)
	    <span class="linecomment">;; except the scratch buffer.</span>
	    (not (string= (buffer-name) "<span class="quote">*scratch*</span>")))
       <span class="linecomment">;; Otherwise, turn on whitespace mode.</span>
       (whitespace-turn-on)))))


<span class="linecomment">;;;###autoload</span>
(define-minor-mode global-whitespace-newline-mode
  "<span class="quote">Toggle NEWLINE global minor mode visualization (\"NL\" on modeline).

If ARG is null, toggle NEWLINE visualization.
If ARG is a number greater than zero, turn on visualization;
otherwise, turn off visualization.
Only useful with a windowing system.

Use `global-whitespace-newline-mode' only for NEWLINE
visualization exclusively.  For other visualizations, including
NEWLINE visualization together with (HARD) SPACEs and/or TABs,
please, use `global-whitespace-mode'.

See also `whitespace-newline' and `whitespace-display-mappings'.</span>"
  :lighter    "<span class="quote"> NL</span>"
  :init-value nil
  :global     t
  :group      'whitespace
  (let ((whitespace-style '(newline-mark newline)))
    (global-whitespace-mode global-whitespace-newline-mode)
    <span class="linecomment">;; sync states (running a batch job)</span>
    (setq global-whitespace-newline-mode global-whitespace-mode)))

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; User commands - Toggle</span>


(defconst whitespace-style-value-list
  '(tabs
    spaces
    trailing
    lines
    lines-tail
    newline
    empty
    indentation
    indentation::tab
    indentation::space
    space-after-tab
    space-after-tab::tab
    space-after-tab::space
    space-before-tab
    space-before-tab::tab
    space-before-tab::space
    help-newline       <span class="linecomment">; value used by `whitespace-insert-option-mark'</span>
    tab-mark
    space-mark
    newline-mark
    )
  "<span class="quote">List of valid `whitespace-style' values.</span>")


(defconst whitespace-toggle-option-alist
  '((?t    . tabs)
    (?s    . spaces)
    (?r    . trailing)
    (?l    . lines)
    (?L    . lines-tail)
    (?n    . newline)
    (?e    . empty)
    (?\C-i . indentation)
    (?I    . indentation::tab)
    (?i    . indentation::space)
    (?\C-a . space-after-tab)
    (?A    . space-after-tab::tab)
    (?a    . space-after-tab::space)
    (?\C-b . space-before-tab)
    (?B    . space-before-tab::tab)
    (?b    . space-before-tab::space)
    (?T    . tab-mark)
    (?S    . space-mark)
    (?N    . newline-mark)
    (?x    . whitespace-style)
    )
  "<span class="quote">Alist of toggle options.

Each element has the form:

   (CHAR . SYMBOL)

Where:

CHAR	is a char which the user will have to type.

SYMBOL	is a valid symbol associated with CHAR.
	See `whitespace-style-value-list'.</span>")


(defvar whitespace-active-style nil
  "<span class="quote">Used to save locally `whitespace-style' value.</span>")

(defvar whitespace-indent-tabs-mode indent-tabs-mode
  "<span class="quote">Used to save locally `indent-tabs-mode' value.</span>")

(defvar whitespace-tab-width tab-width
  "<span class="quote">Used to save locally `tab-width' value.</span>")


<span class="linecomment">;;;###autoload</span>
(defun whitespace-toggle-options (arg)
  "<span class="quote">Toggle local `whitespace-mode' options.

If local whitespace-mode is off, toggle the option given by ARG
and turn on local whitespace-mode.

If local whitespace-mode is on, toggle the option given by ARG
and restart local whitespace-mode.

Interactively, it reads one of the following chars:

  CHAR	MEANING
  (VIA FACES)
   t	toggle TAB visualization
   s	toggle SPACE and HARD SPACE visualization
   r	toggle trailing blanks visualization
   l	toggle \"long lines\" visualization
   L	toggle \"long lines\" tail visualization
   n	toggle NEWLINE visualization
   e	toggle empty line at bob and/or eob visualization
   C-i	toggle indentation SPACEs visualization (via `indent-tabs-mode')
   I	toggle indentation SPACEs visualization
   i	toggle indentation TABs visualization
   C-a	toggle SPACEs after TAB visualization (via `indent-tabs-mode')
   A	toggle SPACEs after TAB: SPACEs visualization
   a	toggle SPACEs after TAB: TABs visualization
   C-b	toggle SPACEs before TAB visualization (via `indent-tabs-mode')
   B	toggle SPACEs before TAB: SPACEs visualization
   b	toggle SPACEs before TAB: TABs visualization

  (VIA DISPLAY TABLE)
   T	toggle TAB visualization
   S	toggle SPACEs before TAB visualization
   N	toggle NEWLINE visualization

   x	restore `whitespace-style' value
   ?	display brief help

Non-interactively, ARG should be a symbol or a list of symbols.
The valid symbols are:

   tabs			toggle TAB visualization
   spaces		toggle SPACE and HARD SPACE visualization
   trailing		toggle trailing blanks visualization
   lines		toggle \"long lines\" visualization
   lines-tail		toggle \"long lines\" tail visualization
   newline		toggle NEWLINE visualization
   empty		toggle empty line at bob and/or eob visualization
   indentation		toggle indentation SPACEs visualization
   indentation::tab	toggle indentation SPACEs visualization
   indentation::space	toggle indentation TABs visualization
   space-after-tab		toggle SPACEs after TAB visualization
   space-after-tab::tab		toggle SPACEs after TAB: SPACEs visualization
   space-after-tab::space	toggle SPACEs after TAB: TABs visualization
   space-before-tab		toggle SPACEs before TAB visualization
   space-before-tab::tab	toggle SPACEs before TAB: SPACEs visualization
   space-before-tab::space	toggle SPACEs before TAB: TABs visualization

   tab-mark		toggle TAB visualization
   space-mark		toggle SPACEs before TAB visualization
   newline-mark		toggle NEWLINE visualization

   whitespace-style	restore `whitespace-style' value

Only useful with a windowing system.

See `whitespace-style' and `indent-tabs-mode' for documentation.</span>"
  (interactive (whitespace-interactive-char t))
  (let ((whitespace-style
	 (whitespace-toggle-list t arg whitespace-active-style)))
    (whitespace-mode 0)
    (whitespace-mode 1)))


(defvar whitespace-toggle-style nil
  "<span class="quote">Used to toggle the global `whitespace-style' value.</span>")


<span class="linecomment">;;;###autoload</span>
(defun global-whitespace-toggle-options (arg)
  "<span class="quote">Toggle global `whitespace-mode' options.

If global whitespace-mode is off, toggle the option given by ARG
and turn on global whitespace-mode.

If global whitespace-mode is on, toggle the option given by ARG
and restart global whitespace-mode.

Interactively, it accepts one of the following chars:

  CHAR	MEANING
  (VIA FACES)
   t	toggle TAB visualization
   s	toggle SPACE and HARD SPACE visualization
   r	toggle trailing blanks visualization
   l	toggle \"long lines\" visualization
   L	toggle \"long lines\" tail visualization
   n	toggle NEWLINE visualization
   e	toggle empty line at bob and/or eob visualization
   C-i	toggle indentation SPACEs visualization (via `indent-tabs-mode')
   I	toggle indentation SPACEs visualization
   i	toggle indentation TABs visualization
   C-a	toggle SPACEs after TAB visualization (via `indent-tabs-mode')
   A	toggle SPACEs after TAB: SPACEs visualization
   a	toggle SPACEs after TAB: TABs visualization
   C-b	toggle SPACEs before TAB visualization (via `indent-tabs-mode')
   B	toggle SPACEs before TAB: SPACEs visualization
   b	toggle SPACEs before TAB: TABs visualization

  (VIA DISPLAY TABLE)
   T	toggle TAB visualization
   S	toggle SPACEs before TAB visualization
   N	toggle NEWLINE visualization

   x	restore `whitespace-style' value
   ?	display brief help

Non-interactively, ARG should be a symbol or a list of symbols.
The valid symbols are:

   tabs			toggle TAB visualization
   spaces		toggle SPACE and HARD SPACE visualization
   trailing		toggle trailing blanks visualization
   lines		toggle \"long lines\" visualization
   lines-tail		toggle \"long lines\" tail visualization
   newline		toggle NEWLINE visualization
   empty		toggle empty line at bob and/or eob visualization
   indentation		toggle indentation SPACEs visualization
   indentation::tab	toggle indentation SPACEs visualization
   indentation::space	toggle indentation TABs visualization
   space-after-tab		toggle SPACEs after TAB visualization
   space-after-tab::tab		toggle SPACEs after TAB: SPACEs visualization
   space-after-tab::space	toggle SPACEs after TAB: TABs visualization
   space-before-tab		toggle SPACEs before TAB visualization
   space-before-tab::tab	toggle SPACEs before TAB: SPACEs visualization
   space-before-tab::space	toggle SPACEs before TAB: TABs visualization

   tab-mark		toggle TAB visualization
   space-mark		toggle SPACEs before TAB visualization
   newline-mark		toggle NEWLINE visualization

   whitespace-style	restore `whitespace-style' value

Only useful with a windowing system.

See `whitespace-style' and `indent-tabs-mode' for documentation.</span>"
  (interactive (whitespace-interactive-char nil))
  (let ((whitespace-style
	 (whitespace-toggle-list nil arg whitespace-toggle-style)))
    (setq whitespace-toggle-style whitespace-style)
    (global-whitespace-mode 0)
    (global-whitespace-mode 1)))

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; User commands - Cleanup</span>


<span class="linecomment">;;;###autoload</span>
(defun whitespace-cleanup ()
  "<span class="quote">Cleanup some blank problems in all buffer or at region.

It usually applies to the whole buffer, but in transient mark
mode when the mark is active, it applies to the region.  It also
applies to the region when it is not in transient mark mode, the
mark is active and \\[universal-argument] was pressed just before
calling `whitespace-cleanup' interactively.

See also `whitespace-cleanup-region'.

The problems cleaned up are:

1. empty lines at beginning of buffer.
2. empty lines at end of buffer.
   If `whitespace-style' includes the value `empty', remove all
   empty lines at beginning and/or end of buffer.

3. 8 or more SPACEs at beginning of line.
   If `whitespace-style' includes the value `indentation':
   replace 8 or more SPACEs at beginning of line by TABs, if
   `indent-tabs-mode' is non-nil; otherwise, replace TABs by
   SPACEs.
   If `whitespace-style' includes the value `indentation::tab',
   replace 8 or more SPACEs at beginning of line by TABs.
   If `whitespace-style' includes the value `indentation::space',
   replace TABs by SPACEs.

4. SPACEs before TAB.
   If `whitespace-style' includes the value `space-before-tab':
   replace SPACEs by TABs, if `indent-tabs-mode' is non-nil;
   otherwise, replace TABs by SPACEs.
   If `whitespace-style' includes the value
   `space-before-tab::tab', replace SPACEs by TABs.
   If `whitespace-style' includes the value
   `space-before-tab::space', replace TABs by SPACEs.

5. SPACEs or TABs at end of line.
   If `whitespace-style' includes the value `trailing', remove
   all SPACEs or TABs at end of line.

6. 8 or more SPACEs after TAB.
   If `whitespace-style' includes the value `space-after-tab':
   replace SPACEs by TABs, if `indent-tabs-mode' is non-nil;
   otherwise, replace TABs by SPACEs.
   If `whitespace-style' includes the value
   `space-after-tab::tab', replace SPACEs by TABs.
   If `whitespace-style' includes the value
   `space-after-tab::space', replace TABs by SPACEs.

See `whitespace-style', `indent-tabs-mode' and `tab-width' for
documentation.</span>"
  (interactive "<span class="quote">@</span>")
  (cond
   <span class="linecomment">;; read-only buffer</span>
   (buffer-read-only
    (whitespace-warn-read-only "<span class="quote">cleanup</span>"))
   <span class="linecomment">;; region active</span>
   ((and (or transient-mark-mode
	     current-prefix-arg)
	 mark-active)
    <span class="linecomment">;; PROBLEMs 1 and 2 are not handled in region</span>
    <span class="linecomment">;; PROBLEM 3: 8 or more SPACEs at bol</span>
    <span class="linecomment">;; PROBLEM 4: SPACEs before TAB</span>
    <span class="linecomment">;; PROBLEM 5: SPACEs or TABs at eol</span>
    <span class="linecomment">;; PROBLEM 6: 8 or more SPACEs after TAB</span>
    (whitespace-cleanup-region (region-beginning) (region-end)))
   <span class="linecomment">;; whole buffer</span>
   (t
    (save-excursion
      (save-match-data
	<span class="linecomment">;; PROBLEM 1: empty lines at bob</span>
	<span class="linecomment">;; PROBLEM 2: empty lines at eob</span>
	<span class="linecomment">;; ACTION: remove all empty lines at bob and/or eob</span>
	(when (memq 'empty whitespace-style)
	  (let (overwrite-mode)		<span class="linecomment">; enforce no overwrite</span>
	    (goto-char (point-min))
	    (when (re-search-forward
		   whitespace-empty-at-bob-regexp nil t)
	      (delete-region (match-beginning 1) (match-end 1)))
	    (when (re-search-forward
		   whitespace-empty-at-eob-regexp nil t)
	      (delete-region (match-beginning 1) (match-end 1)))))))
    <span class="linecomment">;; PROBLEM 3: 8 or more SPACEs at bol</span>
    <span class="linecomment">;; PROBLEM 4: SPACEs before TAB</span>
    <span class="linecomment">;; PROBLEM 5: SPACEs or TABs at eol</span>
    <span class="linecomment">;; PROBLEM 6: 8 or more SPACEs after TAB</span>
    (whitespace-cleanup-region (point-min) (point-max)))))


<span class="linecomment">;;;###autoload</span>
(defun whitespace-cleanup-region (start end)
  "<span class="quote">Cleanup some blank problems at region.

The problems cleaned up are:

1. 8 or more SPACEs at beginning of line.
   If `whitespace-style' includes the value `indentation':
   replace 8 or more SPACEs at beginning of line by TABs, if
   `indent-tabs-mode' is non-nil; otherwise, replace TABs by
   SPACEs.
   If `whitespace-style' includes the value `indentation::tab',
   replace 8 or more SPACEs at beginning of line by TABs.
   If `whitespace-style' includes the value `indentation::space',
   replace TABs by SPACEs.

2. SPACEs before TAB.
   If `whitespace-style' includes the value `space-before-tab':
   replace SPACEs by TABs, if `indent-tabs-mode' is non-nil;
   otherwise, replace TABs by SPACEs.
   If `whitespace-style' includes the value
   `space-before-tab::tab', replace SPACEs by TABs.
   If `whitespace-style' includes the value
   `space-before-tab::space', replace TABs by SPACEs.

3. SPACEs or TABs at end of line.
   If `whitespace-style' includes the value `trailing', remove
   all SPACEs or TABs at end of line.

4. 8 or more SPACEs after TAB.
   If `whitespace-style' includes the value `space-after-tab':
   replace SPACEs by TABs, if `indent-tabs-mode' is non-nil;
   otherwise, replace TABs by SPACEs.
   If `whitespace-style' includes the value
   `space-after-tab::tab', replace SPACEs by TABs.
   If `whitespace-style' includes the value
   `space-after-tab::space', replace TABs by SPACEs.

See `whitespace-style', `indent-tabs-mode' and `tab-width' for
documentation.</span>"
  (interactive "<span class="quote">@r</span>")
  (if buffer-read-only
      <span class="linecomment">;; read-only buffer</span>
      (whitespace-warn-read-only "<span class="quote">cleanup region</span>")
    <span class="linecomment">;; non-read-only buffer</span>
    (let ((rstart           (min start end))
	  (rend             (copy-marker (max start end)))
	  (indent-tabs-mode whitespace-indent-tabs-mode)
	  (tab-width        whitespace-tab-width)
	  overwrite-mode		<span class="linecomment">; enforce no overwrite</span>
	  tmp)
      (save-excursion
	(save-match-data
	  <span class="linecomment">;; PROBLEM 1: 8 or more SPACEs at bol</span>
	  (cond
	   <span class="linecomment">;; ACTION: replace 8 or more SPACEs at bol by TABs, if</span>
	   <span class="linecomment">;; `indent-tabs-mode' is non-nil; otherwise, replace TABs</span>
	   <span class="linecomment">;; by SPACEs.</span>
	   ((memq 'indentation whitespace-style)
	    (let ((regexp (whitespace-indentation-regexp)))
	      (goto-char rstart)
	      (while (re-search-forward regexp rend t)
		(setq tmp (current-indentation))
		(goto-char (match-beginning 0))
		(delete-horizontal-space)
		(unless (eolp)
		  (indent-to tmp)))))
	   <span class="linecomment">;; ACTION: replace 8 or more SPACEs at bol by TABs.</span>
	   ((memq 'indentation::tab whitespace-style)
	    (whitespace-replace-action
	     'tabify rstart rend
	     (whitespace-indentation-regexp 'tab) 0))
	   <span class="linecomment">;; ACTION: replace TABs by SPACEs.</span>
	   ((memq 'indentation::space whitespace-style)
	    (whitespace-replace-action
	     'untabify rstart rend
	     (whitespace-indentation-regexp 'space) 0)))
	  <span class="linecomment">;; PROBLEM 3: SPACEs or TABs at eol</span>
	  <span class="linecomment">;; ACTION: remove all SPACEs or TABs at eol</span>
	  (when (memq 'trailing whitespace-style)
	    (whitespace-replace-action
	     'delete-region rstart rend
	     whitespace-trailing-regexp 1))
	  <span class="linecomment">;; PROBLEM 4: 8 or more SPACEs after TAB</span>
	  (cond
	   <span class="linecomment">;; ACTION: replace 8 or more SPACEs by TABs, if</span>
	   <span class="linecomment">;; `indent-tabs-mode' is non-nil; otherwise, replace TABs</span>
	   <span class="linecomment">;; by SPACEs.</span>
	   ((memq 'space-after-tab whitespace-style)
	    (whitespace-replace-action
	     (if whitespace-indent-tabs-mode 'tabify 'untabify)
	     rstart rend (whitespace-space-after-tab-regexp) 1))
	   <span class="linecomment">;; ACTION: replace 8 or more SPACEs by TABs.</span>
	   ((memq 'space-after-tab::tab whitespace-style)
	    (whitespace-replace-action
	     'tabify rstart rend
	     (whitespace-space-after-tab-regexp 'tab) 1))
	   <span class="linecomment">;; ACTION: replace TABs by SPACEs.</span>
	   ((memq 'space-after-tab::space whitespace-style)
	    (whitespace-replace-action
	     'untabify rstart rend
	     (whitespace-space-after-tab-regexp 'space) 1)))
	  <span class="linecomment">;; PROBLEM 2: SPACEs before TAB</span>
	  (cond
	   <span class="linecomment">;; ACTION: replace SPACEs before TAB by TABs, if</span>
	   <span class="linecomment">;; `indent-tabs-mode' is non-nil; otherwise, replace TABs</span>
	   <span class="linecomment">;; by SPACEs.</span>
	   ((memq 'space-before-tab whitespace-style)
	    (whitespace-replace-action
	     (if whitespace-indent-tabs-mode 'tabify 'untabify)
	     rstart rend whitespace-space-before-tab-regexp
	     (if whitespace-indent-tabs-mode 1 2)))
	   <span class="linecomment">;; ACTION: replace SPACEs before TAB by TABs.</span>
	   ((memq 'space-before-tab::tab whitespace-style)
	    (whitespace-replace-action
	     'tabify rstart rend
	     whitespace-space-before-tab-regexp 1))
	   <span class="linecomment">;; ACTION: replace TABs by SPACEs.</span>
	   ((memq 'space-before-tab::space whitespace-style)
	    (whitespace-replace-action
	     'untabify rstart rend
	     whitespace-space-before-tab-regexp 2)))))
      (set-marker rend nil))))		<span class="linecomment">; point marker to nowhere</span>


(defun whitespace-replace-action (action rstart rend regexp index)
  "<span class="quote">Do ACTION in the string matched by REGEXP between RSTART and REND.

INDEX is the level group matched by REGEXP and used by ACTION.

See also `tab-width'.</span>"
  (goto-char rstart)
  (while (re-search-forward regexp rend t)
    (goto-char (match-end index))
    (funcall action (match-beginning index) (match-end index))))

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; User command - report</span>


(defun whitespace-regexp (regexp &optional kind)
  "<span class="quote">Return REGEXP depending on `whitespace-indent-tabs-mode'.</span>"
  (cond
   ((or (eq kind 'tab)
	whitespace-indent-tabs-mode)
    (format (car regexp) whitespace-tab-width))
   ((or (eq kind 'space)
	(not whitespace-indent-tabs-mode))
    (cdr regexp))))


(defun whitespace-indentation-regexp (&optional kind)
  "<span class="quote">Return the indentation regexp depending on `whitespace-indent-tabs-mode'.</span>"
  (whitespace-regexp whitespace-indentation-regexp kind))


(defun whitespace-space-after-tab-regexp (&optional kind)
  "<span class="quote">Return the space-after-tab regexp depending on `whitespace-indent-tabs-mode'.</span>"
  (whitespace-regexp whitespace-space-after-tab-regexp kind))


(defconst whitespace-report-list
  (list
   (cons 'empty                   whitespace-empty-at-bob-regexp)
   (cons 'empty                   whitespace-empty-at-eob-regexp)
   (cons 'trailing                whitespace-trailing-regexp)
   (cons 'indentation             nil)
   (cons 'indentation::tab        nil)
   (cons 'indentation::space      nil)
   (cons 'space-before-tab        whitespace-space-before-tab-regexp)
   (cons 'space-before-tab::tab   whitespace-space-before-tab-regexp)
   (cons 'space-before-tab::space whitespace-space-before-tab-regexp)
   (cons 'space-after-tab         nil)
   (cons 'space-after-tab::tab    nil)
   (cons 'space-after-tab::space  nil)
   )
   "<span class="quote">List of whitespace bogus symbol and corresponding regexp.</span>")


(defconst whitespace-report-text
  '( <span class="linecomment">;; `indent-tabs-mode' has non-nil value</span>
    "<span class="quote">\
 Whitespace Report

 Current Setting                       Whitespace Problem

 empty                    []     []  empty lines at beginning of buffer
 empty                    []     []  empty lines at end of buffer
 trailing                 []     []  SPACEs or TABs at end of line
 indentation              []     []  8 or more SPACEs at beginning of line
 indentation::tab         []     []  8 or more SPACEs at beginning of line
 indentation::space       []     []  TABs at beginning of line
 space-before-tab         []     []  SPACEs before TAB
 space-before-tab::tab    []     []  SPACEs before TAB: SPACEs
 space-before-tab::space  []     []  SPACEs before TAB: TABs
 space-after-tab          []     []  8 or more SPACEs after TAB
 space-after-tab::tab     []     []  8 or more SPACEs after TAB: SPACEs
 space-after-tab::space   []     []  8 or more SPACEs after TAB: TABs

 indent-tabs-mode =
 tab-width        = \n\n</span>"
    . <span class="linecomment">;; `indent-tabs-mode' has nil value</span>
    "<span class="quote">\
 Whitespace Report

 Current Setting                       Whitespace Problem

 empty                    []     []  empty lines at beginning of buffer
 empty                    []     []  empty lines at end of buffer
 trailing                 []     []  SPACEs or TABs at end of line
 indentation              []     []  TABs at beginning of line
 indentation::tab         []     []  8 or more SPACEs at beginning of line
 indentation::space       []     []  TABs at beginning of line
 space-before-tab         []     []  SPACEs before TAB
 space-before-tab::tab    []     []  SPACEs before TAB: SPACEs
 space-before-tab::space  []     []  SPACEs before TAB: TABs
 space-after-tab          []     []  8 or more SPACEs after TAB
 space-after-tab::tab     []     []  8 or more SPACEs after TAB: SPACEs
 space-after-tab::space   []     []  8 or more SPACEs after TAB: TABs

 indent-tabs-mode =
 tab-width        = \n\n</span>")
  "<span class="quote">Text for whitespace bogus report.

It is a cons of strings, where the car part is used when
`indent-tabs-mode' is non-nil, and the cdr part is used when
`indent-tabs-mode' is nil.</span>")


(defconst whitespace-report-buffer-name "<span class="quote">*Whitespace Report*</span>"
  "<span class="quote">The buffer name for whitespace bogus report.</span>")


<span class="linecomment">;;;###autoload</span>
(defun whitespace-report (&optional force report-if-bogus)
  "<span class="quote">Report some whitespace problems in buffer.

Return nil if there is no whitespace problem; otherwise, return
non-nil.

If FORCE is non-nil or \\[universal-argument] was pressed just
before calling `whitespace-report' interactively, it forces
`whitespace-style' to have:

   empty
   trailing
   indentation
   space-before-tab
   space-after-tab

If REPORT-IF-BOGUS is non-nil, it reports only when there are any
whitespace problems in buffer.

Report if some of the following whitespace problems exist:

* If `indent-tabs-mode' is non-nil:
   empty		1. empty lines at beginning of buffer.
   empty		2. empty lines at end of buffer.
   trailing		3. SPACEs or TABs at end of line.
   indentation		4. 8 or more SPACEs at beginning of line.
   space-before-tab	5. SPACEs before TAB.
   space-after-tab	6. 8 or more SPACEs after TAB.

* If `indent-tabs-mode' is nil:
   empty		1. empty lines at beginning of buffer.
   empty		2. empty lines at end of buffer.
   trailing		3. SPACEs or TABs at end of line.
   indentation		4. TABS at beginning of line.
   space-before-tab	5. SPACEs before TAB.
   space-after-tab	6. 8 or more SPACEs after TAB.

See `whitespace-style' for documentation.
See also `whitespace-cleanup' and `whitespace-cleanup-region' for
cleaning up these problems.</span>"
  (interactive (list current-prefix-arg))
  (whitespace-report-region (point-min) (point-max)
			    force report-if-bogus))


<span class="linecomment">;;;###autoload</span>
(defun whitespace-report-region (start end &optional force report-if-bogus)
  "<span class="quote">Report some whitespace problems in a region.

Return nil if there is no whitespace problem; otherwise, return
non-nil.

If FORCE is non-nil or \\[universal-argument] was pressed just
before calling `whitespace-report-region' interactively, it
forces `whitespace-style' to have:

   empty
   indentation
   space-before-tab
   trailing
   space-after-tab

If REPORT-IF-BOGUS is non-nil, it reports only when there are any
whitespace problems in buffer.

Report if some of the following whitespace problems exist:

* If `indent-tabs-mode' is non-nil:
   empty		1. empty lines at beginning of buffer.
   empty		2. empty lines at end of buffer.
   trailing		3. SPACEs or TABs at end of line.
   indentation		4. 8 or more SPACEs at beginning of line.
   space-before-tab	5. SPACEs before TAB.
   space-after-tab	6. 8 or more SPACEs after TAB.

* If `indent-tabs-mode' is nil:
   empty		1. empty lines at beginning of buffer.
   empty		2. empty lines at end of buffer.
   trailing		3. SPACEs or TABs at end of line.
   indentation		4. TABS at beginning of line.
   space-before-tab	5. SPACEs before TAB.
   space-after-tab	6. 8 or more SPACEs after TAB.

See `whitespace-style' for documentation.
See also `whitespace-cleanup' and `whitespace-cleanup-region' for
cleaning up these problems.</span>"
  (interactive "<span class="quote">r</span>")
  (setq force (or current-prefix-arg force))
  (save-excursion
    (save-match-data
      (let* ((has-bogus nil)
	     (rstart    (min start end))
	     (rend      (max start end))
	     (bogus-list
	      (mapcar
	       #'(lambda (option)
		   (when force
		     (add-to-list 'whitespace-style (car option)))
		   (goto-char rstart)
		   (let ((regexp
			  (cond
			   ((eq (car option) 'indentation)
			    (whitespace-indentation-regexp))
			   ((eq (car option) 'indentation::tab)
			    (whitespace-indentation-regexp 'tab))
			   ((eq (car option) 'indentation::space)
			    (whitespace-indentation-regexp 'space))
			   ((eq (car option) 'space-after-tab)
			    (whitespace-space-after-tab-regexp))
			   ((eq (car option) 'space-after-tab::tab)
			    (whitespace-space-after-tab-regexp 'tab))
			   ((eq (car option) 'space-after-tab::space)
			    (whitespace-space-after-tab-regexp 'space))
			   (t
			    (cdr option)))))
		     (and (re-search-forward regexp rend t)
			  (setq has-bogus t))))
	       whitespace-report-list)))
	(when (if report-if-bogus has-bogus t)
	  (whitespace-kill-buffer whitespace-report-buffer-name)
	  <span class="linecomment">;; `whitespace-indent-tabs-mode' is local to current buffer</span>
	  <span class="linecomment">;; `whitespace-tab-width' is local to current buffer</span>
	  (let ((ws-indent-tabs-mode whitespace-indent-tabs-mode)
		(ws-tab-width whitespace-tab-width))
	    (with-current-buffer (get-buffer-create
				  whitespace-report-buffer-name)
	      (erase-buffer)
	      (insert (if ws-indent-tabs-mode
			  (car whitespace-report-text)
			(cdr whitespace-report-text)))
	      (goto-char (point-min))
	      (forward-line 3)
	      (dolist (option whitespace-report-list)
		(forward-line 1)
		(whitespace-mark-x
		 27 (memq (car option) whitespace-style))
		(whitespace-mark-x 7 (car bogus-list))
		(setq bogus-list (cdr bogus-list)))
	      (forward-line 1)
	      (whitespace-insert-value ws-indent-tabs-mode)
	      (whitespace-insert-value ws-tab-width)
	      (when has-bogus
		(goto-char (point-max))
		(insert "<span class="quote"> Type `M-x whitespace-cleanup'</span>"
			"<span class="quote"> to cleanup the buffer.\n\n</span>"
			"<span class="quote"> Type `M-x whitespace-cleanup-region'</span>"
			"<span class="quote"> to cleanup a region.\n\n</span>"))
	      (whitespace-display-window (current-buffer)))))
	has-bogus))))

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; Internal functions</span>


(defvar whitespace-font-lock-mode nil
  "<span class="quote">Used to remember whether a buffer had font lock mode on or not.</span>")

(defvar whitespace-font-lock nil
  "<span class="quote">Used to remember whether a buffer initially had font lock on or not.</span>")

(defvar whitespace-font-lock-keywords nil
  "<span class="quote">Used to save locally `font-lock-keywords' value.</span>")


(defconst whitespace-help-text
  "<span class="quote">\
 Whitespace Toggle Options

 FACES
 []  t   - toggle TAB visualization
 []  s   - toggle SPACE and HARD SPACE visualization
 []  r   - toggle trailing blanks visualization
 []  l   - toggle \"long lines\" visualization
 []  L   - toggle \"long lines\" tail visualization
 []  n   - toggle NEWLINE visualization
 []  e   - toggle empty line at bob and/or eob visualization
 []  C-i - toggle indentation SPACEs visualization (via `indent-tabs-mode')
 []  I   - toggle indentation SPACEs visualization
 []  i   - toggle indentation TABs visualization
 []  C-a - toggle SPACEs after TAB visualization (via `indent-tabs-mode')
 []  A   - toggle SPACEs after TAB: SPACEs visualization
 []  a   - toggle SPACEs after TAB: TABs visualization
 []  C-b - toggle SPACEs before TAB visualization (via `indent-tabs-mode')
 []  B   - toggle SPACEs before TAB: SPACEs visualization
 []  b   - toggle SPACEs before TAB: TABs visualization

 DISPLAY TABLE
 []  T - toggle TAB visualization
 []  S - toggle SPACE and HARD SPACE visualization
 []  N - toggle NEWLINE visualization

      x - restore `whitespace-style' value

      ? - display this text\n\n</span>"
  "<span class="quote">Text for whitespace toggle options.</span>")


(defconst whitespace-help-buffer-name "<span class="quote">*Whitespace Toggle Options*</span>"
  "<span class="quote">The buffer name for whitespace toggle options.</span>")


(defun whitespace-insert-value (value)
  "<span class="quote">Insert VALUE at column 20 of next line.</span>"
  (forward-line 1)
  (move-to-column 20 t)
  (insert (format "<span class="quote">%s</span>" value)))


(defun whitespace-mark-x (nchars condition)
  "<span class="quote">Insert the mark ('X' or ' ') after NCHARS depending on CONDITION.</span>"
  (forward-char nchars)
  (insert (if condition "<span class="quote">X</span>" "<span class="quote"> </span>")))


(defun whitespace-insert-option-mark (the-list the-value)
  "<span class="quote">Insert the option mark ('X' or ' ') in toggle options buffer.</span>"
  (goto-char (point-min))
  (forward-line 2)
  (dolist (sym  the-list)
    (if (eq sym 'help-newline)
	(forward-line 2)
      (forward-line 1)
      (whitespace-mark-x 2 (memq sym the-value)))))


(defun whitespace-help-on (style)
  "<span class="quote">Display the whitespace toggle options.</span>"
  (unless (get-buffer whitespace-help-buffer-name)
    (delete-other-windows)
    (let ((buffer (get-buffer-create whitespace-help-buffer-name)))
      (save-excursion
	(set-buffer buffer)
	(erase-buffer)
	(insert whitespace-help-text)
	(whitespace-insert-option-mark
	 whitespace-style-value-list style)
	(whitespace-display-window buffer)))))


(defun whitespace-display-window (buffer)
  "<span class="quote">Display BUFFER in a new window.</span>"
  (goto-char (point-min))
  (set-buffer-modified-p nil)
  (let ((size (- (window-height)
		 (max window-min-height
		      (1+ (count-lines (point-min)
				       (point-max)))))))
    (when (&lt;= size 0)
      (kill-buffer buffer)
      (error "<span class="quote">Frame height is too small; \
can't split window to display whitespace toggle options</span>"))
    (set-window-buffer (split-window nil size) buffer)))


(defun whitespace-kill-buffer (buffer-name)
  "<span class="quote">Kill buffer BUFFER-NAME and windows related with it.</span>"
  (let ((buffer (get-buffer buffer-name)))
    (when buffer
      (delete-windows-on buffer)
      (kill-buffer buffer))))


(defun whitespace-help-off ()
  "<span class="quote">Remove the buffer and window of the whitespace toggle options.</span>"
  (whitespace-kill-buffer whitespace-help-buffer-name))


(defun whitespace-interactive-char (local-p)
  "<span class="quote">Interactive function to read a char and return a symbol.

If LOCAL-P is non-nil, it uses a local context; otherwise, it
uses a global context.

It accepts one of the following chars:

  CHAR	MEANING
  (VIA FACES)
   t	toggle TAB visualization
   s	toggle SPACE and HARD SPACE visualization
   r	toggle trailing blanks visualization
   l	toggle \"long lines\" visualization
   L	toggle \"long lines\" tail visualization
   n	toggle NEWLINE visualization
   e	toggle empty line at bob and/or eob visualization
   C-i	toggle indentation SPACEs visualization (via `indent-tabs-mode')
   I	toggle indentation SPACEs visualization
   i	toggle indentation TABs visualization
   C-a	toggle SPACEs after TAB visualization (via `indent-tabs-mode')
   A	toggle SPACEs after TAB: SPACEs visualization
   a	toggle SPACEs after TAB: TABs visualization
   C-b	toggle SPACEs before TAB visualization (via `indent-tabs-mode')
   B	toggle SPACEs before TAB: SPACEs visualization
   b	toggle SPACEs before TAB: TABs visualization

  (VIA DISPLAY TABLE)
   T	toggle TAB visualization
   S	toggle SPACE and HARD SPACE visualization
   N	toggle NEWLINE visualization

   x	restore `whitespace-style' value
   ?	display brief help

See also `whitespace-toggle-option-alist'.</span>"
  (let* ((is-off (not (if local-p
			  whitespace-mode
			global-whitespace-mode)))
	 (style  (cond (is-off  whitespace-style) <span class="linecomment">; use default value</span>
		       (local-p whitespace-active-style)
		       (t       whitespace-toggle-style)))
	 (prompt
	  (format "<span class="quote">Whitespace Toggle %s (type ? for further options)-</span>"
		  (if local-p "<span class="quote">Local</span>" "<span class="quote">Global</span>")))
	 ch sym)
    <span class="linecomment">;; read a valid option and get the corresponding symbol</span>
    (save-window-excursion
      (condition-case data
	  (progn
	    (while
		<span class="linecomment">;; while condition</span>
		(progn
		  (setq ch (read-char prompt))
		  (not
		   (setq sym
			 (cdr
			  (assq ch whitespace-toggle-option-alist)))))
	      <span class="linecomment">;; while body</span>
	      (if (eq ch ?\?)
		  (whitespace-help-on style)
		(ding)))
	    (whitespace-help-off)
	    (message "<span class="quote"> </span>"))		<span class="linecomment">; clean echo area</span>
	<span class="linecomment">;; handler</span>
	((quit error)
	 (whitespace-help-off)
	 (error (error-message-string data)))))
    (list sym)))			<span class="linecomment">; return the apropriate symbol</span>


(defun whitespace-toggle-list (local-p arg the-list)
  "<span class="quote">Toggle options in THE-LIST based on list ARG.

If LOCAL-P is non-nil, it uses a local context; otherwise, it
uses a global context.

ARG is a list of options to be toggled.

THE-LIST is a list of options.  This list will be toggled and the
resultant list will be returned.</span>"
  (unless (if local-p whitespace-mode global-whitespace-mode)
    (setq the-list whitespace-style))
  (setq the-list (copy-sequence the-list)) <span class="linecomment">; keep original list</span>
  (dolist (sym (if (listp arg) arg (list arg)))
    (cond
     <span class="linecomment">;; ignore help value</span>
     ((eq sym 'help-newline))
     <span class="linecomment">;; restore default values</span>
     ((eq sym 'whitespace-style)
      (setq the-list whitespace-style))
     <span class="linecomment">;; toggle valid values</span>
     ((memq sym whitespace-style-value-list)
      (setq the-list (if (memq sym the-list)
			 (delq sym the-list)
		       (cons sym the-list))))))
  the-list)


(defvar whitespace-display-table nil
  "<span class="quote">Used to save a local display table.</span>")

(defvar whitespace-display-table-was-local nil
  "<span class="quote">Used to remember whether a buffer initially had a local display table.</span>")


(defun whitespace-turn-on ()
  "<span class="quote">Turn on whitespace visualization.</span>"
  <span class="linecomment">;; prepare local hooks</span>
  (add-hook 'write-file-functions 'whitespace-write-file-hook nil t)
  <span class="linecomment">;; create whitespace local buffer environment</span>
  (set (make-local-variable 'whitespace-font-lock-mode) nil)
  (set (make-local-variable 'whitespace-font-lock) nil)
  (set (make-local-variable 'whitespace-font-lock-keywords) nil)
  (set (make-local-variable 'whitespace-display-table) nil)
  (set (make-local-variable 'whitespace-display-table-was-local) nil)
  (set (make-local-variable 'whitespace-active-style)
       (if (listp whitespace-style)
	   whitespace-style
	 (list whitespace-style)))
  (set (make-local-variable 'whitespace-indent-tabs-mode)
       indent-tabs-mode)
  (set (make-local-variable 'whitespace-tab-width)
       tab-width)
  <span class="linecomment">;; turn on whitespace</span>
  (when whitespace-active-style
    (whitespace-color-on)
    (whitespace-display-char-on)))


(defun whitespace-turn-off ()
  "<span class="quote">Turn off whitespace visualization.</span>"
  (remove-hook 'write-file-functions 'whitespace-write-file-hook t)
  (when whitespace-active-style
    (whitespace-color-off)
    (whitespace-display-char-off)))


(defun whitespace-style-face-p ()
  "<span class="quote">Return t if there is some visualization via face.</span>"
  (or (memq 'tabs                    whitespace-active-style)
      (memq 'spaces                  whitespace-active-style)
      (memq 'trailing                whitespace-active-style)
      (memq 'lines                   whitespace-active-style)
      (memq 'lines-tail              whitespace-active-style)
      (memq 'newline                 whitespace-active-style)
      (memq 'empty                   whitespace-active-style)
      (memq 'indentation             whitespace-active-style)
      (memq 'indentation::tab        whitespace-active-style)
      (memq 'indentation::space      whitespace-active-style)
      (memq 'space-after-tab         whitespace-active-style)
      (memq 'space-after-tab::tab    whitespace-active-style)
      (memq 'space-after-tab::space  whitespace-active-style)
      (memq 'space-before-tab        whitespace-active-style)
      (memq 'space-before-tab::tab   whitespace-active-style)
      (memq 'space-before-tab::space whitespace-active-style)))


(defun whitespace-color-on ()
  "<span class="quote">Turn on color visualization.</span>"
  (when (whitespace-style-face-p)
    (unless whitespace-font-lock
      (setq whitespace-font-lock t
	    whitespace-font-lock-keywords
	    (copy-sequence font-lock-keywords)))
    <span class="linecomment">;; turn off font lock</span>
    (set (make-local-variable 'whitespace-font-lock-mode)
	 font-lock-mode)
    (font-lock-mode 0)
    <span class="linecomment">;; add whitespace-mode color into font lock</span>
    (when (memq 'spaces whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show SPACEs</span>
	(list whitespace-space-regexp  1 whitespace-space  t)
	<span class="linecomment">;; Show HARD SPACEs</span>
	(list whitespace-hspace-regexp 1 whitespace-hspace t))
       t))
    (when (memq 'tabs whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show TABs</span>
	(list whitespace-tab-regexp 1 whitespace-tab t))
       t))
    (when (memq 'trailing whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show trailing blanks</span>
	(list whitespace-trailing-regexp 1 whitespace-trailing t))
       t))
    (when (or (memq 'lines      whitespace-active-style)
	      (memq 'lines-tail whitespace-active-style))
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show "long" lines</span>
	(list
	 (format
	  "<span class="quote">^\\([^\t\n]\\{%s\\}\\|[^\t\n]\\{0,%s\\}\t\\)\\{%d\\}%s\\(.+\\)$</span>"
	  whitespace-tab-width (1- whitespace-tab-width)
	  (/ whitespace-line-column tab-width)
	  (let ((rem (% whitespace-line-column whitespace-tab-width)))
	    (if (zerop rem)
		"<span class="quote"></span>"
	      (format "<span class="quote">.\\{%d\\}</span>" rem))))
	 (if (memq 'lines whitespace-active-style)
	     0				<span class="linecomment">; whole line</span>
	   2)				<span class="linecomment">; line tail</span>
	 whitespace-line t))
       t))
    (cond
     ((memq 'space-before-tab whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show SPACEs before TAB (indent-tabs-mode)</span>
	(list whitespace-space-before-tab-regexp
	      (if whitespace-indent-tabs-mode 1 2)
	      whitespace-space-before-tab t))
       t))
     ((memq 'space-before-tab::tab whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show SPACEs before TAB (SPACEs)</span>
	(list whitespace-space-before-tab-regexp
	      1 whitespace-space-before-tab t))
       t))
     ((memq 'space-before-tab::space whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show SPACEs before TAB (TABs)</span>
	(list whitespace-space-before-tab-regexp
	      2 whitespace-space-before-tab t))
       t)))
    (cond
     ((memq 'indentation whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show indentation SPACEs (indent-tabs-mode)</span>
	(list (whitespace-indentation-regexp)
	      1 whitespace-indentation t))
       t))
     ((memq 'indentation::tab whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show indentation SPACEs (SPACEs)</span>
	(list (whitespace-indentation-regexp 'tab)
	      1 whitespace-indentation t))
       t))
     ((memq 'indentation::space whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show indentation SPACEs (TABs)</span>
	(list (whitespace-indentation-regexp 'space)
	      1 whitespace-indentation t))
       t)))
    (when (memq 'empty whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show empty lines at beginning of buffer</span>
	(list whitespace-empty-at-bob-regexp
	      1 whitespace-empty t))
       t)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show empty lines at end of buffer</span>
	(list whitespace-empty-at-eob-regexp
	      1 whitespace-empty t))
       t))
    (cond
     ((memq 'space-after-tab whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show SPACEs after TAB (indent-tabs-mode)</span>
	(list (whitespace-space-after-tab-regexp)
	      1 whitespace-space-after-tab t))
       t))
     ((memq 'space-after-tab::tab whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show SPACEs after TAB (SPACEs)</span>
	(list (whitespace-space-after-tab-regexp 'tab)
	      1 whitespace-space-after-tab t))
       t))
     ((memq 'space-after-tab::space whitespace-active-style)
      (font-lock-add-keywords
       nil
       (list
	<span class="linecomment">;; Show SPACEs after TAB (TABs)</span>
	(list (whitespace-space-after-tab-regexp 'space)
	      1 whitespace-space-after-tab t))
       t)))
    <span class="linecomment">;; now turn on font lock and highlight blanks</span>
    (font-lock-mode 1)))


(defun whitespace-color-off ()
  "<span class="quote">Turn off color visualization.</span>"
  <span class="linecomment">;; turn off font lock</span>
  (when (whitespace-style-face-p)
    (font-lock-mode 0)
    (when whitespace-font-lock
      (setq whitespace-font-lock nil
	    font-lock-keywords   whitespace-font-lock-keywords))
    <span class="linecomment">;; restore original font lock state</span>
    (font-lock-mode whitespace-font-lock-mode)))

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; Hacked from visws.el (Miles Bader &lt;miles@gnu.org&gt;)</span>


(defun whitespace-style-mark-p ()
  "<span class="quote">Return t if there is some visualization via display table.</span>"
  (or (memq 'tab-mark     whitespace-active-style)
      (memq 'space-mark   whitespace-active-style)
      (memq 'newline-mark whitespace-active-style)))


(defalias 'whitespace-characterp
  (if (fboundp 'characterp)
      'characterp
    'char-valid-p))


(defsubst whitespace-char-valid-p (char)
  <span class="linecomment">;; This check should be improved!!!</span>
  (or (&lt; char 256)
      (whitespace-characterp char)))


(defun whitespace-display-vector-p (vec)
  "<span class="quote">Return true if every character in vector VEC can be displayed.</span>"
  (let ((i (length vec)))
    (when (&gt; i 0)
      (while (and (&gt;= (setq i (1- i)) 0)
		  (whitespace-char-valid-p (aref vec i))))
      (&lt; i 0))))


(defun whitespace-display-char-on ()
  "<span class="quote">Turn on character display mapping.</span>"
  (when (and whitespace-display-mappings
	     (whitespace-style-mark-p))
    (let (vecs vec)
      <span class="linecomment">;; Remember whether a buffer has a local display table.</span>
      (unless whitespace-display-table-was-local
	(setq whitespace-display-table-was-local t
	      whitespace-display-table
	      (copy-sequence buffer-display-table)))
      (unless buffer-display-table
	(setq buffer-display-table (make-display-table)))
      (dolist (entry whitespace-display-mappings)
	<span class="linecomment">;; check if it is to display this mark</span>
	(when (memq (car entry) whitespace-style)
	  <span class="linecomment">;; Get a displayable mapping.</span>
	  (setq vecs (cddr entry))
	  (while (and vecs
		      (not (whitespace-display-vector-p (car vecs))))
	    (setq vecs (cdr vecs)))
	  <span class="linecomment">;; Display a valid mapping.</span>
	  (when vecs
	    (setq vec (copy-sequence (car vecs)))
	    <span class="linecomment">;; NEWLINE char</span>
	    (when (and (eq (cadr entry) ?\n)
		       (memq 'newline whitespace-active-style))
	      <span class="linecomment">;; Only insert face bits on NEWLINE char mapping to avoid</span>
	      <span class="linecomment">;; obstruction of other faces like TABs and (HARD) SPACEs</span>
	      <span class="linecomment">;; faces, font-lock faces, etc.</span>
	      (dotimes (i (length vec))
		<span class="linecomment">;; Only for Emacs 21 and 22:</span>
		<span class="linecomment">;; Due to limitations of glyph representation, the char</span>
		<span class="linecomment">;; code can not be above ?\x1FFFF.  Probably, this will</span>
		<span class="linecomment">;; be fixed after Emacs unicode merging.</span>
		(or (eq (aref vec i) ?\n)
		    (and (&lt; emacs-major-version 23)
			 (&gt; (aref vec i) #x1FFFF))
		    (aset vec i
			  (make-glyph-code (aref vec i)
					   whitespace-newline)))))
	    <span class="linecomment">;; Display mapping</span>
	    (aset buffer-display-table (cadr entry) vec)))))))


(defun whitespace-display-char-off ()
  "<span class="quote">Turn off character display mapping.</span>"
  (and whitespace-display-mappings
       (whitespace-style-mark-p)
       whitespace-display-table-was-local
       (setq whitespace-display-table-was-local nil
	     buffer-display-table whitespace-display-table)))

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; Hook</span>


(defun whitespace-action-when-on ()
  "<span class="quote">Action to be taken always when local whitespace is turned on.</span>"
  (cond ((memq 'cleanup whitespace-action)
	 (whitespace-cleanup))
	((memq 'report-on-bogus whitespace-action)
	 (whitespace-report nil t))))


(defun whitespace-write-file-hook ()
  "<span class="quote">Action to be taken when buffer is written.
It should be added buffer-locally to `write-file-functions'.</span>"
  (cond ((memq 'auto-cleanup whitespace-action)
	 (whitespace-cleanup))
	((memq 'abort-on-bogus whitespace-action)
	 (when (whitespace-report nil t)
	   (error "<span class="quote">Abort write due to whitespace problems in %s</span>"
		  (buffer-name)))))
  nil)					<span class="linecomment">; continue hook processing</span>


(defun whitespace-warn-read-only (msg)
  "<span class="quote">Warn if buffer is read-only.</span>"
  (when (memq 'warn-if-read-only whitespace-action)
    (message "<span class="quote">Can't %s: %s is read-only</span>" msg (buffer-name))))

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>


(defun whitespace-unload-function ()
  "<span class="quote">Unload the whitespace library.</span>"
  (global-whitespace-mode -1)
  <span class="linecomment">;; be sure all local whitespace mode is turned off</span>
  (save-current-buffer
    (dolist (buf (buffer-list))
      (set-buffer buf)
      (whitespace-mode -1)))
  nil)					<span class="linecomment">; continue standard unloading</span>


(provide 'whitespace)


(run-hooks 'whitespace-load-hook)


<span class="linecomment">;; arch-tag: 1b1e2500-dbd4-4a26-8f7a-5a5edfd3c97e</span>
<span class="linecomment">;;; whitespace.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=whitespace.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=whitespace.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=whitespace.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=whitespace.el">Administration</a></span><span class="time"><br /> Last edited 2008-10-20 22:29 UTC by <a class="author" title="from c9522236.virtua.com.br" href="http://www.emacswiki.org/emacs/ViniciusJoseLatorre">ViniciusJoseLatorre</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=whitespace.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
