" basic settings
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set wrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set mouse=a
set colorcolumn=99
set cursorline
set scrolloff=5
set clipboard=unnamedplus
set nu rnu
set splitbelow
set splitright
set switchbuf=usetab


call plug#begin('~/.vim/plugged')
"File finders
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'

"LLM
Plug 'olimorris/codecompanion.nvim'
Plug 'simo5/vimini'

Plug 'preservim/tagbar'
Plug 'preservim/nerdcommenter'

Plug 'ap/vim-css-color'
Plug 'vim-python/python-syntax'

Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tribela/vim-transparent'

" Themes
"Plug 'nanotech/jellybeans.vim'
"Plug 'savq/melange-nvim'
"Plug 'w0ng/vim-hybrid'
"Plug 'morhetz/gruvbox'
"Plug 'sainnhe/gruvbox-material'
"Plug 'Mitch1000/backpack'
"Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'tpope/vim-vividchalk'
"Plug 'lifepillar/vim-gruvbox8'
"Plug 'toupeira/vim-desertink'
Plug 'srcery-colors/srcery-vim'
call plug#end()

" Instructions:
" Install once with:  :CocInstall coc-pyright
" coc-pyright gives type-aware completions, hover docs, and go-to-def for Python.
" ── PEP 8 – auto-format Python on save ───────────────────────────────────────
" Requires:  pip install autopep8   (or black)
" And in :CocConfig:
"   "python.formatting.provider": "autopep8",
"   "[python]": { "editor.formatOnSave": true }
" prerequesits: fzf, ripgrep, node, python, pip, installed on the system.

" Settings and autocmds:
filetype plugin indent on
autocmd BufWritePre *.py silent! call CocAction('format')

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:ranger_replace_netrw = 1

" All the keymap:

" when completion suggestion pops up - tab and enter, up, down
let mapleader=" "
inoremap <expr> <Down>  coc#pum#visible() ? coc#pum#next(1)    : "\<Down>"
inoremap <expr> <Up>    coc#pum#visible() ? coc#pum#prev(1)    : "\<Up>"
inoremap <expr> <Tab>   coc#pum#visible() ? coc#pum#next(1)    : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1)    : "\<S-Tab>"
"inoremap <expr> <Right> coc#pum#visible() ? coc#pum#confirm()  : "\<Right>"
"inoremap <expr> <Left>  coc#pum#visible() ? coc#pum#cancel()   : "\<Left>"
inoremap <expr> <CR>    coc#pum#visible() ? coc#pum#confirm()  : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()

" Go Definition - gd
nmap <leader>gd <Plug>(coc-definition)
" Go Type - gt
nmap <leader>gt <Plug>(coc-type-definition)
" Go Implemenation - gi
nmap <leader>gi <Plug>(coc-implementation)
" Go Reference - gr
nmap <leader>gr <Plug>(coc-references)
" ReName - rn
nmap <leader>rn <Plug>(coc-rename)
" ReFactor - rf
nmap <leader>rf <Plug>(coc-refactor)


" Files Project - fp
nnoremap <leader>fp :RG<CR>
" Files Fast - ff
nnoremap <leader>ff :FZF<CR>
" Files Ranger - fr
nnoremap <leader>fr :Ranger<CR>
" Files Startify - fs
nnoremap <leader>fs :Startify<CR>
" Files Coc - fc
nnoremap <leader>fc :CocCommand explorer --position floating<CR>
" Control+F for Find in nerdtree
nnoremap <C-f> :NERDTreeFind<CR>
" Control+P for search selection in root folder
nnoremap <C-p> :Rg<CR>

" Switching Buffers with Tab/Shift_Tab
nnoremap <Tab>           :bnext<CR>
nnoremap <S-Tab>         :bprevious<CR>
" Space_Tab - close buffer
nnoremap <leader><Tab>   :bdelete<CR>
" Cntrol + Arrow - switching Tabs
nnoremap <C-Left>        :tabprevious<CR>
nnoremap <C-Right>       :tabnext<CR>
" Space _ hjkl - moving between splits
nnoremap <leader>h       :wincmd h<CR>
nnoremap <leader>j       :wincmd j<CR>
nnoremap <leader>k       :wincmd k<CR>
nnoremap <leader>l       :wincmd l<CR>
nnoremap <leader>t       :terminal<CR>
" Space _ V,G - vertical and horizontal split
nnoremap <leader>V       :wincmd v<CR>
nnoremap <leader>G       :wincmd s<CR>

" Theming:
let g:airline_theme = 'distinguished'

" Tabline
let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#formatter       = 'unique_tail'
let g:airline#extensions#tabline#buf_label_first = 0

" Status bar
let g:airline_inactive_alt_sep                   = 1
let g:airline_detect_paste                       = 0
let g:airline#parts#ffenc#skip_expected_string   = 'utf-8[unix]'
let g:airline_section_x                          = ''
let g:airline_section_y                          = ''
let g:airline_section_z                          = ''

set termguicolors
syntax enable
let g:python_highlight_all = 1
set background=dark
colo srcery

" Commented out, use later:
"lua << EOF
"require("codecompanion").setup({
  "adapters = {
    "anthropic = require("codecompanion.adapters").extend("anthropic", {
      "env = { api_key = "ANTHROPIC_API_KEY" },
    "}),
  "},
  "strategies = {
    "chat = { adapter = "anthropic" },
    "inline = { adapter = "anthropic" },
  "},
"})
"EOF

"nnoremap <leader>ai :CodeCompanionChat<CR>
"nnoremap <leader>ac :CodeCompanion<CR>
"vnoremap <leader>ac :CodeCompanion<CR>
