# NeoVim Configuration

![My daily view.](./snapshot.png)

This repository contains the configuration and any other things that I use with [NeoVim][]. I try to use the
latest stable on most machines (work, virtual machines) but on my [personal laptop][1], I end up using the
development release (info below). The configuration is tweaked about bi-monthly with the following concerns in mind:

* *Relevancy*: Plug-ins used should be up-to-date and work together out of the box (or loose coupling)
* *Intuitive*: Using the editor should be more than using your system's plain text editor but a bit less than an IDE.
* *Adaptive*: Load things when you need them and only then.

I keep a list of the plugins I use in the [snapshot file][2] for reproducible installs across machines.

## Neovim Build Information

This is the information visible when I run `:version` in Neovim.
```
:version
NVIM v0.5.0-dev
Build type: RelWithDebInfo
Lua 5.1
Compilation: /usr/bin/cc -g -O2 -fdebug-prefix-map=/build/neovim-0vMcDA/neovim-0.5.0+ubuntu1+git201910172025-0785f8e-00e710e=
. -fstack-protector-strong -Wformat -Werror=format-security -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -O2 -g -DMIN_LOG_LEVEL=3 -O
g -g -Wall -Wextra -pedantic -Wno-unused-parameter -Wstrict-prototypes -std=gnu99 -Wshadow -Wconversion -Wmissing-prototypes
-Wimplicit-fallthrough -Wvla -fstack-protector-strong -fdiagnostics-color=auto -DINCLUDE_GENERATED_DECLARATIONS -D_GNU_SOURCE
 -DNVIM_MSGPACK_HAS_FLOAT32 -DNVIM_UNIBI_HAS_VAR_FROM -I/build/neovim-0vMcDA/neovim-0.5.0+ubuntu1+git201910172025-0785f8e-00e
710e/build/config -I/build/neovim-0vMcDA/neovim-0.5.0+ubuntu1+git201910172025-0785f8e-00e710e/src -I/build/neovim-0vMcDA/neov
im-0.5.0+ubuntu1+git201910172025-0785f8e-00e710e/.deps/usr/include -I/usr/include -I/build/neovim-0vMcDA/neovim-0.5.0+ubuntu1
+git201910172025-0785f8e-00e710e/build/src/nvim/auto -I/build/neovim-0vMcDA/neovim-0.5.0+ubuntu1+git201910172025-0785f8e-00e7
10e/build/include
Compiled by buildd@lgw01-amd64-024

Features: +acl +iconv +tui
See ":help feature-compile"

   system vimrc file: "$VIM/sysinit.vim"
  fall-back for $VIM: "/usr/share/nvim"

```
[neovim]: http://neovim.io/
[1]: https://jacky.wtf/gear/#laptop
[2]: ./home/.config/nvim/snapshot.vim
