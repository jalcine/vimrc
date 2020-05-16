# NeoVim Configuration

I've been using Vim for a while and I don't see myself stopping. This repository
represents the history of changes around the configuration, styling and scripts
I use to keep my Vim setup moving nicely. On 2020-05-16, I decided to scrap it
all and start clean.

Some key points I chose to make was to investigate which options are _already_
set to sensible values in NeoVim.

## Objectives

- **Intuitive configuration**: I've been heavy into tweaking but now I'm more into
  having implicit behaviors be the norm. This means I'll be leaning into
  meta-plugins that help define project behaviors so I can keep common behaviors
  (building, testing, running, evaluating) across the languages I use.

- **Document usage**: I didn't do a good job documenting _why_ and _when_ I
   added things to my setup (or why I've avoided using things). Since I use Vim
   in a IDE-y fashion but not precisely as it is, there's always something I'd
   like to do with it while understanding _why_ it might be not be possible
   (you'd want a sharp useful blade that's good at one thing versus a swiss army
   knife that has random dull tools).

- **Detect and resolve dependencies**: One thing I do miss when I use tools like
   [GitHub's Atom][1] or [Microsoft's Visual Studio Code][2] was the ability for
   me to quickly fetch and obtain resources relating to the text I was working
   on. Having hooks for this kind of support is definitely important to me as I
   work on more languages that have embedded documentation like Rust and Elixir.

- **Deep (D)VCS support**: Regardless of the type of version control I use, I
   want the editor to allow for me to view history of changes, commit changes,
   resolve differences and more DVCS changes of that nature. I'm very
   comfortable with the command line and with core concepts of Git as well as
   some knowledge of how Bazaar works so having abstractions for either of these
   but specialized tools within them is helpful.

- **Language intelligence**: It's 2020 - auto completion is definitely something
   I can't function without; especially when I'm interfacing with foreign
   libraries or code bases I'm unfamiliar with. Thankfully, the efforts of the
   Language Server movement makes this less of a problem for NeoVim.

![Me viewing this file.](./snapshots/markdown.png)

![Doing auto-completion of code in "indieweb-elixir"](./snapshots/autocomplete.png)

[1]: https://atom.io/
[2]: https://code.visualstudio.com/
