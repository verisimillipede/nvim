return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    config = function()
        require("no-neck-pain").setup({
            buffers = {
                scratchPad = {
                    -- set to `false` to
                    -- disable auto-saving
                    enabled = true,
                    -- set to `nil` to default 
                    -- to current working directory
                    location = 'nil',
                },
                bo = {
                    filetype = "md"
                },
            },
        })
    end,
}
