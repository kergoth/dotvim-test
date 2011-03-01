Included Bundles
----------------

  - pythonfolding: python folding plugin from
    http://habamax.ru/blog/2009/05/python-folding-in-vim/ is not managed with
    github, as there's no git mirror of it yet, afaik.
  - All of the plugins I use from Peter Odding(xolox) are handled using the
    vim-scripts mirror git repositories, even though there are proper upstream
    repositories (github.com/xolox/), because the upstream repositories aren't
    laid out in a traditional vim bundle manner.
  - Non-ideal layouts in the vim-scripts mirrors, so not using braid:

    - pythoncomplete

- align: Help folks to align text, eqns, declarations, tables, etc
- bitbake: Syntax highlighting, indentation settings, new file skeleton for
  BitBake recipes and configuration files
- bufexplorer: Buffer Explorer / Browser
- c-syntax: C Syntax Extensions
- changesplugin: indicate changes of a buffer
- command-t: Fast file navigation for VIM
- conque: Conque is a Vim plugin allowing users to execute and interact with
  programs, typically a shell such as bash, inside a buffer window
- countjump: Create custom motions and text objects via repeated jumps.

  - Used by diff_movement, help_movement

- csapprox: Make gvim-only colorschemes work transparently in terminal vim
- cute-python: Unicode goodness for Python code by using vim's new “conceal”
  feature
- detectindent: Automatically detect indent (expandtab, shiftwidth, tabstop)
  settings
- diff_movement: Movement over diff hunks with ]] etc.
- fugitive: A Git wrapper so awesome, it should be illegal
- gist: vimscript for gist.github.com
- git: Vim Git runtime files
- github-colors: A gvim colorscheme based on github's syntax highlighting
- gitolite: Syntax highlight for gitolite configuration
- gitosis: gitosis-admin.conf syntax highlighting for vim
- golang: Vim syntax highlighting for Go (http://golang.org)
- gundo: Graph your Vim undo tree in style
- help_movement: Movement over Vim help sections with ]] etc.
- hilinks: A plugin which traces the highlighting linkages; ie. just what
  highlighting groups associated with the word under the cursor?
- jellyx: A delicious collision of Jellybeans and Xoria256
- largefile: Edit large files quickly
- luainspect: Semantic highlighting for Lua in Vim
- manpageview: Viewer for manpages, gnu info,  perldoc, and php
  (unix/linux/cygwin)
- markdown: Vim Markdown runtime files that WON'T leave you sterile
- matchit: extended % matching for HTML, LaTeX, and many other languages
- modeliner: Generates modeline according to the current settings.
- mw-utils: various utils such as caching interpreted contents of files or
  advanced glob like things

  - Used by the lazy fork of snipmate

- nerdcommenter: Vim plugin for intensely orgasmic commenting
- nerdtree: hax0r vim script to give you a tree explorer
- nerdtreeproject:
- pathogen: manage your runtimepath
- py2stdlib: The Python 2.x standard library documentation as a Vim help file
- py3stdlib: The Python 3.x standard library documentation as a Vim help file
- pyflakes: on the fly Python checking in Vim with PyFlakes
- pylint: compiler plugin which runs pylint against python files
- pythonfolding: python folding plugin from
  http://habamax.ru/blog/2009/05/python-folding-in-vim/
- pythonimport: automatically remove unused imports and clean up the rest
- pythoncomplete: Python Omni Completion.
  http://www.vim.org/scripts/script.php?script_id=1542
- reload: The reload.vim plug-in automatically reloads various types of Vim
  scripts as they’re being edited in Vim to give you instant feedback on the
  changes you make
- repeat: enable repeating supported plugin maps with "."
- securemodelines: Secure, user-configurable modeline support
- session: Extended session management for Vim
- shell: Improved integration between Vim and its environment
- smarttabs: Use tabs for indent, spaces for alignment
- snipmate: TextMate-style snippets for Vim
- speeddating: use CTRL-A/CTRL-X to increment dates, times, and more
- supertab: aims to provide tab completion to satisfy all your insert
  completion needs
- surround: quoting/parenthesizing made simple
- taglist: Source code browser (supports C/C++, java, perl, python, tcl, sql,
  php, etc)
- tlib: Some utility functions

  - Used by the lazy fork of snipmate

- unimpaired: Pairs of handy bracket mappings
- vis: Extended Visual Mode Commands, Substitutes, and Searches
- yankring: Maintains a history of previous yanks, changes and deletes

TODO
----

- snipmate-skeleton: rather than only going by extension, try to open a
  template for the extension, and fall back to filetype.
- Determine how to make the spell checking a bit smarter.  Specifically, I'd
  like to disable all checking in regular python strings, but have checking in
  *docstrings* and in comments.  Alternatively, don't consider "%s" a spelling
  error.
- Figure out how to deal with pylint/pyflakes interactions.  The pyflakes
  plugin sets quickfix items, and it regenerates it automatically on certain
  events, which means it blows away the pylint messages from :make.  Perhaps
  we just need a way to disable/re-enable the pyflakes autocmds.

  - Additional note: :Glog conflicts with pyflakes in quickfix usage as well.

- Disable trailing whitespace and beyond textwidth highlighting for
  conque_term buffers
- Make detectindent obey 'comments' for non-C files.
- Show the pyflakes error message in the cursor bubble

  - Note: the pyflakes error message uses the quickfix stuff.  There's a vim
    signs in the signs column, and to show the message in the cursor balloon
    when mousing over the sign.  Unfortunately, there are two issues:

    - balloon does not show up when mousing over the sign
    - have to manually run QuickfixsignsSet rather than it doing so
      automatically

- Fix bugs in the current python folding plugin

  - Fails with multi-line function definitions
  - Fails with nested function definitions

Personal Notes / Reference:
---------------------------

- Keymap / Commands:

  - Vim core:

    - :only - close all windows but the current one

    - ctrl-^: switches between active and alternate buffer in the current window
    - ctrl-w s: split
    - gt, gT: next, previous tab
    - g;, g, (normal mode): previous, next in the changelist
    - ctrl-o, ctrl-i: previous, next in the jumplist
    - f{char}, F{char} (normal mode): occurance of {char} to the left, right
    - A == $a
    - C == d$a
    - I == ctrl-i: insert text before the first non-blank in the line
    - S == ctrl-c == cc: delete line(s) and start insert

  - Vimrc:

    - <leader>ew: edit a file in the same directory as the current file
    - <leader>es: same as above, in a split
    - <leader>ev: same as above, in a vertical split
    - <leader>et: same as above, in a new tab

  - Plugins:

    - surround

      - ds (normal mode): delete surrounding characters
      - cs (normal mode), s (visual mode), ctrl-g s (insert mode):
        change/insert surrounding characters
      - S (visual mode): change/insert surrounding characters, separate lines

    - nerdcommenter

      - <leader>cs: apply 'sexy' comment to line(s)
      - <leader>c<space>: toggle commenting on line(s)
      - <leader>cc: comment block as a whole (doesnt obey space_delim)
      - <leader>ci: comment individually
      - <leader>cu: uncomment individually

    - python_import

      - <leader>i: sort and clean up a python import block.  When in normal
        mode, operates against the current paragraph.  When in visual mode,
        operates against the selected lines.

    - [modelines] <leader>im: insert modeline
    - [hilinks] <leader>hlt: show highlighting groups of mouseover

- Common indentation setups:

  - No hard tabs, 2 space indent: set sw=2 sts=2 et
  - No hard tabs, 4 space indent: set sw=4 sts=4 et
  - All hard tabs, 8 space tabstops: set ts=8 sw=8 sts=0 noet
  - Hard tabs for indentation, 4 space tabstops: set ts=4 sw=4 sts=0 noet
  - Horrendous, 4 space indent, 8 space tabstops, hard tabs:
    set ts=8 sw=4 sts=4 noet

- A 'hidden' buffer is one which has been modified, and is not loaded in a
  window.

..  vim: set et fenc=utf-8 sts=2 sw=2 :
