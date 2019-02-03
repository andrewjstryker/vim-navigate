# Vim-Navigate

Vim plugin for navigating through tabs, buffers, windows, and quick fixes.

## Usage

Experienced Vim users forgo the cursor keys and use `h`, `j`, `k`, and `l` keys
to move around a file. This plugin maps the little used cursor keys, `Home`,
`End`, `PageUp`, and `PageDown` keys to more useful functions.

This plugin defines four mapping groups:

- **Tab:** mappings to move through tabs
- **Window**: mappings to move around windows
- **Buffer**: mappings to manipulate buffers
- **Quick Fix**: mappings to traverse quick fix lists

Think of these groups like a mode within Normal model.

| Key          | Tab                | Window         | Buffer           | Quick Fix        |
|:-------------|:-------------------|:---------------|:-----------------|:-----------------|
| `<Up>`       | `:tabnew<CR>`      | `<C-W><Up>`    | `:buffer #<CR>`  |  `:clist<CR>`    |
| `<Down>`     | `<C-W>gf`          | `<C-W><Down>`  | `:buffer`        |  <Down>          |
| `<Left>`     | `:tabprevious<CR>` | `<C-W><Left>`  | `:bprevious<CR>` | `:cprevious<CR>` |
| `<Right>`    | `:tabnext<CR>`     | `<C-W><Right>` | `:bnext<CR>`     | `:cnext<CR>`     |
| `<PageUp>`   | `:tabmove +<CR>`   | `<C-W>W`       | `<PageUp`        | <PageUp>         |
| `<PageDown>` | `:tabmove -<CR>`   | `<C-W>w`       | `<PageDown`      | <PageDown>       |
| `<Home>`     | `:tabfirst<CR>`    | `<C-W>t`       | `:bfirst<CR>`    | `:cfirst<CR>`    |
| `<End>`      | `:tablast<CR>`     | `<C-W>b`       | `:blast<CR>`     | `:clast<CR>`     |
| `<Del>`      | `:tabclose<CR>`    | `<C-W>q`       | `:bdelete<CR>`   | `<Del>`          |


Further, this plugin defines functions that cycle through each of these key
mapping groups.

## Installation

## Package installation

## `vimrc` configuration


## Contributing

Should you have questions about using this plugin or think that you have
spotted an error, please ask in the [`#vim` channel on
freenode](https://webchat.freenode.net/?channels=vim). My handle is `axsdf`.

Please file [issues on
GitHub](https://github.com/andrewjstryker/vim-navigate/issues). Pull requests
are also welcome. [Writing a good commit
message](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
will increase your chance of meeting your pull accepted.

## License

Copyright (c) Andrew Stryker. Distributed under the same terms as Vim itself.
See `:help license`.
