syntax on
filetype indent plugin on
set nocompatible
set expandtab
set smarttab
set autoindent
set paste
set nonumber
set noruler
set linebreak
set guioptions-=r  " remove right scrollbar
set guioptions-=m  " remove menu bar 
set guioptions-=T  " remove toolbar
set foldcolumn=2
set statusline=%F%m%r\ (%-2{&ff}){%Y}[%l,%v]\ %=%{strftime(\"%m/%d/%Y\ %A%l:%M%p\ \")}
set laststatus=2
set fen
set foldlevel=2

" Initialize background color (dark or light) based on Macbook's ambient light sensor
" lmutracker from https://gist.github.com/Glavin001/76ffcca87b946aa0b550f3ca46cbe146
let lmu=system('~/bin/lmutracker')
let mylmu = substitute(lmu, '^\s*\(.\{-}\)\s*$', '\1', '')
let &background = (mylmu > 1000?"light":"dark")

colorscheme zen

" let mapleader="\<space>"
nnoremap <Leader>o :e .<CR>
nnoremap <Leader>z :call ZenMode()<CR>
nnoremap <Leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <Leader>d :r! date +"\%Y-\%m-\%d \%H:\%M:\%S"<CR>
nnoremap <Leader>t :r! date +"\%H:\%M:\%S"<CR>

" remap the space bar to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Copy & paste from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
 
:command! -nargs=1 LT call LoadTemplate(<f-args>)

function! LoadTemplate(fname)
  let g:my_template = "~/.vim/templates/" + a:fname
    r! "~/.vim/templates/" + a:fname 
endfunction

function! FH()
  let s:line=line(".")
  call setline(s:line,"/*********************************************")
  call append(s:line,"* Description - ")
  call append(s:line+1,"* Author - Jeff Pickell")
  call append(s:line+2,"* Date - ".strftime("%b %d %Y"))
  call append(s:line+3,"* *******************************************/")
  unlet s:line
endfunction

function! ZenMode()
        set lines=40 columns=100           " size of the editable area
        set laststatus=0
        set foldcolumn=12
        if &background == "light"
                set fuoptions=background:#00f0f0e5
        elseif &background == "dark"
                set fuoptions=background:#00121713
	elseif &background == "bright"
		set fuoptions=background:#ffffff
        endif
        set invfu 
endfunction

" Handle folding for Markdown 
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

    " Set fold values based on Timestamps
    if getline(v:lnum) =~ '[0-9][0-9]:[0-9][0-9]:[0-9][0-9]'
       return ">3"
    endif
    " End Timestamp section
    
    return "=" 
endfunction

set fen
set foldlevel=2
au BufEnter *.md setlocal fdm=expr
au BufEnter *.md setlocal foldexpr=MDF()
