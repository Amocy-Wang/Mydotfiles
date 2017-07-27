set rtp+=~/.vim/bundle/vundle/

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
call vundle#end()

set nocompatible

if has("syntax")
  syntax on
endif

set nu!
filetype on
set history=2000
set background=dark

syntax on
set tabstop=2
set shiftwidth=2
set showmatch
set ruler
set nohls
set incsearch
set noautoindent
set nosmartindent
set nocindent
map <c-]> g]

" convert tab to spaces
set expandtab

set tag=./tags;,tags
set autochdir

"let Tlist_Auto_Open = 0
let Tlist_Ctags_Cmd = '/usr/bin/ctags'  
let Tlist_Show_One_File = 1     
let Tlist_Exit_OnlyWindow = 1
