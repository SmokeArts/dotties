local status_ok, workspaces = pcall(require, "workspaces")
if not status_ok then
    return
end

local function open_hook()
  if workspaces.name() == "wiki" then
    --register command
  end
  vim.api.nvim_command("NvimTreeOpen")
end

workspaces.setup {
    -- path to a file to store workspaces data in
    -- on a unix system this would be ~/.local/share/nvim/workspaces
    path = vim.fn.stdpath "data" .. "/workspaces",

    -- to change directory for all of nvim (:cd) or only for the current window (:lcd)
    -- if you are unsure, you likely want this to be true.
    global_cd = true,

    -- sort the list of workspaces by name after loading from the workspaces path.
    sort = true,

    -- enable info-level notifications after adding or removing a workspace
    notify_info = true,

    -- lists of hooks to run after specific actions
    -- hooks can be a lua function or a vim command (string)
    -- if only one hook is needed, the list may be omitted
    hooks = {
        add = {},
        remove = {},
        open_pre = {},
        open = { open_hook },
    },
}

