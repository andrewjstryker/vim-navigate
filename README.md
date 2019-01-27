# Vim-Navigate

Vim plugin for one-touch tab, buffer, window, and quick fix navigating.

## Usage

Experienced Vim user forgo the cursor keys and use <key>h</key>, <key>j</key>,
<key>k</key>, and <key>l</key> keys to move around
a file. This plugin maps the little used cursor keys, <key>home</key>,
<key>end</key>, and similar keys to more useful functions:

| Key          | Tab                | Window         | Buffer           | Quick Fix        |
|:-------------|:-------------------|:---------------|:-----------------|:-----------------|
| `<Up>`       | `:tabnew<CR>`      | `<C-W><Up>`    | `:buffer #<CR>`  |  `:clist<CR>`    |
| `<Down>`     | `<C-W>gf`          | `<C-W><Down>`  | `:buffer`        |  <Down>          |
| `<Left>`     | `:tabprevious<CR>` | `<C-W><Left>`  | `:bprevious<CR>` | `:cprevious<CR>` |
| `<Right>`    | `:tabnext<CR>`     | `<C-W><Right>` | `:bnext<CR>`     | `:cnext<CR>`     |
| `<PageUp>`   | `:tabmove +<CR>`   | `<C-W>W`       | `<PageUp>`       | `<PageUp>`       |
| `<PageDown>` | `:tabmove -<CR>`   | `<C-W>w`       | `<PageDown>`     | `<PageDown>`     |
| `<Home>`     | `:tabfirst<CR>`    | `<C-W>t`       | `:bfirst<CR>`    | `:cfirst<CR>`    |
| `<End>`      | `:tablast<CR>`     | `<C-W>b`       | `:blast<CR>`     | `:clast<CR>`     |
| `<Del>`      | `:tabclose<CR>`    | `<C-W>q`       | `:bdelete<CR>`   | `<Del>`          |

## Installation

## Contributing

## License

Copyright (c) Andrew Stryker. Distributed under the same terms as Vim itself.
See `:help license`.
