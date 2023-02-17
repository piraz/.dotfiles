local M =  {
}

M.log = require("plenary.log").new({
    level = "debug",
    plugin = "piraz",
    use_console = false,
})

return M
