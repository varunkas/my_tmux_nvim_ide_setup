" ------- nvim editor settings -----
syntax on
set mouse=a
set number
set relativenumber
set autoindent
set shiftwidth=4 

let mapleader = "," "setting the leader for custom shortcuts

" ----- Vim-Plug plugins ----- 
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
" Plug xxx

Plug 'preservim/nerdtree' "Directory tree
Plug 'vim-airline/vim-airline' "Status bar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

 
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ----- NERDTree settings -----
nnoremap <leader>nt :NERDTreeToggle<CR>

" ----- VIM-FZF settings -----
nnoremap <leader>zf :Files
nnoremap <leader>zg :GFiles<CR>


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
