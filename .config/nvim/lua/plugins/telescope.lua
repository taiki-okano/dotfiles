return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    cmd = "Telescope",

    keys = {
        {
            "<Space>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files",
        },
        {
            "<Space>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Live grep",
        },
        {
            "<Space>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Buffers",
        },
        {
            "<Space>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Help tags",
        },
    },

    config = function()
        require("telescope").setup({
            defaults = {
                layout_strategy = "horizontal",
                sorting_strategy = "ascending",
                layout_config = {
                    prompt_position = "top",
                },
            },
            extensions = {
                "fzf", "remote-sshfs"
            }
        })
    end,
}
