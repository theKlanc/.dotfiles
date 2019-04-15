set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

noremap ñ l
noremap l k
noremap k j
noremap j h

set number
try
source ~/.vim_runtime/my_configs.vim
catch
endtry

filetype plugin on


source ~/.vim_runtime/shim.vim
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/suan/vim-instant-markdown.git'
Plug 'https://github.com/vim-latex/vim-latex.git'
Plug 'lervag/vimtex'
Plug 'kazimuth/dwarffortress.vim'

call plug#end()
