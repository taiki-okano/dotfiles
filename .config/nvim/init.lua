require("config.lazy")

vim.opt.ignorecase = true
vim.opt.ruler = true
vim.opt.number = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.keymap.set("n", "<Space>h", vim.cmd.nohlsearch, { silent = true })
