return {
	"nvim-telescope/telescope.nvim",
	commit = "6b08cdcc22a630d19172b9db55f7b8db5f81d761",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	keys = {
		-- { "<leader>?", "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
		{ "<leader><space>", "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<cr>" },
		{
			"<leader>/",
			function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
		},
        {
			"<leader>ff",
			function()
				local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
				if vim.v.shell_error ~= 0 then
					root = vim.loop.cwd() -- fallback to current path if no git directory found
				end
				require("telescope.builtin").find_files({ cwd = root })
			end,
		},
        {
			"<leader>lg",
			function()
				local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
				if vim.v.shell_error ~= 0 then
					root = vim.loop.cwd()
				end
				require("telescope.builtin").live_grep({ cwd = root })
			end,
		},
		-- { "<leader>ht", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
		{ "<leader>bi", "<cmd>lua require('telescope.builtin').builtin()<cr>" },
		-- { '<leader>fm', "<cmd>lua require('telescope.builtin').marks()<cr>" },
		{ "<leader>qf", "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
		{ "<leader>km", "<cmd>lua require('telescope.builtin').keymaps()<cr>" },
		{ "<leader>cm", "<cmd>lua require('telescope.builtin').commands()<cr>" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
