" ── Core settings ────────────────────────────────────────────────────────────
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
set colorcolumn=100
set cursorline
set scrolloff=5
set clipboard=unnamedplus
set nu rnu
set splitbelow
set splitright
let mapleader=" "
set switchbuf=usetab

" ── Buffer / window / tab navigation ──────────────────────────────────────────
nnoremap <Tab>           :bnext<CR>
nnoremap <S-Tab>         :bprevious<CR>
nnoremap <leader><Tab>   :bdelete<CR>
nnoremap <leader><S-Tab> :buffers<CR>
nnoremap <C-Left>        :tabprevious<CR>
nnoremap <C-Right>       :tabnext<CR>
nnoremap <leader>h       :wincmd h<CR>
nnoremap <leader>j       :wincmd j<CR>
nnoremap <leader>k       :wincmd k<CR>
nnoremap <leader>l       :wincmd l<CR>
nnoremap <leader>t       :terminal<CR>
nnoremap <leader>V       :wincmd v<CR>
nnoremap <leader>G       :wincmd s<CR>

filetype plugin indent on

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:ranger_replace_netrw = 1

call plug#begin('~/.vim/plugged')
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'mhinz/vim-startify'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ap/vim-css-color'
Plug 'rebelot/kanagawa.nvim'
Plug 'vim-python/python-syntax'
Plug 'EdenEast/nightfox.nvim'
Plug 'morhetz/gruvbox'
Plug 'tribela/vim-transparent'
Plug 'nvim-lua/plenary.nvim'
Plug 'olimorris/codecompanion.nvim'
call plug#end()

" ── CoC completion ────────────────────────────────────────────────────────────
" ── CoC completion ────────────────────────────────────────────────────────────
inoremap <expr> <Down>  coc#pum#visible() ? coc#pum#next(1)    : "\<Down>"
inoremap <expr> <Up>    coc#pum#visible() ? coc#pum#prev(1)    : "\<Up>"
inoremap <expr> <Right> coc#pum#visible() ? coc#pum#confirm()  : "\<Right>"
inoremap <expr> <Left>  coc#pum#visible() ? coc#pum#cancel()   : "\<Left>"
inoremap <expr> <CR>    coc#pum#visible() ? coc#pum#confirm()  : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <Tab>   coc#pum#visible() ? coc#pum#next(1)    : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1)    : "\<S-Tab>"

inoremap <silent><expr> <C-Space> coc#refresh()

" ── CoC – Python: use Pylance (pyright) ───────────────────────────────────────
" Install once with:  :CocInstall coc-pyright
" coc-pyright gives type-aware completions, hover docs, and go-to-def for Python.

" ── PEP 8 – auto-format Python on save ───────────────────────────────────────
" Requires:  pip install autopep8   (or black)
" And in :CocConfig:
"   "python.formatting.provider": "autopep8",
"   "[python]": { "editor.formatOnSave": true }
autocmd BufWritePre *.py silent! call CocAction('format')

" ── CoC go-to actions ─────────────────────────────────────────────────────────
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" ── Airline – minimal / quiet ─────────────────────────────────────────────────
let g:airline_theme = 'distinguished'

" Tabline
let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#formatter       = 'unique_tail'
let g:airline#extensions#tabline#left_sep        = ' '
let g:airline#extensions#tabline#left_alt_sep    = '|'
let g:airline#extensions#tabline#show_tab_count  = 0
let g:airline#extensions#tabline#show_splits     = 0
let g:airline#extensions#tabline#buf_label_first = 0
let g:airline#extensions#tabline#show_buffers    = 1

" Status bar
let g:airline_skip_empty_sections                = 1
let g:airline_inactive_alt_sep                   = 1
let g:airline_detect_paste                       = 0
let g:airline#parts#ffenc#skip_expected_string   = 'utf-8[unix]'
let g:airline_section_y                          = ''
let g:airline_section_z                          = '%3l:%-2c'
let g:airline_section_b = '%{fnamemodify(getcwd(), ":~")}  %{get(b:, "coc_git_status", "")}'

" ── Search shortcuts ──────────────────────────────────────────────────────────
nnoremap <leader>fs :RG<CR>
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>r :Ranger<CR>
nnoremap <leader>s :Startify<CR>
nnoremap <leader>n :CocCommand explorer --position floating<CR>
nnoremap <C-f> :NERDTreeFind<CR>

lua << EOF
require("codecompanion").setup({
  adapters = {
    anthropic = require("codecompanion.adapters").extend("anthropic", {
      env = { api_key = "ANTHROPIC_API_KEY" },
    }),
  },
  strategies = {
    chat = { adapter = "anthropic" },
    inline = { adapter = "anthropic" },
  },
})
EOF

nnoremap <leader>ai :CodeCompanionChat<CR>
nnoremap <leader>ac :CodeCompanion<CR>
vnoremap <leader>ac :CodeCompanion<CR>


set termguicolors
syntax enable
let g:python_highlight_all = 1
set background=dark
colo terafox 
