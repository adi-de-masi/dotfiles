" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc
lua require('plugins')
let mapleader = ","

nnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
nnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
nnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
nnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>
nnoremap <silent> <C-\> <Cmd>NvimTmuxNavigateLastActive<CR>
nnoremap <silent> <C-Space> <Cmd>NvimTmuxNavigateNext<CR>

nnoremap Y "+y
vnoremap Y "+y
nnoremap yY ^"+y$

nnoremap <leader>h :nohlsearch<cr>
nnoremap <leader>n :set number!<cr>
nnoremap <leader>m :MarkdownPreview<cr>
nnoremap <leader>r :set relativenumber!<cr>
nnoremap <leader>t :NERDTreeFind<cr>
nnoremap <leader>X :%!xmllint --format -<cr>
nnoremap <leader>x :%!jq .<cr>
nnoremap <leader><Tab> :bn<cr>
nnoremap <leader><S-Tab> :bp<cr>
nnoremap <leader>s :w<cr>
