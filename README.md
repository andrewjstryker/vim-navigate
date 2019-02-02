# Vim-Navigate

Vim plugin for navigating through tabs, buffers, windows, and quick fixes.

## Usage

Experienced Vim users forgo the cursor keys and use <key>h</key>, <key>j</key>,
<key>k</key>, and <key>l</key> keys to move around a file. This plugin maps the
little used cursor keys, <key>Home</key>, <key>End</key>, <key>PageUp</key>,
and <key>PageDown</key> keys to more useful functions.

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
| <key>Del</key>      | `:tabclose<CR>`    | `<C-W>q`       | `:bdelete<CR>`   | `<Del>`          |


Further, this plugin defines functions that cycle through each of these key
mapping groups.

## Installation

## Package installation

## `vimrc` configuration


## Contributing

## License

Copyright (c) Andrew Stryker. Distributed under the same terms as Vim itself.
See `:help license`.
