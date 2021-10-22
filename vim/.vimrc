set nocompatible       " Use Vim defaults instead of 100% vi compatibility
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" autocomplete
Plugin 'ycm-core/YouCompleteMe'
" React1
Plugin 'pangloss/vim-javascript'
" React2
Plugin 'mxw/vim-jsx'
" Salt
Plugin 'saltstack/salt-vim'
" vim-go
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required

let g:jsx_ext_required = 0      " Edit JSX tags in .js files

" Leader
let mapleader = " "

set autoindent         " Auto indent new lines
set smartindent        " Make autoindent smarter
set smarttab           " Proper indenting with <Tab>
set autowrite          " Automatically save before commands like :next and :make
set backspace=indent,eol,start " more powerful backspacing
"set cursorline         " Highlight current line
set hidden             " Hide buffers when they are abandoned
set history=50         " keep 50 lines of command line history
set ignorecase         " Wait for smartcase...
set smartcase          " Do smart case matching when searching
set incsearch          " Incremental search
set hlsearch           " Highlight search results
set list               " Show invisibles
set listchars=tab:▸-
"set mouse=a            " Enable mouse usage (all modes) in terminals
"set number             " Enable line numbers
set ruler              " show the cursor position all the time
set scrolloff=3        " Never lean to the top or bottom of the window
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set softtabstop=4 tabstop=4 shiftwidth=4 expandtab " Default whitespace settings
set viminfo='20,\"50   " read/write a .viminfo file, don't store more than 50 lines of registers
set wildmenu           " Enhanced command-line completion.
set wildmode=list:longest " Show all alternatives and complete furtherest possible.
set completeopt=menuone,longest,preview " Better completion menu
set nrformats-=octal   " Remove octal numbering
set spelllang=en_us

set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Colorscheme settings
set background=dark
set t_Co=256
set termguicolors
colorscheme badwolf

if version >= 703
    set colorcolumn=80  " Vertical line on column 80
    set undofile           " Persistent undo history
    set undodir=~/.vim/backup
    set cryptmethod=blowfish " sane encryption for :X
endif

if !exists("syntax_on")
  syntax on " Use syntax highlighting
endif

filetype plugin indent on  " Enables filetype specific stuff

augroup vimrc
  autocmd!
augroup END

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyo,.pyc,.rbc

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd vimrc BufWritePre * :%s/\s\+$//e "clean extra whitespace on write

" Retore last edit location when opening a file
autocmd vimrc BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal g'\"" | endif

" always jump to the top of commit messages
" NOTE: mercurial and bazaar use temporary files, so this isn't necessary
autocmd vimrc BufReadPost svn-commit*.tmp exe "normal! gg"
autocmd vimrc BufReadPost COMMIT_EDITMSG* exe "normal! gg"

" Highlight space errors in C/C++ source files (Vim tip #935)
let c_space_errors=1

" use tabwidth 2 in ruby files
autocmd vimrc FileType ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType json setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType sls setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType markdown set wrap

" don't hide json syntax
let g:vim_json_syntax_conceal = 0

" snazzy statusbar
set laststatus=2
let g:airline_powerline_fonts = 1  " don't forget to change term font to a Powerline-enabled font
" Workaround for leaving insert mode delay with statusline active
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=1000
  augroup END
endif

" just check for the VCS I use
let g:signify_vcs_list = [ 'git', 'svn', 'perforce', 'hg' ]

" check style in Pyhton code
autocmd BufWritePost *.py call Flake8()

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Open new split panes to right and bottom, which feels more natural
set splitright
set splitbelow

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Created binds
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>f :Vexplore<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Stop highlighting the current match
nnoremap <leader><Space> :noh<CR>
" YCM houver documentation
nmap <leader>d <plug>(YCMHover)
" YCM jumparound
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
" YAML tidy global
noremap <leader>yt ggvG:!yamltidy -<CR>
" YAML tidy partial
vnoremap <leader>yt :!yamltidy --partial -<CR>
