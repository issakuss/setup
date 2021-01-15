"" --- PlugIn ---
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tomasr/molokai'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdtree'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()


"" --- Basic settings ---
inoremap <silent> jk <ESC>
tnoremap jk <C-\><C-n>
nnoremap <F5> :w<CR>:let pypath=expand("%")<CR>:split<CR>:term<CR>ipython3 <C-\><C-n>"=pypath<CR>pi<CR>
nnoremap <F6> :split<CR>:resize 10<CR>:term<CR>iipython<CR>
set relativenumber
set number
set hlsearch
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,(,{,[
set encoding=utf-8
set colorcolumn=80
set clipboard+=unnamed
set splitright

"" --- Plugin setting ---
"tomasr/molokai
colorscheme molokai
set t_Co=256

"vim-syntastic/syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args = '--ignore=E402,E221,E241'

"preservim/nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"tpope/vim-fugitive
nnoremap \gst :Gstatus<CR>
nnoremap \gad :Gwrite<CR>
nnoremap \gco :Gcommit<CR>
nnoremap \gbl :Gblame<CR>

"davidhalter/jedi-vim
"autocmd FileType python setlocal completeopt-=preview
set completeopt-=preview
let g:jedi#completions_enabled = 0