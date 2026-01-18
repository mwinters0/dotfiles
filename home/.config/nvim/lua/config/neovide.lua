-- vim: ts=2:sw=2:expandtab

-- FIXME: When launching on command line, don't create tabs

--- Keymaps ---

-- Recreate copy/paste keymaps normally implemented by terminal
-- Note: <D> is "Command", e.g. on Mac
vim.keymap.set('v', '<C-C>', '"+y') -- Copy
vim.keymap.set('n', '<C-S-V>', '"+P') -- Paste normal mode
vim.keymap.set('v', '<C-S-V>', '"+P') -- Paste visual mode
vim.keymap.set('c', '<C-S-V>', '<C-R>+') -- Paste command mode
vim.keymap.set('i', '<C-S-V>', '<ESC>l"+Pli') -- Paste insert mode

local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.1)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1/1.1)
end)



--- App Window ---

vim.o.title = true
-- vim.o.titlestring = 'set titlestring' -- Reminder :)

vim.g.neovide_theme = 'dark'

-- Rendering
vim.g.neovide_refresh_rate = 60 -- reduce to extend battery
-- vim.g.neovide_refresh_rate_idle = 5 -- when window unfocused
-- vim.g.neovide_no_idle = true

-- Window settings
-- vim.g.neovide_fullscreen = false
-- vim.g.neovide_macos_simple_fullscreen = true
-- vim.g.neovide_scale_factor = 1.0
-- vim.g.neovide_padding_top = 0
-- vim.g.neovide_padding_bottom = 0
-- vim.g.neovide_padding_right = 0
-- vim.g.neovide_padding_left = 0
-- vim.g.neovide_opacity = 0.8
-- vim.g.neovide_normal_opacity = 0.8 -- background color only

-- Behavior
vim.g.neovide_hide_mouse_when_typing = true
-- vim.g.neovide_detach_on_quit = 'prompt' -- when remote
-- vim.g.neovide_remember_window_size = true


--- Text ---

vim.o.guifont = "LiterationMono Nerd Font Mono:h12"
-- vim.opt.linespace = 0
-- vim.g.neovide_underline_stroke_scale = 1.0

-- vim.g.neovide_text_gamma = 0.0
-- vim.g.neovide_text_contrast = 0.5



vim.g.neovide_position_animation_length = 0.15 -- window positions
vim.g.neovide_scroll_animation_length = 0.3
vim.g.neovide_scroll_animation_far_lines = 1

vim.g.neovide_progress_bar_enabled = true
vim.g.neovide_progress_bar_height = 5.0
vim.g.neovide_progress_bar_animation_speed = 200.0
vim.g.neovide_progress_bar_hide_delay = 0.2



--- Floating Windows ---

-- vim.g.neovide_floating_blur_amount_x = 2.0
-- vim.g.neovide_floating_blur_amount_y = 2.0
-- vim.g.neovide_floating_shadow = true
-- vim.g.neovide_floating_z_height = 10
-- vim.g.neovide_light_angle_degrees = 45
-- vim.g.neovide_light_radius = 5
-- vim.g.neovide_floating_corner_radius = 0.0




vim.g.neovide_profiler = false


-- vim.g.neovide_input_macos_option_key_is_meta = 'none'
-- vim.g.neovide_input_ime = true

vim.g.neovide_touch_deadzone = 6.0
vim.g.neovide_touch_drag_timeout = 0.17


vim.g.neovide_cursor_animation_length = 0.00
vim.g.neovide_cursor_short_animation_length = 0.00
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_unfocused_outline_width = 0.125 -- only when unfocused
-- vim.g.neovide_cursor_smooth_blink = false -- requires setting guicursor

vim.g.neovide_cursor_vfx_mode = {"", ""} -- railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_density = 0.7
vim.g.neovide_cursor_vfx_particle_speed = 10.0
vim.g.neovide_cursor_vfx_particle_phase = 1.5 -- only for railgun
vim.g.neovide_cursor_vfx_particle_curl = 1.0 -- only for railgun






