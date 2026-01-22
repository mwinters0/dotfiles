<!---
vim: ts=2:sw=2:expandtab
-->

# Most Common

## Update Plugins / LSPs
- `:Lazy`
- `:Mason`

## UI
- Leader: ` ` (space)
- Open Neo-Tree (file browser): `|`
  - Help: `?`
  - Preview: `P`
    - Scroll preview: `Ctrl-f` / `Ctrl-b`
    - Focus preview: `l` ("l"ook)
- Disable indent markers: `:lua Snacks.indent.disable()`
- Git stuff:
  - `<leader>g`
  - `:Gitsigns <tab>`
- Redraw screen: `Ctrl-l` ("el")
### LSP Diagnostics
- Show diagnostics of current line: `Ctrl-W d`
- Next / Prev diagnostic: `]d`, `[d`
### Autocomplete (`:h ins-completion`, `:h autocomplete`)
- Accept: `Ctrl-Y` ("yes") / my config: `<Ctrl-CR>`
- Cycle Suggestions Forward / Backward: `Ctrl-N` / `Ctrl-P`
- Cancel: `Ctrl-E` ("end")
- Trigger Omni: `Ctrl-X Ctrl-O`
- Enable: `:set ac`
### Tabs (`:h tabpage`)
- New tab / edit: `:tabn` / `:tabe <file>`
  - Location modifier:
    - Left: `:-tabe`
    - First: `:0tabe`
    - Last: `:$tabe`
- Close: `:tabc` / `Ctrl-W c`
  - Close other: `:tabd <num>`
  - Close all others: `:tabo` (`:tabonly`)
- Nav:
  - Next / prev: `gt` / `gT`
  - Go to: `3gt`
  - Flip between: `g<Tab>`
- List: `:tabs`
- Move: `:tabm <num>`
### Terminal
- Open: `:terminal` (or snacks: `<leader>/`)
- Normal mode: `Ctrl-\ Ctrl-N`
- FYI: exit the terminal with `exit`, not `:q` et al
### Help
- Follow link: `Ctrl-]`
- Back: `Ctrl-O`


## Insert mode
### Edit
- Indent: `Ctrl-T`
- OutIndent: `Ctrl-D`
- Delete word: `Ctrl-W`

- Execute a normal command: `Ctrl-O`

- Paste the last yank: `Ctrl-R "`
- Paste register a: `Ctrl-R a`
### Movement
- Page Up / Down: `Shift-Up` / `Shift-Down`
- Word left / right: `Ctrl-Left` or `Shift-Left` / `Right`
- Execute a normal command: `Ctrl-O`
  - Home / End: `Ctrl-O 0` / `Ctrl-O $`


## Normal mode
### Surround
- Add: `ys<motion>}`
- Delete: `ds}`

### Tricks
- Diff unsaved: `:w !diff % -`
- Alternate buffer: `Ctrl-^`

## Config (`:h options`)
- Inspect value: `:set tw?`

- Filetype: `:set ft=foo`

- Autoindent: `:setg ai sw=2 ts=2 expandtab`
- Autosave: `:set awa` / `:set autowriteall`
- Autoread (when changed on disk): `:set ar` / `:set autoread`
- Autocomplete: `:set ac` / `:set autocomplete`
  - Autocomplete delays (ms): `:set acl` / `:set autocompletedelay`
- Autobackup: `:set bk` / `:set backup`


---


# Reference

## UI
### Windows
- `:h CTRL-W`
- `Ctrl-W` + ....
  - Go to:
    - Up `<num>`: `k` or `Ctrl-k`
    - Down `<num>`: `j` or `Ctrl-j`
    - Left `<num>`: `h` or `Ctrl-h`
    - Right `<num>`: `l` or `Ctrl-l`
    - Previous `<num>`: `p` or `Ctrl-p`
    - Next `<num>`: `w` or `Ctrl-w`
    - Top: `t` or `Ctrl-t`
    - Bottom: `b` or `Ctrl-b`
  - Resize:
    - Change height `<num>` lines: `+` / `-`
    - Change width: `<num>` lines: `>` / `<`
    - Set width to `<num>`: `|`
    - Set height to `<num>`: `_` or `Ctrl-_`
    - Equalize: `=`
  - Move:
    - To new tabpage: `T` or `Ctrl-t`
    - To top / bottom: `K` / `J`
    - To far left / right: `H` / `L`
    - Swap with window `<num>`: `x` or `Ctrl-x` ("exchange")
    - Rotate up / down `<num>`: `R` / `r` or `Ctrl-r`
  - ?:
    - Preview window / close preview: `P` / `z`
    - Show tag in preview: `}`
  - Split and ...
    - Edit alternate file: `^`
    - Jump to definition: `d` or `Ctrl-d`
    - Jump to declaration: `i` or `Ctrl-i`
    - many more of these ...
  - Action:
    - Close: `c` or `Ctrl-c`
    - Close others (like `:only`): `o` or `Ctrl-o`
    - Quit (like `:quit`): `q` or `Ctrl-q`
    - New with `<num>` height: `n` or `Ctrl-n`
    - Split with `<num>` height: `s` or `Ctrl-s`
    - Vsplit with `<num>` width: `v` or `Ctrl-v`


### Misc Commands
- Highlighting
  - `:Inspect`
  - `:verbose highlight TabLineFill`


## Config
- Set / unset a flag: `:set guioptions+=a` / `:set guioptions -=a`

### Inspecting Config
- Show config value: `:set tw?`
  - Inspect where this was set: `:verbose set tw?`
- Show all non-default options: `:set!`
- Browse all options: `:opt` / `:h options`
- Inspect keymaps
  - User keymaps:
    - All / Insert / Normal / Visual: `:map` / `:imap` / `:nmap` / `:vmap`
    - Inspect origin: `:verbose imap <C-o>`
  - Builtin keymaps:
    - All / Insert / Normal / Visual: `:h index` / `:h insert-index` / `:h normal-index` / `:h visual-index`
    - Individual Insert / Normal / Visual: `:h i_CTRL-O` / `:h CTRL-O` / `:h v_CTRL-O`

### Filetypes
- Default: `/usr/share/nvim/runtime/ftplugin/`



---


# TODO
## Fixes WIP
- neovide paste keymap broken
- finish snacks
- aerial integrations / plugins / keymap
- scrollbar: remove dot
- neo-tree: don't italic changed dirs, orange is enough

## assistance
- Mason non-LSP (formatters, linters, etc)
  - `ensure_installed`?
  - How to trigger / autotrigger?
- LSP
  - project-wide code actions, e.g. rename / refactor
  - https://github.com/MagicDuck/grug-far.nvim
- LLM

## tweaks / productivity
- sessions
  - https://github.com/nvim-mini/mini.sessions
  - nope:
    - https://github.com/folke/persistence.nvim
      - Fully automatic
- pairs
  - https://github.com/nvim-mini/mini.pairs/tree/main
  - https://github.com/windwp/nvim-autopairs
- snippets
  - https://github.com/L3MON4D3/LuaSnip
- toggler
  - https://github.com/iquzart/toggleword.nvim/blob/main/lua/toggleword/init.lua
  - https://github.com/nat-418/boole.nvim/blob/main/lua/boole.lua
- whitespace
  - toggle visible
  - auto-trim trailing
    - https://github.com/lewis6991/spaceless.nvim
- layouts
  - https://github.com/folke/snacks.nvim/discussions/458
- tabpage
  - https://github.com/akinsho/bufferline.nvim
    - Boo: can't decide if it's vim tabs or notepad++ tabs
- scrollbar
  - https://github.com/petertriho/nvim-scrollbar
    - Yay: Nice view.  Boo: no mouse support
  - https://github.com/dstein64/nvim-scrollview
    - Yay: Mouse support and customization.  Boo: draws dumb and 4k-line source files.

## foo
- https://github.com/stevearc/conform.nvim
- NVChad
  - https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/plugins/init.lua
  - https://github.com/NvChad/base46/tree/v3.0/lua/base46/integrations - NVChad theme / plugin tweaks
  - https://github.com/nvzone/menu
  - https://github.com/nvzone/floaterm
  - https://github.com/nvzone/timerly

### dev
- snacks.scope
  - Should have rainbow delimeter integration, e.g.: https://github.com/lukas-reineke/indent-blankline.nvim?tab=readme-ov-file#rainbow-delimitersnvim-integration
  - Highlight should have "min depth" -- annoying when at depth 1

- lazy.nvim
  - Doesn't support setting icons in `keys{}`. See: https://github.com/folke/lazy.nvim/issues/1645

- Toggler
  - Nobody has a per-filetype toggler.  Can model this from snacks.keymap

- A panel below the file explorer showing the list of unsaved buffers
- A hotkey to diff an unsaved buffer against on-disk

- ? Stacked (vsplit) explorers?  Useful to e.g. browse abstract classes vs implementations
