set clipboard=unnamedplus
call plug#begin('~/.nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-pyright'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme gruvbox
"Ctrl+n para abrir NERDTree
nmap <C-n> :NERDTreeToggle<CR> 
"Para mostrar numero en el editor
set relativenumber

set encoding=utf-8

set hidden

"Have more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

"GoTo code navitation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
if (pumvisible())
	echom "si"
endif 
" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"Use <c-space> to trigger completion.
if has('nvim')
   inoremap <silent><expr> <c-space> coc#refresh()
else
   inoremap <silent><expr> <c-@> coc#refresh()
endif

"Use K to show documentation in preview window.
 nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
 if (index(['vim','help'], &filetype) >= 0)
  execute 'h '.expand('<cword>')
 elseif (coc#rpc#ready())
   call CocActionAsync('doHover')
 else
   execute '!' . &keywordprg . " " . expand('<cword>')
 endif
endfunction
