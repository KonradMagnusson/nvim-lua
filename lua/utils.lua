local Utils = {}

function Utils.map(mode, lhs, rhs)
        vim.api.nvim_set_keymap(mode, lhs, rhs, {silent =  true})
end

function Utils.noremap(mode, lhs, rhs)
        vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap = true, silent = true})
end

function Utils.exprnoremap(mode, lhs, rhs)
        vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap = true, silent = true, expr = true})
end

function Utils.nmap(lhs, rhs) Utils.map('n', lhs, rhs) end
function Utils.vnoremap(lhs, rhs) Utils.noremap('v', lhs, rhs) end
function Utils.inoremap(lhs, rhs) Utils.noremap('i', lhs, rhs) end


return Utils
