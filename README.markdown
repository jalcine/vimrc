# Vim configuration
![Pic or it didn't happen](./snapshot.png)

This repository holds my personal configuration for Vim. It has all of the
colors, core bundles, and options needed to get it kicking and roaring with
Vim.

I use [homesick][] to manage my dotfiles and what not. This repository is
set up for it. Feel free to use to your heart's content.

## Contents
This Vim setup is constantly tweaked to my comfort; taking advantage of my
left-handed nature and makes the assumption that you're using all of the
extensions provided by [Vundle][].

## Local Reading
In lieu of using this configuration across multiple machines, there's certain
things like tab stops and runtimes that I have to tweak. The following files
can be used to override the options defined in this suite of options:

  * `$HOME/.vimrc.local` - If found, sourced to override global options in Vim.
  * `$HOME/.vim/plugin/options.local.vim` - If found, sourced to override
    plugins options in Vim.

[Vundle]: https://github.com/gmarik/vundle
[homesick]: https://github.com/technicalpickles/homesick
