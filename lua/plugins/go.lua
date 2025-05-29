return {
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local lspconfig = require("lspconfig")

            -- Настройка gopls вручную
            lspconfig.gopls.setup({
                on_attach = function(client, bufnr)
                    -- Отключаем signatureHelp (подсказки параметров)
                    client.server_capabilities.signatureHelpProvider = nil

                    -- Можно отключить и другие возможности
                    -- client.server_capabilities.hoverProvider = false
                end,
                settings = {
                    gopls = {
                        -- Дополнительные настройки gopls
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        completeUnimported = true,
                        usePlaceholders = false,
                    },
                },
            })

            -- Минимальная настройка go.nvim
            require("go").setup({
                lsp_cfg = false, -- не перезаписывать нашу конфигурацию LSP
                tag_options = "json=",
            })
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },
}
