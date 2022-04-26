local autocmd = vim.api.nvim_create_autocmd
local mk_augroup = vim.api.nvim_create_augroup

local augroup_1 = mk_augroup('highlight_cmds', { clear = true })
autocmd('InsertEnter', { pattern = '*', group = augroup_1, command = ':setlocal nohlsearch' })
autocmd('InsertLeave', { pattern = '*', group = augroup_1, command = ':setlocal hlsearch' })

local augroup_2 = vim.api.nvim_create_augroup('format_opts', { clear = true })
autocmd('FileType', { pattern = '*', group = augroup_2, command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' })

local augroup_3 = vim.api.nvim_create_augroup('FigitiveCustom', { clear = true })
autocmd('BufRead', { pattern = 'figitive://*', group = augroup_3, command = 'set bufhidden=delete' })

local augroup_4 = vim.api.nvim_create_augroup('markdown_cmds', { clear = true })
autocmd('FileType', { pattern = 'markdown', group = augroup_4, command = 'setlocal spell formatoptions=tqr' })

local augroup_5 = vim.api.nvim_create_augroup('git_commit', { clear = true })
autocmd('FileType', { pattern = 'gitcommit', group = augroup_5, command = 'setlocal spell textwidth=72' })
