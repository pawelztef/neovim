call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug '907th/vim-auto-save'
Plug 'vim-scripts/restore_view.vim'
Plug 'tpope/vim-surround'
Plug 'fxn/vim-monochrome'
Plug 'gosukiwi/vim-atom-dark'
Plug 'itchyny/lightline.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'mileszs/ack.vim'
Plug 'jwalton512/vim-blade'
Plug 'Shougo/deoplete.nvim'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'tpope/vim-endwise'
Plug 'vim-syntastic/syntastic'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

"-------------------------------------------------------------------------
" Basic settings
"-------------------------------------------------------------------------
let mapleader = "\<Space>"
"colorscheme monochrome
colorscheme atom-dark-256
hi CursorLine cterm=NONE ctermbg=gray ctermfg=white
set cursorline
nnoremap <Leader>c :set cursorline!<CR>
set scrolloff=25
set autoread
au CursorHold * checktime
set mouse=a
set nohlsearch
syntax on
set ruler
set cmdheight=1
set nowrap
set linebreak
set expandtab
set softtabstop=2
set shiftwidth=2

"---------------------------------------------------------------------------
" Basic mapping 
"---------------------------------------------------------------------------
"horizonatal split
nnoremap <Leader>h <C-W>s
"vertial split
nnoremap <Leader>v <C-W>v
"moving among open windows
nmap <Leader><Leader> <C-W>w
"closing
nnoremap <Leader>q :q<CR>
"mapping for indenting
nmap <F7> mzgg=G`z
imap <F7> <Esc>mzgg=G`zi
"mapping for opening new line without entering into insert mode
nmap oo o<Esc>k
nmap OO O<Esc>j
" mapping for folding
set foldmethod=manual
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
"insert new line just after cursor without entering into insert mode before
nnoremap , i<cr><Esc>k$
" mapping for folding
set foldmethod=manual
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

"---------------------------------------------------------------------------
" Caret settings
" --------------------------------------------------------------------------
"highlight Cursor  guifg=white guibg=white
"highlight iCursor guifg=white guibg=white
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

"---------------------------------------------------------------------------
" Lightline 
"---------------------------------------------------------------------------
let g:lightline = { 'colorscheme': 'Dracula', }
set noshowmode

"---------------------------------------------------------------------------
" View-save for for saving folds
"---------------------------------------------------------------------------
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']

"-------------------------------------------------------------------------
" Ack
"-------------------------------------------------------------------------
let g:ackprg = 'ag --nogroup --nocolor --column'

map <Leader>a :Ack<Space>


"---------------------------------------------------------------------------
" FzF 
"---------------------------------------------------------------------------
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

"---------------------------------------------------------------------------
" Emmet 
"---------------------------------------------------------------------------
let g:user_emmet_leader_key = '<tab>.'

"-------------------------------------------------------------------------
"  AutoSave - automatically save changes to disk without having to use :w
"-------------------------------------------------------------------------
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0

"---------------------------------------------------------------------------
" Blade 
"---------------------------------------------------------------------------
" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']
" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \ }

"-----------------------------------------------------------------------------
" Ranger
"-----------------------------------------------------------------------------
" nnoremap <Leader>n :tabe %:p:h<cr>
" map <leader>n :Ranger<CR>
map <leader>n :RangerWorkingDirectory<CR>

"-------------------------------------------------------------------------
" Deoplete 
"-------------------------------------------------------------------------
" Use deoplete.
let g:deoplete#enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', ]
"---------------------------------------------------------------------------
" Tab 
"---------------------------------------------------------------------------
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"---------------------------------------------------------------------------
" NumberToggle 
"---------------------------------------------------------------------------
set number relativenumber
nnoremap <silent> <C-l> :set relativenumber!<cr>


"---------------------------------------------------------------------------
" syntastic 
"---------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-----------------------------------------------------------------------------
"IndentLine
"--------------------------------------------------------------------------
nnoremap <Leader>x :IndentLinesToggle<CR>
let g:indentLine_faster = 1
let g:indentLine_enabled = 0
"let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_indentLevel = 60






let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
