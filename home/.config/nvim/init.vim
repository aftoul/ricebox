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
command LatexC autocmd BufWritePost * ! ( [ -f '.LatexC' ] && sh '.LatexC' "%" || pdflatex "%" )

nnoremap <space> <C>

" Map Ctrl-C and Ctrl-X to navigate tabs
noremap <C-J> :tabp<CR>
noremap <C-K> :tabn<CR>

" Toggle nerdtree

map <C-Y> :NERDTreeToggle<CR>

call plug#begin(stdpath('data') . '/plugged')

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'zchee/deoplete-clang'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'dense-analysis/ale'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'lervag/vimtex'
Plug 'tc50cal/vim-terminal'
Plug 'fatih/vim-go'
Plug 'artur-shaik/vim-javacomplete2'

call plug#end()

autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java map <C-A> :JCgenerateAccessors<CR>
autocmd FileType java map <C-S> :JCgenerateAccessorSetter<CR>
autocmd FileType java map <C-X> :JCgenerateAccessorGetter<CR>
autocmd FileType java map <C-A-C> :JCgenerateConstructor<CR>
autocmd FileType java map <C-A-I> :JCimportAddSmart<CR>
autocmd FileType java map <C-A-M> :JCimportsAddMissing<CR>
autocmd FileType java map <C-A-R> :JCimportsRemoveUnused<CR>
autocmd FileType java map <C-A-S> :JCimportsSort<CR>
autocmd FileType java map <C-C> :JCclassNew<CR>


let g:deoplete#enable_at_startup = 1
let b:ale_fixers = ['prettier', 'eslint']
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

set background=dark
autocmd vimenter * ++nested colorscheme gruvbox
