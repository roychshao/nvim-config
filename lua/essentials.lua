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
option.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo")
option.wrap = true
option.splitright = true
option.splitbelow = true
option.clipboard = "unnamed,unnamedplus"

-- Buffer Settings --
-- buffer.fileenconding = "utf-8"

-- indent custumization --
vim.cmd([[
 autocmd FileType typescript,javascript,typescriptreact,javascriptreact setlocal shiftwidth=2 softtabstop=2 expandtab
]])

-- Global Settings --
global.mapleader = " "

-- Key mappings --
-- in visual mode, use J and K to move the whole block up and down
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv")
-- in visual mode and normal mode, select a block of text and click <space + y> to copy the selected text
vim.keymap.set({ "v", "n" }, "<leader>y", '"+y')
--
-- -- Nvim Tree dynamic root
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()

        local ignored_filetypes = {
            ["DiffviewLog"] = true,
            ["DiffviewPopup"] = true,
            ["DiffviewFiles"] = true,
            ["DiffviewFileHistory"] = true,
        }

        if ignored_filetypes[vim.bo.filetype] then
            return
        end

        local path = vim.fn.expand("%:p:h")

        if path == nil or path == "" then return end
        if path:match("^jdt:") then return end
        if path:match("^diffview:") then return end

        vim.cmd("cd " .. path)
    end
})
