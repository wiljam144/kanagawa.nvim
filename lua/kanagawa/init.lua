local M = {}

local function set_highlights(hlgroups)
    for group, colors in pairs(hlgroups) do
        if not vim.tbl_isempty(colors) then
            vim.api.nvim_set_hl(0, group, colors)
        end
    end
end

--- default config
M.config = {
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = false,
    colors = {},
    overrides = {},
    theme = "default", -- only one theme atm
}

--- update global configuration with user settings
--@param config user configuration
--@return nil
function M.setup(config)
    M.config = vim.tbl_extend("force", M.config, config or {})
end

--- load the colorscheme
function M.load()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "kanagawa"
    vim.o.termguicolors = true

    local colors = require("kanagawa.colors").setup()
    local hlgroups = require("kanagawa.hlgroups").setup(colors)

    set_highlights(hlgroups)
end

return M
