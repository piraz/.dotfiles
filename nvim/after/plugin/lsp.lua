-- local Dev = require("piraz.dev")
-- local log = Dev.log
local lsp = require("lsp-zero")
-- local lspconfig = require("lspconfig")
local lspconfig_util = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
    "bashls", -- shell check should be installed manually
    "intelephense",
    "jsonls",
    "lemminx",
    "prosemd_lsp", -- proselint should be installed manually 
    "pylsp",
    "sumneko_lua",
    "tsserver",
})

local cmp = require("cmp")
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    -- ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    -- ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {}
})

-- kind of based on https://jdhao.github.io/2021/08/12/nvim_sumneko_lua_conf/
-- but on the diagnostics we need use also and the workspace.library is not
-- needed
lsp.configure("sumneko_lua",{
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim", "use" },
            },
            -- workspace = {
            --     -- Make the server aware of Neovim runtime files
            --     library = vim.api.nvim_get_runtime_file("", true),
            --
            --     workspace = {
            --         checkThirdParty = false,
            --     },
            -- },
            -- Do not send telemetry data containing a randomized but unique
            -- identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- lsp.configure("ruff_lsp",{
--     -- see :h lspconfig-root-detection
--     settings = {
--         single_file_support = false,
--         root_dir = lspconfig_util.find_git_ancestor,
--     }
-- })

lsp.setup_nvim_cmp({
   mapping = cmp_mappings
})

-- lsp.on_lsp_ready(function(client, bufnr)
-- end)


lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    if client.name == "ruff_lsp" then
        print(vim.inspect(client))
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws",
    function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd",
    function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca",
    function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr",
    function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn",
    function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-h>",
    function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

-- lspconfig.ruff_lsp.setup{
--     on_attach = function(client, bufnr)
--         client.config.single_file_support = false
--         client.root_dir = "/home/fpiraz/source/candango/etcdpy"
--         -- client.root_dir = lspconfig.root_pattern("pyproject.toml", ".git")
--         log.warn(vim.inspect(client))
--     end,
-- }

--[[ require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

local lspconfig = require("lspconfig")

-- From:
-- https://www.reddit.com/r/neovim/comments/lf8yss/comment/gmkjrpr/?utm_source=share&utm_medium=web2x&context=3
lspconfig.sumneko_lua.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim", "use"},
            },
        },
    },
})

mason_lspconfig.setup ({
    "ruff", "sumneko_lua"
}) ]]

