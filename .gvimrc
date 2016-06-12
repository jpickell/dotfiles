execute pathogen#infect()
syntax on
filetype indent plugin on
set gfn=Cousine:h16  
" set transparency=100
set nocompatible
set expandtab
set smarttab
set autoindent
set paste
set nonumber
set noruler
set linebreak
set background=dark
set guioptions-=r  " remove right scrollbar
set foldcolumn=2
set statusline=%F%m%r\ (%-2{&ff}){%Y}[%l,%v]\ %=%{strftime(\"%m/%d/%Y\ %A%l:%M%p\ \")}
set laststatus=2

colorscheme zen

let mapleader="\<Space>"
nnoremap <Leader>o :e .<CR>
nnoremap <Leader>z :call ZenMode()<CR>
nnoremap <Leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <Leader>d :r! date +"\%Y-\%m-\%d \%H:\%M:\%S"<CR>

" Copy & paste from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
 
:command! -nargs=1 LT call LoadTemplate(<f-args>)

" turn-on distraction free writing mode for markdown files
" au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call ZenMode()

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

:map <Leader>H mz:execute FH()`zjA

function! ZenMode()
        set lines=40 columns=100           " size of the editable area
        set laststatus=0
        if &background == "light"
                set fuoptions=background:#00f0f0e5
        else
                set fuoptions=background:#00121713
        endif
        set invfu 
endfunction
