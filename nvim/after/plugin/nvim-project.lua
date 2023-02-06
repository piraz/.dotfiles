local Dev = require("piraz.dev")
local log = Dev.log

local function load_nvim_project()
    log.trace("loading nvim-project")
    require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        ignore_lsp = { "sumneko_lua" },
        silent_chdir = false,
    }

    require("telescope").load_extension("projects")
end


if not pcall(load_nvim_project) then
    log.warn("error loading nvim-project")
end

