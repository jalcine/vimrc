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
the Python dependencies for this repository:

```bash
$ pip install neovim requests
```
> I typically run `pip install --user neovim`.

## Support &amp; Contributions

I've noticed that people have taken a lean to use this configuration. I find
that *super dope*! The thing is, I'm not going to fix issues that you might find
while using this setup because I largely host it on Github for syndication
across the multiple machines I work on (even the ephemeral ones). If I like your
patch and it improves _my_ personal workflow as well, then I'll gladly accept
it!

[homesick]: https://github.com/technicalpickles/homesick
[laptop]: https://jacky.wtf/gear/#laptop
[neovim]: https://neovim.io
[vim-plug]: https://github.com/junegunn/vim-plug
[1]: http://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/
