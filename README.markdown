# Vim Configuration

This repository contains my setup for **[Neovim][]**. I've decided to move my
personal development environment over to Neovim after reading [Greer's post][1]
on the matter. This comes souped up with close to 80 (or more plugins) to
enhance my development experience with a very short start time (~11ms on my
[laptop][]).

Neovim, as of version 0.1.0, doesn’t use the classic `~/.nvimrc` setup. However,
because of habit, I’ve linked `~/.nvimrc` to `~/.config/nvim/init.vim`. Some
habits die hard.

## Plugin Manager

The plugins I use are fetched by [vim-plug][]. I ship this tree with a fixed
version. I also ship it with a fixed list of the plugins at the particular state
I plan to use them, at `home/.local/bin/install-vim-plugins`.

## Using This Project
This repository is set up using [homesick][]. I recommend using that to easily
clone and get these options up and running. From there, you'll need to install
the Python dependencies for Neovim:

```bash
$ pip install neovim
```
> I typically run `pip install --user neovim`.

From there, running the script `install-vim-plugins` will finalize the process
of getting a mirror image of my current environment.

----

> This was finalized 2016-03-06 23:09:04 PST.

[Vundle]: https://github.com/gmarik/vundle
[homesick]: https://github.com/technicalpickles/homesick
[laptop]: https://jacky.wtf/gear/#laptop
[neovim]: https://neovim.io
[vim-plug]: https://github.com/junegunn/vim-plug
[1]: http://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/
