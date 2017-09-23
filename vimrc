" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=D:/Software/Vim/vim80/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" /Vundle

Plugin 'ctrlp.vim'
Plugin 'The-NERD-tree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'dikiaap/minimalist'

"hilight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
"colorscheme
set t_Co=256

"key map
"nmap <A-j> :tabp<CR>
"nmap <A-k> :tabn<CR>
nmap ê :tabp<CR>
nmap ë :tabn<CR>
ca tn tabnew
ca tj tabp
ca tk tabn
imap jj <ESC>
nmap ; :
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>


set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离 
set go=
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin       " windows shortcuts

syntax on  

set autoindent  
set cindent  
  
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set showmatch  
  
set ruler  
set nu  
set nobackup
set noundofile
set nowrap

set foldmethod=indent
set foldlevel=9999
set lines=35 columns=118

set hls
set ic
set cul

set statusline=%m%r%h%w\ [TYPE=%Y]\ \ \ [POS=%l,%v]\ \ \ [%p%%]\ \ \ \ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2

"colorscheme desert
colorscheme minimalist
set guifont=Consolas:h12

set encoding=utf-8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8


map <f5> :call CompileGpp()<cr><cr>
func! CompileGpp()  
    exec "w"  
    exec "!g++ % -o %< -Wall -std=c++11"
endfunc

map <f7> :call CompileGppSocket()<cr><cr>
func! CompileGppSocket()  
    exec "w"  
    exec "!g++ % -o %< -Wall -std=c++11 -lws2_32"
endfunc

map <f8> :call MakeFile()<cr><cr>
func! MakeFile()  
    exec "cd " . expand ("%:p:h")
    while ! filereadable (getcwd () . "/makefile.bat") && getcwd () != "/"
        cd ..
    endwhile
    cd .
    exec "!makefile.bat"
    exec "cd " . expand ("%:p:h")
endfunc

map <f6> :call RunGpp()<cr><cr>
func! RunGpp()  
    exec "!%<.exe"  
endfunc

map<f9> :call ComplieAndRunGpp()<cr><cr>
func! ComplieAndRunGpp()  
    exec "w"  
    exec "!g++ % -o %< -Wall -std=c++11"  
    exec "!%<.exe"  
endfunc

