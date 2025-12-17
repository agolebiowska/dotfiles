call plug#begin('~/.vim/plugged')

" Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary' " gc in visual mode comment out selected block, gcc comment current line
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'img-paste-devs/img-paste.vim'
Plug 'sillybun/vim-repl'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

" General settings
set nocompatible
set number
set cursorline
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set splitbelow
set splitright
set backspace=indent,eol,start
set termguicolors
set background=dark
set colorcolumn=80
" set clipboard=unnamed
colorscheme wildcharm
colorscheme catppuccin_macchiato
syntax on
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

" Set the Leader key
let mapleader = ","

" Indentline settings
let g:indentLine_char = '›'

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
" let g:airline_theme  = 'base16_apathy'
let g:airline_theme = 'catppuccin_macchiato'

function! AirlineModeIcon()
    let l:mode = mode()
    if l:mode ==# 'n'
        return '૮ ᴖﻌᴖა'
    elseif l:mode ==# 'i'
        return '૮ ˙Ⱉ˙ ა'
    elseif l:mode ==# 'v'
        return '૮ ⚆ﻌ⚆ა'
    elseif l:mode ==# 'V'
        return '૮ – ﻌ–ა'
    else
        let l:icons = ['ฅ՞•ﻌ•՞ฅ','૮꒰˶ᵔ ᵕ ᵔ˶꒱ა','૮₍  ˶•⤙•˶ ₎ა','૮ ˶ᵔ ᵕ ᵔ˶ ა']
        return l:icons[rand() % len(l:icons)]
    endif
endfunction

let g:airline_section_a = airline#section#create(['%{AirlineModeIcon()}', ' ', 'mode'])
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'y', 'z' ]
      \ ]

" vim-devicons settings
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

" FZF
nmap <C-p> :Files<CR>
" FZF with Ripgrep for searching within files
command! -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!{.git,node_modules,*.cache,*.log,*.h,*.sys,*.dll,*.venv}/*" '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
nnoremap <C-f> :Rg<CR>

" vimspector settings
let g:vimspector_enable_mappings = 'HUMAN'

nmap <Leader>dd :call vimspector#Launch()<CR>
nmap <Leader>de :call vimspector#Reset()<CR>
nmap <Leader>dc :call vimspector#Continue()<CR>
nmap <Leader>ds :call vimspector#StepOver()<CR>
nmap <Leader>di :call vimspector#StepInto()<CR>
nmap <Leader>do :call vimspector#StepOut()<CR>
nmap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
nmap <Leader>dw :call vimspector#AddWatch()<CR>
nmap <Leader>df :call vimspector#GetFrame()<CR>
nmap <Leader>dv :call vimspector#Evaluate()<CR>

" Goyo for distraction-free writing
nmap <Leader>z :Goyo<CR>
" REPL toggler
nmap <Leader>rt :REPLToggle<CR>
" ALE (Asynchronous Lint Engine) settings for linting and fixing
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1

" Pass command-line options to the 'black' fixer when run by ALE
let g:ale_python_black_options = '--line-length 88'

" CoC settings for autocomplete
" gd - go to definition, gr - find references, K - show hover documentation
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-html',
  \ 'coc-css'
  \ ]


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Markdown Preview settings
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_port = 8080
let g:mkdp_filetypes = ['markdown']
let g:mkdp_echo_preview_url = 1
nmap <Leader>mp :MarkdownPreview<CR>
nmap <Leader>mc :MarkdownPreviewStop<CR>
nmap <Leader>mt :MarkdownPreviewToggle<CR>

" Writing Markdown settings
" za toggle a fold your cursor is on
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_borderless_table = 1

" Pasting images
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

" Vimtex settings
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_method = 'zathura'
nmap <Leader>lc :VimtexCompile<CR>
nmap <Leader>lv :VimtexView<CR>

" Additional configurations for notes

" Daily notes
function! CreateDailyNote()
    let l:filename = strftime("%Y-%m-%d") . ".md"
    execute "edit ~/notes/daily/" . l:filename
endfunction
nmap <Leader>nd :call CreateDailyNote()<CR>
" Dev notes
function! CreateDevNote()
    let l:filename = input("DevNote name: ") . ".md"
    execute "edit ~/notes/devlog/" . l:filename
endfunction
nmap <Leader>nl :call CreateDevNote()<CR>
" Zettel notes
function! CreateZettelNote()
    let l:filename = input("Zettel name: ") . ".md"
    execute "edit ~/notes/zettelkasten/" . l:filename
endfunction
nmap <Leader>nz :call CreateZettelNote()<CR>
