return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
        local jdtls = require("jdtls")
        local home = os.getenv("HOME")
        local jdtls_path = home .. "/.local/share/nvim/language_server/jdtls/bin/jdtls"

        local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
        local root_dir = require("jdtls.setup").find_root(root_markers)

        if not root_dir then
            vim.notify("[jdtls] Cannot find project root", vim.log.levels.WARN)
            return
        end

        local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
        local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

        local config = {
            cmd = {
                jdtls_path,
                "-data", workspace_dir,
                "-configuration", home .. "/.local/share/nvim/language_server/jdtls/config_linux",
            },
            root_dir = root_dir,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            settings = {
                java = {
                    configuration = {
                        updateBuildConfiguration = "interactive",
                    },
                    maven = {
                        downloadSources = true,
                    },
                    referencesCodeLens = {
                        enabled = true,
                    },
                    references = {
                        includeDecompiledSources = true,
                    },
                    contentProvider = { preferred = "fernflower" },
                },
            },
            init_options = {
                bundles = {},
            },
        }

        -- 自動啟動 jdtls（僅限 Java buffer）
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
                jdtls.start_or_attach(config)
            end,
        })

        -- 為 jdt:// buffer 加上 jdtls client（解決 goto_definition 錯誤）
        vim.api.nvim_create_autocmd("BufReadCmd", {
            pattern = "jdt://*",
            callback = function()
                local clients = vim.lsp.get_active_clients({ name = "jdtls" })
                if #clients == 0 then
                    vim.notify("[jdtls] No active jdtls client for jdt:// buffer", vim.log.levels.ERROR)
                    return
                end
                vim.lsp.buf_attach_client(0, clients[1].id)
            end,
        })
    end,
}

