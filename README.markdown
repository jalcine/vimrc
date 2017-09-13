# Neovim Configuration

![My daily view.](./snapshot.png)

This repository contains my setup for **[Neovim][]** and other Vim related
projects like [Vimperator][] and [IdeaVIM][]. I've decided to move my development
environment over to Neovim after reading [Greer's post][1] on the matter. This
comes souped up with close to 80 (or more plugins) to enhance my development
experience with a very short start time (~11ms on my [laptop][]). Whenever
I make some changes, I update my [`startuptime.txt`](./startuptime.txt) file for
reference.

I'm just going to make this simple little change for the lulz.

## Plugin Manager

The plugins I use are fetched by [vim-plug][]. This repository contains a setup
script to ensure that Neovim is ready to roll with all of the expected plugins
and dependencies intact.

## Using This Project
This repository is set up using [homesick][]. I recommend using that to easily
clone and get these options up and running. From there, you'll need to install
a few dependencies for this project. Run `neovim-install-dependencies` to get
that setup. It'll add the Python virtual environments, expected Node packages,
Ruby gems, Perl packages and a Rust component.

### Support and Contributions

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
[Vimperator]: http://vimperator.org/vimperator.html
[IdeaVIM]: https://github.com/JetBrains/ideavim
[1]: http://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/
