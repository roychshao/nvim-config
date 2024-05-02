local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Globol Settings --
option.showmode = false
option.backspace = { "indent", "eol", "start" }
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.shiftround = true
option.autoindent = true
option.smartindent = true
option.number = true
option.relativenumber = false
option.wildmenu = true
option.hlsearch = false
option.ignorecase = true
option.smartcase = true
option.completeopt = { "menuone", "noselect" }
option.cursorline = true
option.termguicolors = true
option.signcolumn = "yes"
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = "a"
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
option.wrap = true
option.splitright = true
option.splitbelow = true
option.clipboard="unnamed,unnamedplus"

-- Buffer Settings --
-- buffer.fileenconding = "utf-8"


vim.cmd [[
 autocmd FileType typescript,javascript,typescriptreact,javascriptreact setlocal shiftwidth=2 softtabstop=2 expandtab
]]

-- Global Settings --
global.mapleader = " "

-- Key mappings --
-- in visual mode, use J and K to move the whole block up and down
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv")
-- in visual mode and normal mode, select a block of text and click <space + y> to copy the selected text
vim.keymap.set({ "v", "n" }, "<leader>y", "\"+y")
-- bufferline.nvim, use "gt" and "gT" to switch between tabstop
vim.keymap.set("n", "gT", ":BufferLineCyclePrev<CR>", opt)
vim.keymap.set("n", "gt", ":BufferLineCycleNext<CR>", opt)
vim.keymap.set("n", "<F2>", ":NvimTreeToggle<CR>", opt)
