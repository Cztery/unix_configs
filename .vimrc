set nocompatible
filetype on
syntax on
set autochdir

set number
set cursorline
set cursorcolumn
set ruler         " Show line and column number of a cursor position

colorscheme elflord
set background=dark

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smartindent

match Error /\c\s+$/
nnoremap <leader>st :match Error /\v\t+/

set incsearch     " Makes search act like search in modern browsers

set ignorecase    " Ignore case when searching

set smartcase     " When searching try to be smart about cases 

set hlsearch      " Highlight search results

set showmatch     " Show matching brackets when text indicator is over them

set magic         " For regular expressions turn magic on

set laststatus=2  " Always show the status line

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 


map <leader>q :call ToggleNotebook()<cr>

function! ToggleNotebook()
    let l:notebook="~/buffer"
    if expand('%:p') == expand(l:notebook)
        :wq
    else
        execute "split" l:notebook
    endif
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE '
  endif
  return ''
endfunction


" Mark lines exceeding 80 characters
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
