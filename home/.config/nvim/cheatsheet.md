# Most Common

## Update Plugins / LSPs
- `:Lazy`
- `:Mason`


## Bindings
### UI
- `|` = Open Neo-Tree
  - `?` = show help
- Redraw screen: `Ctrl-L`

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
- `:Telescope <tab>`
- Diff unsaved: `:w !diff % -`

### Insert mode
#### Movement
- Page Up / Down: `Shift-Up` / `Shift-Down`
- Word left / right: `Ctrl-Left` or `Shift-Left` / `Right`
- Execute a normal command: `Ctrl-O`
  - Home / End: `Ctrl-O 0` / `Ctrl-O $`

#### Edit
- Delete word: `Ctrl-W`
- Delete line: `Ctrl-U`

- Paste the last yank: `Ctrl-R "`
- Paste register a: `Ctrl-R a`

- Execute a normal command: `Ctrl-O`

- Indent: `Ctrl-T`
- UnIndent: `Ctrl-t` # ???



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

## Config (:h options)
:set tw? - Show config value
:set!    - Show all non-default options
:opt     - Browse all options

:set guioptions+=a / :set guioptions -=a  - set a flag
