return {
	"neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig",
		"folke/neoconf.nvim",
		"folke/neodev.nvim",
		{
			"j-hui/fidget.nvim",
			tag = "legacy",
		},
		"nvimdev/lspsaga.nvim",
	},
	config = function()
		local servers = {
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
			marksman = {},
			dockerls = {},
			docker_compose_language_service = {},
			biome = {},
			clangd = {},
			vtsls = {},
			taplo = {},
			solidity = {},
			solc = {},
		}
        -- bind keymapping, change on 2025/05/27 due to the upgrade from neovim 10 to neovim 11
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function (args)
                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)

                local nmap = function(keys, func, desc)
                    if desc then
                        desc = "LSP: " .. desc
                    end

                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
                end

                nmap("gD", "<cmd>Lspsaga goto_type_definition<CR>", "[G]oto Type [D]efinition")
                nmap("gd", "<cmd>Lspsaga goto_definition<CR>", "[G]oto [D]efinition")
                nmap("gR", "<cmd>Lspsaga finder<CR>", "[G]oto [R]eferences")
                nmap("pd", "<cmd>Lspsaga peek_definition<CR>", "[S]ee [D]efinition")
                nmap("K", "<cmd>Lspsaga hover_doc<CR>", "Hover Documentation")
                nmap("st", "<cmd>Lspsaga subtypes<CR>", "SubTypes")
                nmap("rn", "<cmd>Lspsaga rename<CR>", "ReName")
                nmap("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
                nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
                nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
                nmap("<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, "[W]orkspace [L]ist Folders")
                nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
                nmap("<leader>rn", "<cmd>Lspsaga rename ++project<cr>", "[R]e[n]ame")
                nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "[C]ode [A]ction")
                nmap("<leader>da", require("telescope.builtin").diagnostics, "[D]i[A]gnostics")
                nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                nmap("<space>f", function()
                    vim.lsp.buf.format({ async = true })
                end, "[F]ormat code")
            end
        })
		require("neoconf").setup()
		require("neodev").setup()
		require("fidget").setup()
		require("lspsaga").setup()
		require("mason").setup()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local ensure_installed = vim.tbl_keys(servers)
		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
			handlers = {
				function(server_name) -- default handler (optional)
					vim.lsp.enable(server_name, {
						settings = servers[server_name],
						-- on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			},
		})
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
		end, {})
	end,
}
