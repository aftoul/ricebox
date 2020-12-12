" Basic useful options
set rnu
set ai
set ts=4
set expandtab
set shiftwidth=4
syntax on

" LatexC command to enable auto-compilation on write
" This will look for the .LatexC file wich should
" contain the compile commands, otherwise 'pdflatex %'
" will run instead
command LatexC autocmd BufWritePost * ! ( [ -f '.LatexC' ] && sh '.LatexC' || pdflatex "%" )



" Map Ctrl-X and Ctrl-C to navigate tabs
noremap <C-X> :tabp<CR>
noremap <C-C> :tabn<CR>

" Toggle nerdtree

map <C-Y> :NERDTreeToggle<CR>

call plug#begin(stdpath('data') . '/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'preservim/nerdtree'
Plug 'maralla/completor.vim'
Plug 'tokorom/completor-shell'

call plug#end()

let g:completor_python_binary='/usr/bin/python3'

colorscheme wal
