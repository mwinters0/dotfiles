<!---
vim: ts=2:sw=2:expandtab
-->

# Most Common

## Update Plugins / LSPs
- `:Lazy`
- `:Mason`


## Keymap
### UI
- Open Neo-Tree (file browser): `|`
  - Help: `?`
  - Preview: `P`
    - Scroll preview: `Ctrl-f` / `Ctrl-b`
    - Focus preview: `l` ("l"ook)
- Redraw screen: `Ctrl-L`
- `:Telescope <tab>`
- `:lua Snacks.notifier.show_history()`
- `:lua Snacks.indent.disable()`

### Diagnostics
- Show diagnostics of current line: `Ctrl-W d`
- Next / Prev diagnostic: `]d`, `[d`

#### Autocomplete (`:h ins-completion`, `:h autocomplete`)
- Accept: `Ctrl-Y` ("yes")
- Cycle Forward / Backward: `Ctrl-N` / `Ctrl-P`
- Cancel: `Ctrl-E` ("end")
- Trigger Omni: `Ctrl-X Ctrl-O`
- Enable: `:set ac`


## Misc UI

### Tricks
- Diff unsaved: `:w !diff % -`

### Insert mode
#### Movement
- Page Up / Down: `Shift-Up` / `Shift-Down`
- Word left / right: `Ctrl-Left` or `Shift-Left` / `Right`
- Execute a normal command: `Ctrl-O`
  - Home / End: `Ctrl-O 0` / `Ctrl-O $`

#### Edit
- Indent: `Ctrl-T`
- OutIndent: `Ctrl-D`
- Delete word: `Ctrl-W`

- Execute a normal command: `Ctrl-O`

- Paste the last yank: `Ctrl-R "`
- Paste register a: `Ctrl-R a`


## Tabs (`:h tabpage`)
:tabnew <file>
  :+tabnew
  :-tabnew
  :0tabnew
  :$tabnew
:tabe <num>


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
- Show all non-default options: `:set!`
- Browse all options: `:opt` / `:h options`
- Inspect keymaps
  - User keymaps: 
    - All / Insert / Normal / Visual: `:map` / `:imap` / `:nmap` / `:vmap`
    - Inspect origin: `:verbose imap <C-o>`
  - Builtin keymaps:
    - All / Insert / Normal / Visual: `:h index` / `:h insert-index` / `:h normal-index` / `:h visual-index`
    - Individual Insert / Normal / Visual: `:h i_CTRL-O` / `:h CTRL-O` / `:h v_CTRL-O`


---


# TODO
## Fixes WIP
- finish snacks
- insert mode O and o?

## visual / UI
- git signs / etc
- aerial integrations / plugins / keymap
- telescope integrations / plugins / keymap
- whitespace
  - toggle visible
  - auto-trim trailing

## edit
- surround actions, e.g. "surround this word in quotes"

## assistance
- Mason non-LSP (formatters, linters, etc)
  - `ensure_installed`?
  - How to trigger / autotrigger?
- LSP
  - project-wide code actions, e.g. rename / refactor
- LLM

## tweaks / productivity
- per-filetype preferences
  - indentation / etc
  - colorscheme overrides (chill, gruvbox)
- sessions

## misc
- terminal
- snippets

## whatis
- altfile
- quickfixes


