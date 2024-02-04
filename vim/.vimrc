set nocompatible

filetype on

syntax on

set wrap

set smartcase

set number relativenumber
set nu rnu

set showcmd
set showmode
set showmatch
set hlsearch
set history=1000

if version >= 703
	set undodir=~/.vim/backup
	set undofile
	set undoreload=10000
endif
