return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			-- { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			model = "claude-3.5-sonnet",
			-- See Configuration section for rest
			window = {
				-- layout = 'float',
				--     relative = 'cursor',
				--     width = 0.7,
				--     height = 0.5,
				--     row = 0,
				--     border = 'double',
			},
		},
		vim.keymap.set("n", "cc", ":CopilotChat<CR>", { desc = "CopilotChatOpen" }),
		-- See Commands section for default commands if you want to lazy load on them
	},
}
