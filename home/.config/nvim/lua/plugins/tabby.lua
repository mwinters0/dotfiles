-- vim: ts=2:sw=2:expandtab

-- TODO: Right-click to close tabs (default middle-click)

return(
  {
    'https://github.com/nanozuki/tabby.nvim',
    config = function()
      local theme = {
        fill='TabLineFill',
        current_tab='TabLineSel',
        tab='TabLine',
      }

      local function format_tab_name(tab)
        -- trim out window count (e.g. "[5+]")
        local name = tab.name()
        local index = string.find(name, "%[%d")
        name = index and string.sub(name, 1, index - 1) or name
        return name
      end

      local function is_tab_modified(tab)
        -- Checks all windows in tab
        local modified = false
        local win_ids = require('tabby.module.api').get_tab_wins(tab.id)
        for _, win_id in ipairs(win_ids) do
            if pcall(vim.api.nvim_win_get_buf, win_id) then
                local bufid = vim.api.nvim_win_get_buf(win_id)
                if vim.api.nvim_get_option_value("modified", {buf=bufid}) then
                    modified = true
                    break
                end
            end
        end
        return modified
      end

      require("tabby.tabline").set(function(line)
        -- Tabby's view of the world:
        -- - "Nodes" represent a drawable object.
        -- - They have a few properties such as `hl` and `margin`
        -- - They are also recursive:
        --    - Each "Tab" Node is made of multiple inner Nodes.
        --    - The entire outermost line is a single Node.
        --    - This function needs to return the outermost Node.
        return {
            -- Make a Node for each tab
          line.tabs().foreach(function(tab)
            local tab_hl = tab.is_current() and theme.current_tab or theme.tab
            -- local wins = api.get_tab_wins(tab.id)
            -- local modified = is_tab_current_win_modified(tab)
            local modified = is_tab_modified(tab)

            -- Create padding nodes
            local left_padding = {"▎", hl=tab_hl}

            return {
              -- Nodes representing this Tab
              left_padding,
              tab.number(),
              format_tab_name(tab),
              modified and '',
              -- {" ", hl=tab_hl}, -- right-padding node ("this tab"" style)
              {" ", hl=theme.fill}, -- right-margin node (tabline background)
              -- Attributes of "this" node
              hl = tab_hl,
              margin = " ", -- spacer between inner nodes of "this" node
            }
          end),
          -- set the hl for the outermost Node (tabline background)
          hl = theme.fill,
        }
      end)
    end, -- config
  }
)
