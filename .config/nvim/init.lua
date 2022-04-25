--  =============================================================================
--  Load plugins
--  =============================================================================


if vim.fn.empty(vim.fn.glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim')) then
  vim.fn.execute '!curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
end

local Plug = vim.fn['plug#']
vim.call('plug#begin', '$XDG_CONFIG_HOME/nvim/plugged')

-- General Utils
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kyazdani42/nvim-web-devicons'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'nvim-lua/plenary.nvim'
Plug 'karb94/neoscroll.nvim'

-- Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'
Plug 'bps/vim-textobj-python'

-- Searching
Plug 'nvim-telescope/telescope.nvim'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug('folke/lsp-colors.nvim', { branch = 'main' })
Plug('hrsh7th/cmp-nvim-lsp', { branch = 'main' })
Plug('hrsh7th/cmp-buffer', { branch = 'main' })
Plug('hrsh7th/cmp-path', { branch = 'main' })
Plug('hrsh7th/cmp-cmdline', { branch = 'main' })
Plug('hrsh7th/nvim-cmp', { branch = 'main' })
Plug('jose-elias-alvarez/null-ls.nvim', { branch = 'main' })
Plug 'onsails/lspkind.nvim'

-- DB
Plug 'tpope/vim-dadbod'

-- File system
Plug 'tpope/vim-vinegar'

-- Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'pwntester/octo.nvim'
Plug('lewis6991/gitsigns.nvim', { branch = 'main' })

-- Other langs
Plug 'sheerun/vim-polyglot'
Plug 'nathangrigg/vim-beancount'
Plug 'jjo/vim-cue'
Plug('ellisonleao/glow.nvim', { branch = 'main' })

-- Visuals
Plug('folke/trouble.nvim', { branch = 'main' })
Plug 'romgrk/nvim-treesitter-context'
Plug 'stevearc/aerial.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug('akinsho/bufferline.nvim', { tag = '*' })
Plug 'RRethy/nvim-base16'

vim.call('plug#end')

local set = vim.opt
-- =============================================================================
-- Appearance
-- =============================================================================



vim.cmd [[
  filetype plugin indent on
  syntax enable
]]

if vim.fn.filereadable(vim.fn.expand('$XDG_CONFIG_HOME/vim/vimrc_background')) then
  vim.cmd 'source $XDG_CONFIG_HOME/vim/vimrc_background'
end

set.number = true
set.relativenumber = true
set.cursorline = false
set.showcmd = true
set.textwidth = 100
set.wrap = false
set.termguicolors = true


-- Status line
-- set laststatus=2


set.autoread = true
set.shortmess:append('I')
set.updatetime = 100

-- =============================================================================
-- Tabs
-- =============================================================================

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true

-- =============================================================================
-- Leader
-- =============================================================================

vim.keymap.set('n', '<space>', '<Nop>')
vim.g.mapleader = " "

-- =============================================================================
-- Search
-- =============================================================================

set.incsearch = true
set.hlsearch = true
set.ignorecase = true
set.smartcase = true
set.showmatch = true
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR><C-L>')
local augroup = vim.api.nvim_create_augroup('hightlight_cmds', { clear = true })
vim.api.nvim_create_autocmd('InsertEnter', { pattern = '*', group = augroup, command = ':setlocal nohlsearch' })
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', group = augroup, command = ':setlocal hlsearch' })

-- =============================================================================
-- Wildmode
-- =============================================================================

set.wildmenu = true
-- Disable temp and backup files
set.wildignore:append('*.swp,*~,._*,*.pyc,__pycache__')
-- Disable output and VCS files
set.wildignore:append('*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem')
-- Disable archive files
set.wildignore:append('*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz')

-- =============================================================================
-- Editing
-- =============================================================================

--disable autocomment
local augroup = vim.api.nvim_create_augroup('format_opts', { clear = true })
vim.api.nvim_create_autocmd('FileType', { pattern = '*', group = augroup, command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' })

--Run dot-command in normal if in visual
vim.keymap.set('v', '.', ':norm.<CR>')
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', 'Q', '<NOP>')
-- Handy pasting from clipboard
vim.keymap.set('n', '<leader>p', ':set paste<CR>o<esc>"*]p:set nopaste<cr>')

set.swapfile = false

-- :W is too easy to type by accident
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wqa', 'wqa', {})

-- =============================================================================
-- Movement
-- =============================================================================

--Force hjkl usage
vim.keymap.set('n', '<Up>', '<NOP>')
vim.keymap.set('n', '<Down>', '<NOP>')
vim.keymap.set('n', '<Left>', '<NOP>')
vim.keymap.set('n', '<Right>', '<NOP>')

vim.keymap.set('i', '<Up>', '<NOP>')
vim.keymap.set('i', '<Down>', '<NOP>')
vim.keymap.set('i', '<Left>', '<NOP>')
vim.keymap.set('i', '<Right>', '<NOP>')

-- =============================================================================
-- Windows
-- =============================================================================

set.splitbelow = true
set.splitright = true
vim.keymap.set('n', '<C-h>', '<C-w>h', { remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { remap = true })

-- =============================================================================
-- Buffers
-- =============================================================================

set.hidden = true
vim.g.netrw_fastbrowse = 0

-- =============================================================================
-- Telescope
-- =============================================================================

vim.keymap.set('n', '<C-p>', ':Telescope<cr>')
vim.keymap.set('n', '<C-p><C-p>', ':Telescope<cr>')
vim.keymap.set('n', '<C-p><C-t>', ';:Telescope lsp_dynamic_workspace_symbols<cr>')
vim.keymap.set('n', '<C-p><C-o>', ':Telescope lsp_document_symbols<cr>')
vim.keymap.set('n', '<C-p><C-f>', ':Telescope git_files<cr>')
vim.keymap.set('n', '<C-p><C-g>', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<C-p><C-h>', ':Telescope oldfiles<cr>')
vim.keymap.set('n', '<C-p><C-b>', ':Telescope buffers<cr>')
vim.keymap.set('n', 'r<C-]>', ':Telescope lsp_references<cr>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<cr>')
-- vim.keymap.set('n',  '<C-p><C-t>', ':Telescope tags<cr>')
-- vim.keymap.set('n',  '<C-p><C-o>', ':Telescope treesitter<cr>')

local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  }
}

-- =============================================================================
-- Smooth scroll
-- =============================================================================

require('neoscroll').setup({
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function = nil, -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = nil, -- Function to run after the scrolling animation ends
  performance_mode = false, -- Disable "Performance Mode" on all buffers.
})

-- =============================================================================
-- Nvim completion
-- =============================================================================

set.completeopt = 'menu,menuone,noselect'


-- LSP's
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'd<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'r<C-]>', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-y>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { 'pyright' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require 'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Completion options
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end
local cmp = require 'cmp'

local lspkind = require('lspkind')
cmp.setup({
  formatting = {
    format = lspkind.cmp_format(),
  },
  mapping = {
    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- diagnostics config
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- =============================================================================
-- Aerial
-- =============================================================================

require('aerial').setup({})
require('telescope').load_extension('aerial')

-- =============================================================================
-- Null-ls
-- =============================================================================

local null_ls = require("null-ls")
local sources = {
  null_ls.builtins.diagnostics.mypy,
  null_ls.builtins.diagnostics.pylint,
  null_ls.builtins.formatting.black,
  null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
              augroup LspFormatting
                  autocmd! * <buffer>
                  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
              augroup END
              ]])
    end
  end,
})

-- =============================================================================
-- Trouble
-- =============================================================================

require('trouble').setup({
  mode = "document_diagnostics",
})
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<C-x><C-x>", "<cmd>Trouble<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-x><C-w>", "<cmd>Trouble workspace_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-x><C-d>", "<cmd>Trouble document_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-x><C-l>", "<cmd>Trouble loclist<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-x><C-q>", "<cmd>Trouble quickfix<cr>", opts)

-- =============================================================================
-- Bufferline
-- =============================================================================

require("bufferline").setup {
  options = {
    diagnostics = 'nvim_lsp'
  }
}

-- =============================================================================
-- Git
-- =============================================================================

local augroup = vim.api.nvim_create_augroup('git_commit', { clear = true })
vim.api.nvim_create_autocmd('FileType', { pattern = 'gitcommit', group = augroup, command = 'setlocal spell textwith=72' })
require('gitsigns').setup {

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    map({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>')
    map({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>gS', gs.stage_buffer)
    map('n', '<leader>gu', gs.undo_stage_hunk)
    map('n', '<leader>gR', gs.reset_buffer)
    map('n', '<leader>gp', gs.preview_hunk)
    map('n', '<leader>gb', function() gs.blame_line { full = true } end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>gd', gs.diffthis)
    map('n', '<leader>gD', function() gs.diffthis('~') end)
    map('n', '<leader>gd', gs.toggle_deleted)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

-- =============================================================================
-- Fugitive
-- =============================================================================

local augroup = vim.api.nvim_create_augroup('FigitiveCustom', { clear = true })
vim.api.nvim_create_autocmd('BufRead', { pattern = 'figitive://*', group = augroup, command = 'set bufhidden=delete' })

-- :Gbrowse uses netrw, set default browser for that
vim.g.netrw_browsex_viewer = "qutebrowser"

-- =============================================================================
-- Lualine
-- =============================================================================

require('lualine').setup({})
local M                    = require('base16-colorscheme')
local hi                   = M.highlight
hi.LineNr                  = { guifg = M.colors.base03, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.SignColumn              = { guifg = M.colors.base03, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.GitGutterAdd            = { guifg = M.colors.base0B, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.GitGutterChange         = { guifg = M.colors.base0D, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.GitGutterDelete         = { guifg = M.colors.base08, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.GitGutterChangeDelete   = { guifg = M.colors.base0E, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.NormalFloat             = { guifg = M.colors.base05, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.FloatBorder             = { guifg = M.colors.base05, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.DiagnosticError         = { guifg = M.colors.base0E, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.DiagnosticWarn          = { guifg = M.colors.base08, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.DiagnosticInfo          = { guifg = M.colors.base05, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.DiagnosticHint          = { guifg = M.colors.base0C, guibg = M.colors.base01, gui = nil, guisp = nil }
hi.CmpItemAbbrDeprecated   = { guifg = M.colors.base03, guibg = nil, gui = 'strikethrough', guisp = nil }
hi.CmpItemAbbrMatch        = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.CmpItemAbbrMatchFuzzy   = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.CmpItemKindVariable     = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.CmpItemKindInterface    = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.CmpItemKindText         = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
hi.CmpItemAbbrKindFunction = { guifg = M.colors.base0E, guibg = nil, gui = nil, guisp = nil }
hi.CmpItemAbbrKindMethod   = { guifg = M.colors.base0E, guibg = nil, gui = nil, guisp = nil }
hi.CmpItemAbbrKindKeyword  = { guifg = M.colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.CmpItemKindProperty     = { guifg = M.colors.base05, guibg = nil, gui = nil, guisp = nil }
hi.CmpItemKindUnit         = { guifg = M.colors.base05, guibg = nil, gui = nil, guisp = nil }

-- =============================================================================
-- Markdown
-- =============================================================================

vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_new_list_item_indent = 0
local augroup = vim.api.nvim_create_augroup('markdown_cmds', { clear = true })
vim.api.nvim_create_autocmd('FileType', { pattern = 'markdown', group = augroup, command = 'setlocal spell formatoptions=tqr' })

-- =============================================================================
-- DB
-- =============================================================================

vim.api.nvim_create_user_command('SQL', 'enew | setlocal buftype=nofile | setlocal ft=pgsql', {})
