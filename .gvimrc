syntax on
"set guifont=Menlo\ Regular:h18
set nocompatible
set path+=**
set wildmenu
set expandtab
set nonumber
set noruler
set linebreak
set tabstop=2
" set guioptions-=r " remove right scrollbar
" set lines=40 columns=100           " size of the editable area
set statusline=%F%m%r\ (%-2{&ff}){%Y}[%l,%v]\ %{wordcount().words}\ words\ %=%{strftime(\"%m/%d/%Y\ %A%l:%M%p\ \")}
set laststatus=2
set cursorline

colorscheme zen

nnoremap <Leader>d :r! date +"\%Y-\%m-\%d \%H:\%M:\%S"<CR>
nnoremap <Leader>t :r! date +"\%H:\%M:\%S"<CR>
nnoremap <Leader>j :%!jq .<CR>
nnoremap <Leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" remap the space bar to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

function! MDF()
    " Set fold values based on Markdown Headers
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    " End Markdown Header section

    " Set fold for dash and asterisk
    " if getline(v:lnum) =~ '(\-\|\*)'
    "    return ">1"
    " endif

    " Set fold values based on Timestamps
    if getline(v:lnum) =~ '[0-9][0-9]:[0-9][0-9]:[0-9][0-9]'
       return ">1"
    endif
    " End Timestamp section
    
    return "=" 
endfunction

set fen
set foldlevel=2
au BufEnter *.md setlocal fdm=expr
au BufEnter *.md setlocal foldexpr=MDF()
