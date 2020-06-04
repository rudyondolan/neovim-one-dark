" COMMON SETUP
set encoding=utf8
scriptencoding utf-8
set clipboard=unnamed
set updatetime=250
set laststatus=2
set statusline=
set statusline+=%<%f\ %h%m%r
set statusline+=%{fugitive#statusline()}
set statusline+=%{LinterStatus()}
set statusline+=%=%-14.(%l,%c%V%)\ %P
" set showtabline=2
set history=500
set autoread
set wildmenu
set ruler
set hidden
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set nowrap
" set wrap
set matchtime=2
set scrolloff=1
set foldcolumn=1
" set signcolumn=no
set t_Co=256
set t_ut=
set mouse=a
" set number
set confirm
" set relativenumber
" set nuw=5
" set cursorline
" set cursorcolumn
" set colorcolumn=80
" set timeoutlen=1000 ttimeoutlen=0
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
set guicursor=n-v-c-i-ci-ve-r-cr-o:block
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor

let g:mapleader = ','

filetype plugin on
filetype indent on

" Use termguicolors
if (has('termguicolors'))
  set termguicolors
endif

" Display extra whitespace
set list listchars=tab:¬ª¬∑,trail:¬∑

" Enter clear search
map <Space> :nohl<CR>

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" Enable syntax highlighting
syntax on
syntax enable

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Files, backups and undo
set nobackup
set nowritebackup
set noswapfile

" Tab and indent configuration
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent

" Switching buffers
map <leader>w :bn<cr>
map <leader>q :bp<cr>
map <leader>n :enew<cr>
map <leader>x :bd<cr>

" Switching tabs
" map <leader>q :tabprevious<cr>
" map <leader>w :tabnext<cr>
" map <leader>x :tabclose<cr>
" map <leader>n :tabnew<cr>
" map <leader>h :close<cr>
" map <leader>k :bdelete<cr>

" Splitting window
map <leader>- :split<cr>
map <leader>\ :vsplit<cr>

" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" nmap <BS> <C-W>h " -> for Neovim
" map <C-l> <C-W>l

" Neovim way to move between windows
tnoremap jj <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Vim commentary
map <leader>c :Commentary<CR>

" Search for visually selected text strict mode
vnoremap // y/\C<C-R>"<CR>

" Bind jj to Esc
inoremap jj <Esc>

" Save file
map <leader>s :w<cr>

" Make VIM remember position in file after reopen
if has('autocmd')
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Shortcut edit init.vim
map <leader>e :e! ~/.config/nvim/init.vim<cr>
autocmd! bufwritepost *.vim source %

" Undo configuration
try
  set undodir=~/.config/nvim/temp_dirs/undodir
  set undofile
catch
endtry

" Python provider
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'

" Disable line on terminal emulator
au TermOpen * setlocal nonumber norelativenumber

" Installing Vim Plug
let g:vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(g:vimplug_exists)
  if !executable('curl')
    echoerr 'You have to install curl or first install vim-plug yourself!'
    execute 'q!'
  endif
  echo 'Installing Vim-Plug...'
  echo ''
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = 'yes'
  autocmd VimEnter * PlugInstall
endif

" Load plugins
call plug#begin('~/.config/nvim/plugged')
" editor
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mileszs/ack.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'flowtype/vim-flow'
Plug 'jiangmiao/auto-pairs'
Plug 'docunext/closetag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-vinegar'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-capslock'
Plug 'godlygeek/tabular'
Plug 'thaerkh/vim-workspace'
Plug 'metakirby5/codi.vim'
Plug 'edkolev/tmuxline.vim'
" colorschemes
Plug 'joshdick/onedark.vim'
" syntax color
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'jparise/vim-graphql'
call plug#end()

if !exists('g:not_finish_vimplug')
  set background=dark
  colorscheme onedark
  let g:onedark_hide_endofbuffer = 1
  let g:onedark_terminal_italics = 1
endif

" Deoplete configuration
set runtimepath+=~/.config/nvim/plugged/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
set runtimepath+=~/.config/nvim/snippets/
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Airline Configuration
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme = 'onedark'
let g:airline_extensions = ['ctrlp', 'ale', 'keymap', 'capslock', 'branch', 'tmuxline']
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'c'  : 'C',
    \ 'i'  : 'I',
    \ 'ic' : 'I',
    \ 'ix' : 'I',
    \ 'n'  : 'N',
    \ 'ni' : 'N',
    \ 'no' : 'N',
    \ 'R'  : 'R',
    \ 'Rv' : 'R',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ 't'  : 'T',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ }
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" Tmuxline
" let airline#extensions#tmuxline#color_template = 'visual'
let g:tmuxline_preset = 'nightly_fox'

" ALE configuration
let g:ale_lint_on_text_changed = 1
let g:ale_sign_error = '‚óè'
let g:ale_sign_warning = '‚óè'
" let g:ale_echo_msg_error_str = 'Err'
" let g:ale_echo_msg_warning_str = 'Warn'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" augroup FiletypeGroup
"     autocmd!
"     au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
" augroup END

let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'jsx': ['eslint'],
  \ 'scss': ['stylelint'],
  \ 'css': ['stylelint'],
  \ 'json': ['jsonlint'],
  \ 'vim': ['vint'],
  \ }
" let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'javascriptreact': ['prettier'],
  \ 'jsx': ['eslint'],
  \ 'scss': ['stylelint'],
  \ 'css': ['stylelint'],
  \ 'json': ['prettier'],
  \ }
let g:ale_fix_on_save = 1
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '[Ok]' : printf(
    \ '[%d Warn, %d Err]',
    \ l:all_non_errors,
    \ l:all_errors
    \ )
endfunction

" Enable completion where available.
" let g:ale_completion_enabled = 1

" TABULAR
if exists(':Tabularize')
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let l:p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# l:p || getline(line('.')+1) =~# l:p)
    let l:column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let l:position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',l:column).'\s\{-\}'.repeat('.',l:position),'ce',line('.'))
  endif
endfunction

" Fugitive configuration
autocmd QuickFixCmdPost *grep* cwindow


" CtrlP configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_max_height=20
let g:ctrlp_custom_ignore='node_modules\|vendor\|^\.DS_Store\|^\.git\|^\.coffee'
map <C-o> :CtrlPBuffer<cr>

" NERDTree configuration
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeWinSize=45
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
let g:NERDTreeMouseMode=3
let g:NERDTreeIgnore=['^node_modules[[dir]]']
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1

" Closetag configuration
let g:closetag_html_style=1

" Comfortable motion configuration
" let g:comfortable_motion_scroll_down_key='j'
" let g:comfortable_motion_scroll_up_key='k'
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(45)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-45)<CR>

" Vim indent guide configuration
" let g:indent_guides_enable_on_vim_startup=1

" Vim indent line configuration
" let g:indentLine_enabled=1
" let g:indentLine_char='‚Äö√Æ√á'
" let g:indentLine_concealcursor='inc'
" let g:indentLine_conceallevel=2
" let g:indentLine_setConceal=0

" Vim ack + silversearcher configuration
" TODO: brew install the_silver_searcher
let g:ackprg='ag --nogroup --nocolor --column'

" Flow configuration
let g:flow#enable=0

" Javascript Libraries Syntax configuration
" let g:used_javascript_libs='react,flux,underscore,requirejs'

" Netrw configuration
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" let g:netrw_localrmdir='rm -rf'
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" Workspace configuration
let g:workspace_autosave=0
let g:workspace_autosave_always=0
let g:workspace_persist_undo_history=0
let g:workspace_autosave_untrailspaces=0

" Buftabline configuration
" let g:buftabline_separators=1
" let g:buftabline_indicators=1
" let g:buftabline_show=0

" Italic text
" highlight Comment cterm=italic
" highlight htmlArg cterm=italic
" highlight Comment gui=italic
" highlight htmlArg gui=italic

