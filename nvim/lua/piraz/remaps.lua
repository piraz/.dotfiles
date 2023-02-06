local keymap = require("piraz.keymap");

local nnoremap = keymap.nnoremap;

vim.g.mapleader = " ";
-- nnoremap("<leader>bls", "<cmd>ls<CR><cmd>b ");
nnoremap("<leader>ee", "<cmd>Ex<CR>");
nnoremap("<leader>ls", "<cmd>ls<CR>");
nnoremap("<leader>so", "<cmd>so<CR>");
nnoremap("<leader>pks", "<cmd>PackerSync<CR>");



-- From: https://superuser.com/a/310424
-- TODO: See if this is good: nnoremap()
