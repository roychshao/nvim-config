return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "jay-babu/mason-nvim-dap.nvim"
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local nvimdap = require("mason-nvim-dap")

            dapui.setup()
            nvimdap.setup({
                ensure_installed = { "java" },
            })

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            dap.configurations.java = {
                {
                    type = 'java',
                    request = 'attach',
                    name = "Attach to local:5005",
                    hostName = "127.0.0.1",
                    port = 5005,
                },
                {
                    type = 'java',
                    request = 'attach',
                    name = "Attach to selab146",
                    hostName = '140.112.90.146',
                    port = 5005,
                }
            }

            -- NOTE: KeyMapping
            vim.keymap.set("n", "<Leader>dc", function()dap.continue()end, { desc = "Debuger Continue" })
            vim.keymap.set("n", "<Leader>so", function()dap.step_over()end, { desc = "Debugger Step Over" })
            vim.keymap.set("n", "<Leader>si", function()dap.step_into()end, { desc = "Debugger Step Into" })
            vim.keymap.set("n", "<Leader>sto", function()dap.step_out()end, { desc = "Debugger Step Out" })
            vim.keymap.set("n", "<leader>b", function()dap.toggle_breakpoint()end, { desc = "Debugger Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>cb", function()
                vim.ui.input({ prompt = "[C]onditional [B]reakPoint: " }, function(condition)
                    if condition then
                        require("dap").toggle_breakpoint(condition)
                    end
                end)
            end, { desc = "Debugger Conditional Breakpoint" })
            vim.keymap.set("n", "<leader>lp", function()dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))end, { desc = "Debugger Log Point Message" })
            vim.keymap.set("n", "<leader>dr", function()dap.repl.open()end, { desc = "Debugger Repl Open" })
            vim.keymap.set("n", "<leader>dl", function()dap.run_last()end, { desc = "Debugger Run Last" })
            vim.keymap.set("n", "<leader>du", function()dapui.toggle()end, { desc = "Debugger UI" })

            -- NOTE: sign icons
            vim.fn.sign_define('DapBreakpoint',          { text='', texthl='DiagnosticSignError', linehl='', numhl='' })
            vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DiagnosticSignWarn',  linehl='', numhl='' })
        end,
    },
}

