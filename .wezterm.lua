-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = 'Tokyo Night Storm'

config.font = wezterm.font("UDEV Gothic 35NFLG", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 14
config.adjust_window_size_when_changing_font_size = false
config.use_ime = true

config.window_background_opacity = 0.9

config.hide_tab_bar_if_only_one_tab = true

-- short cut key
local act = wezterm.action
config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  -- {
  --   key = 'f',
  --   mods = 'SHIFT|META',
  --   action = wezterm.action.ToggleFullScreen,
  -- },
  -- {
  --   key = 't',
  --   mods = 'SHIFT|CTRL',
  --   action = act.SpawnTab 'CurrentPaneDomain',
  -- },
  -- command palette
  {
    key = 'P',
    mods = 'LEADER',
    action = act.ActivateCommandPalette,
  },
  -- vertical split
  {
    key = '|',
    mods = 'LEADER',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  -- horizontal split
  {
    key = '-',
    mods = 'LEADER',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 's',
    mods = 'LEADER',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  -- activate left pane
  {
    key = 'LeftArrow',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Left'
  },
  -- acticvate down pane
  {
    key = 'DownArrow',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Down'
  },
  -- activate up pane
  {
    key = 'UpArrow',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Up'
  },
  -- activate right pane
  {
    key = 'RightArrow',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Right'
  },
  -- pane select
  {
    key = 'a',
    mods = 'LEADER',
    action = act.PaneSelect
  },
  {
    key = 'A',
    mods = 'LEADER',
    action = act.PaneSelect { mode = "SwapWithActive" }
  },
  -- workspaces
  {
    key = 'w',
    mods = 'LEADER',
    action = act.ShowLauncherArgs { flags = 'WORKSPACES|FUZZY', title = 'Select workspace' }
  },
  -- rename workspace
  {
    key = '$',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = '(wezterm) Set workspace title:',
      action = wezterm.action_callback(function(win, pane, line)
        if line then
          wezterm.mux.rename_workspace(
            wezterm.mux.get_active_workspace(),
            line
          )
        end
      end)
    }
  },
  -- create new workspace
  {
    key = 'N',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = '(wezterm) Create new workspace',
      action = wezterm.action_callback(function(win, pane, line)
        if line then
          win:perform_action(
            act.SwitchToWorkspace { name = line },
            pane
          )
        end
      end)
    }
  },
  -- next workspace
  {
    key = 'n',
    mods = 'LEADER',
    action = act.SwitchWorkspaceRelative(1)
  },
  -- prev workspace
  {
    key = 'p',
    mods = 'LEADER',
    action = act.SwitchWorkspaceRelative(-1)
  }
}
-- and finally, return the configuration to wezterm
return config
