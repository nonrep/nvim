return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false, -- Загружать при старте
        priority = 1000, -- Высокий приоритет (для корректного применения цветов)
        opts = {
            flavour = "auto",
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            -- ... остальные ваши настройки ...
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
