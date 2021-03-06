# Vim-Navigate

Vim plugin for navigating through tabs, buffers, windows, and quick fixes.

## Usage

Experienced Vim users forgo the cursor keys and use <kbd>h</kbd>, <kbd>j</kbd>,
<kbd>k</kbd>, and <kbd>l</kbd> keys to move around a file. This plugin maps the
little used cursor keys, <kbd>Home</kbd>, <kbd>End</kbd>, <kbd>PageUp</kbd>,
and <kbd>PageDown</kbd> keys to more useful functions.

This plugin defines four mapping groups:

- **Tab:** mappings to move through tabs
- **Window**: mappings to move around windows
- **Buffer**: mappings to manipulate buffers
- **Quick Fix**: mappings to traverse quick fix lists

Think of these groups like a mode within Normal model.

| Key                 | Tab                | Window         | Buffer           | Quick Fix        |
|:--------------------|:-------------------|:---------------|:-----------------|:-----------------|
| <kbd>Up</kbd>       | `:tabnew<CR>`      | `<C-W><Up>`    | `:buffer #<CR>`  | `:clist<CR>`     |
| <kbd>Down</kbd>     | `<C-W>gf`          | `<C-W><Down>`  | `:buffer`        | `:cwindow<CR>`   |
| <kbd>Left</kbd>     | `:tabprevious<CR>` | `<C-W><Left>`  | `:bprevious<CR>` | `:cprevious<CR>` |
| <kbd>Right</kbd>    | `:tabnext<CR>`     | `<C-W><Right>` | `:bnext<CR>`     | `:cnext<CR>`     |
| <kbd>PageUp</kbd>   | `:tabmove +<CR>`   | `<C-W>W`       | `<PageUp`        | `:copen<CR>`     |
| <kbd>PageDown</kbd> | `:tabmove -<CR>`   | `<C-W>w`       | `<PageDown`      | `:cbottom<CR>`   |
| <kbd>Home</kbd>     | `:tabfirst<CR>`    | `<C-W>t`       | `:bfirst<CR>`    | `:cfirst<CR>`    |
| <kbd>End</kbd>      | `:tablast<CR>`     | `<C-W>b`       | `:blast<CR>`     | `:clast<CR>`     |
| <kbd>Del</kbd>      | `:tabclose<CR>`    | `<C-W>q`       | `:bdelete<CR>`   | `:close<CR>`     |

## Installation

If you don't have a favorite method for installing Vim packages, try using
[Vim's native package
management](https://stories.abletech.nz/get-rid-of-your-vim-plugin-manager-7c8ff742f643):

```sh
mkdir --parents ~/.vim/pack/vim-navigate/start
cd ~/.vim/pack/vim-navigate/start
git clone https://github.com/andrewjstryker/vim-navigate.git
```

Otherwise, follow instructions for your Vim package manager of choice.

## `vimrc` configuration


## Contributing

Should you have questions about using this plugin or think that you have
spotted an error, please ask in the [`#vim` channel on
freenode](https://webchat.freenode.net/?channels=vim). My handle is `axsdf`.

Please file [issues on
GitHub](https://github.com/andrewjstryker/vim-navigate/issues). Pull requests
are also welcome. [Writing a good commit
message](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
will increase your chance of getting your pull accepted.

## License

Copyright © Andrew Stryker. Distributed under the same terms as Vim itself.
See `:help license`.
