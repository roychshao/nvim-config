return {
	{
		"nvim-treesitter/nvim-treesitter",
		main = "nvim-treesitter.configs",
		build = ":TSUpdate",
		event = "VeryLazy",
		opts = {
			ensure_installed = "all",
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			enable_check_bracket_line = false,
		},
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" }, {

				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes: foreground, background
				mode = "background", -- Set the display mode.
			})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		opts = {
			highlight_hovered_item = true,
			show_guides = true,
			auto_preview = false,
			position = "right",
			relative_width = true,
			width = 20,
			auto_close = false,
			show_numbers = false,
			show_relative_numbers = false,
			show_symbol_details = true,
			preview_bg_highlight = "Pmenu",
			autofold_depth = nil,
			auto_unfold_hover = true,
			fold_markers = { "", "" },
			wrap = false,
			keymaps = { -- These keymaps can be a string or a table for multiple keys
				close = { "<Esc>", "q", "<F3>" },
				goto_location = "<Cr>",
				focus_location = "o",
				hover_symbol = "<C-space>",
				toggle_preview = "K",
				rename_symbol = "r",
				code_actions = "a",
				fold = "h",
				unfold = "l",
				fold_all = "W",
				unfold_all = "E",
				fold_reset = "R",
			},
			lsp_blacklist = {},
			symbol_blacklist = {},
			symbols = {
				File = { icon = "", hl = "@text.uri" },
				Module = { icon = "", hl = "@namespace" },
				Namespace = { icon = "", hl = "@namespace" },
				Package = { icon = "", hl = "@namespace" },
				Class = { icon = "𝓒", hl = "@type" },
				Method = { icon = "ƒ", hl = "@method" },
				Property = { icon = "", hl = "@method" },
				Field = { icon = "", hl = "@field" },
				Constructor = { icon = "", hl = "@constructor" },
				Enum = { icon = "ℰ", hl = "@type" },
				Interface = { icon = "ﰮ", hl = "@type" },
				Function = { icon = "", hl = "@function" },
				Variable = { icon = "", hl = "@constant" },
				Constant = { icon = "", hl = "@constant" },
				String = { icon = "𝓐", hl = "@string" },
				Number = { icon = "#", hl = "@number" },
				Boolean = { icon = "⊨", hl = "@boolean" },
				Array = { icon = "", hl = "@constant" },
				Object = { icon = "⦿", hl = "@type" },
				Key = { icon = "🔐", hl = "@type" },
				Null = { icon = "NULL", hl = "@type" },
				EnumMember = { icon = "", hl = "@field" },
				Struct = { icon = "𝓢", hl = "@type" },
				Event = { icon = "🗲", hl = "@type" },
				Operator = { icon = "+", hl = "@operator" },
				TypeParameter = { icon = "𝙏", hl = "@parameter" },
				Component = { icon = "", hl = "@function" },
				Fragment = { icon = "", hl = "@constant" },
			},
		},
	},
}
