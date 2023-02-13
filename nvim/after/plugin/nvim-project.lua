local Dev = require("piraz.dev")
local log = Dev.log

local nvim_project = pcall(require, "project_nvim")
if nvim_project then
    require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        ignore_lsp = { "sumneko_lua" },
        silent_chdir = false,
    }
else
    log.debug("nvim-project not found")
end
