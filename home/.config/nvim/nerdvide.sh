#!/bin/bash

# neovide --fork ./*.lua lua/plugins/*.lua lua/config/*.lua lua/after/*.lua -- "+set titlestring=nvim\ config"
neovide ./*.lua lua/plugins/*.lua lua/config/*.lua lua/after/*.lua -- "+set titlestring=nvim\ config"
