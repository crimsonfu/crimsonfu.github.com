---
title: Using Vim to edit Puppet code
author: shuff
layout: default
---
Ideally, all the Puppet code you write should conform to the [style guide](http://docs.puppetlabs.com/guides/style_guide.html).  The benefits are many: it's easier for others to work with your code and for you to work with others' code, it's easier to spot mistakes, it's easier to read, and so forth.  However, writing compliant code can be laborious if you don't have a working environment set up to make it easy.

There are any number of tools that can make this task easier.  Here are some tips for setting up [Vim](http://www.vim.org) for Puppet editing.  Note: you'll need a recent version of Vim.  Use something from the 7.3 series if possible, but if not, you'll need to be using the 7.1 series or later (no joy for RHEL5 users, unfortunately).

## Basic Tips

1. Install syntax and indentation support files.

    I've been using Andrew Forgue's [puppet-vim](https://github.com/ajf/puppet-vim) plugin, but there are some others on GitHub and elsewhere that probably work comparably.  I recommend using [Pathogen](https://github.com/tpope/vim-pathogen) or [Vundle](https://github.com/gmarik/vundle) to manage Vim plugins.

    A good Puppet syntax module will provide syntax highlighting, automatic indentation, smart brace matching, and a bunch of other good features.  Use them.

2. Enable indentation management.

    Of course, you need turn on some of Vim's additional features to get full use of the plugin you just installed.  Your `.vimrc` should contain the following commands (read the built-in help to see what they do):

        set nocompatible
        filetype indent plugin on
        set expandtab
        set smarttab
        set autoindent

2. Enable brace matching.

    Put the following line in your `.vimrc`:

        runtime macros/matchit.vim

    This enables you to put your cursor on one parenthesis, or bracket, or curly brace, type `%`, and then your cursor will automatically jump to the other element of the pair.  This makes it easier to discover when you've miscounted curly braces, or forgotten to close a pair, or some such.

2. Install Tabular for block formatting.

    The [Tabular](https://github.com/godlygeek/tabular) plugin will let you easily reformat parameter blocks.  Once you've installed Tabular, create a custom mapping that matches the parameter style used in Puppet.  To do this, create a file called `~/.vim/after/plugin/tabular.vim` (run `:help Tabular` from within Vim for more information) and put the following line in it:

        :AddTabularPattern block /=>

    Now, let's say you're editing some Puppet code that looks like this:

        service {
            'nscd':
              ensure => "stopped",
              enable => false;
          }

    You want to add another parameter to this resource, perhaps a dependency on some other service, so you make the following change:

        service {
            'nscd':
              ensure => 'stopped',
              enable => false,
              require => Service['somethingelse'];
          }

    Notice, however, that now the arrows are out of alignment, because the string "require" is longer than the string "enable".  Tabular lets you easily fix this problem.  Put your cursor somewhere inside the parameter block (for example, you could put it somewhere in the string "require") and run the command `:Tabular block`.  Now your code will look like this:

        service {
            'nscd':
              ensure  => 'stopped',
              enable  => false,
              require => Service['somethingelse'];
          }

    See how all the arrows are lined up correctly?

## Supplementary Tips

1. Install Syntastic for automatic syntax checking.

    The [Syntastic](https://github.com/scrooloose/syntastic) plugin automatically runs a syntax check on your code every time you try to save it, and if your code fails the syntax check, it shows you the errors and stops you from saving broken code.  Note that in order for Syntastic's Puppet syntax checking to work, Puppet must be installed on the same system where you are running Vim!  The Puppet agent doesn't have to be running, but the command `puppet agent` must be available in your path.

    I use the following Syntastic customizations (read `:help Syntastic` for details):

        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        let g:syntastic_enable_signs=1
        let g:syntastic_quiet_warnings=1
        let g:syntastic_auto_loc_list=1

2. Install snipMate for code snippet generation.

    [snipMate](https://github.com/msanders/snipmate.vim) implements TextMate-style snippets in Vim, and the [puppet-vim](https://github.com/ajf/puppet-vim) plugin that I use provides some Puppet-specific snippets for it.  For example, I can start editing a Puppet manifest, open a new line, type `class<Tab>`, and then the following code gets generated:

        # Class:: classname
        #
        #
        class classname {
          #code...
        } # Class:: classname

