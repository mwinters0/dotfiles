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
  - Location modifiers:
    - Left: `:-tabe`
    - First: `:0tabe`
    - Last: `:$tabe`
- Close this : `:tabc` / `:tabc <num>`
  - Close other: `:tabd <num>`
  - Close all others: `:tabo` (`:tabonly`)
- Nav: `:tabn` / `:tabn <num>`
  - Faster: `3gt`
  - Flip between: `:tabn #`
- List: `:tabs`
- Move: `:tabm <num>`
### Terminal
- Open: `:terminal` (or snacks: `<leader>/`)
- Normal mode: `Ctrl-\ Ctrl-N`
- FYI: exit the terminal with `exit`, not `:q` et al


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

## Misc
- Highlighting
  - `:Inspect`
  - `:verbose highlight TabLineFill`

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
- pairs
  - https://github.com/nvim-mini/mini.pairs/tree/main
  - https://github.com/windwp/nvim-autopairs
- snippets
  - https://github.com/L3MON4D3/LuaSnip 
- toggler
- whitespace
  - toggle visible
  - auto-trim trailing
- layouts
  - https://github.com/folke/snacks.nvim/discussions/458

## nope
- Tabpage
  - https://github.com/akinsho/bufferline.nvim
    - Fundamentally: can't decide if vim tabs or notepad++ tabs
- Sessions
  - https://github.com/folke/persistence.nvim
    - Fully automatic - I only want sessions on big projects
- Picker

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

- Toggler
  - Nobody has a per-filetype toggler.  Can model this from snacks.keymap

- A panel below the file explorer showing the list of unsaved buffers
- A hotkey to diff an unsaved buffer against on-disk

- ? Stacked (vsplit) explorers?  Useful to e.g. browse abstract classes vs implementations
