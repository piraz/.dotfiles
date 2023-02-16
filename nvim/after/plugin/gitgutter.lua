local Dev = require("piraz.dev")
local log = Dev.log

local git_gutter_call = pcall(vim.cmd, "GitGutterDisable")
if git_gutter_call then
    vim.cmd("GitGutterEnable")
    vim.keymap.set("n", "<leader>ghp", "<Plug>(GitGutterPreviewHunk)")
    vim.keymap.set("x", "<leader>ghs", "<Plug>(GitGutterStageHunk)")
    vim.keymap.set("n", "<leader>ghs", "<Plug>(GitGutterStageHunk)")
    vim.keymap.set("n", "<leader>ghu", "<Plug>(GitGutterUndoHunk)")
else
    log.debug("vim.gitgutter not found")
end
