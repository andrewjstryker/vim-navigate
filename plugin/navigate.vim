"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
" Construct navigate states with cursor and related key mappings.
" Currently buffer, window and quick fix states are defined.
"
" Maintainer:  Andrew Stryker <axs@sdf.org>
"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

" ensure this has not been done before (or is not wanted)
if exists("g:navigate_loaded")
  finish
endif
let g:navigate_loaded = 1

" make sure that it is possible to sourced concatenate lines
let s:save_cpo = &cpo
set cpo&vim

"-----------------------------------------------------------------------------"
"
" Define mapping states
"
"-----------------------------------------------------------------------------"

function! s:NormalNavigate(announce)
  noremap <Del> <Del>
  noremap <Home> <Home>
  noremap <End> <End>
  noremap <PageUp> <PageUp>
  noremap <PageDown> <PageDown>
  noremap <Up> <Up>
  noremap <Left> <Left>
  noremap <Right> <Right>
  noremap <Down> <Down>
  if a:announce
    echo "Normal navigation"
  endif
  let s:state = "normal"
endfunction

function! s:TabNavigate(announce)
  noremap <Del> :tabclose<CR>
  noremap <Home> :tabfirst<CR>
  noremap <End> :tablast<CR>
  noremap <PageUp> :tabmove -<CR>
  noremap <PageDown> :tabmove +<CR>
  noremap <Up> :tabnew<CR>
  noremap <Left> :tabprevious<CR>
  noremap <Right> :tabnext<CR>
  noremap <Down> <C-W>gf<CR>
  if a:announce
    echo "Tab navigation"
  endif
  let s:state = "tab"
endfunction

function! s:BufferNavigate(announce)
  noremap <Del> :bdelete<CR>
  noremap <Home> :bfirst<CR>
  noremap <End> :blast<CR>
  noremap <PageUp> <PageUp>
  noremap <PageDown> <PageDown>
  noremap <Up> :buffer #<CR>
  noremap <Left> :bprevious<CR>
  noremap <Right> :bnext<CR>
  noremap <Down> :buffer
  if a:announce
    echo "Buffer navigation"
  endif
  let s:state = "buffer"
endfunction

function! s:WindowNavigate(announce)
  noremap <Del> <C-W>q
  noremap <Home> <C-W>t
  noremap <End> <C-W>b
  noremap <PageUp> <C-W>W
  noremap <PageDown> <C-W>w
  noremap <Up> <C-W><Up>
  noremap <Left> <C-W><Left>
  noremap <Right> <C-W><Right>
  noremap <Down> <C-W><Down>
  if a:announce
    echo "Window navigation"
  endif
  let s:state = "window"
endfunction

function! s:QuickFixNavigate(announce)
  noremap <Del> :close<CR>
  noremap <Home> :cfirst<CR>
  noremap <End> :clast<CR>
  noremap <PageUp> :copen<CR>
  noremap <PageDown> :cbottom<CR>
  noremap <Up> :clist<CR>
  noremap <Left> :cprevious<CR>
  noremap <Right> :cnext<CR>
  noremap <Down> :cwindow<CR>
  if a:announce
    echo "Quick Fix navigation"
  endif
  let s:state = "quickfix"
endfunction

"-----------------------------------------------------------------------------"
"
" Track states and function mapping
"
"-----------------------------------------------------------------------------"

let s:nav_functions = {
  \ 'normal': s:NormalNavigate,
  \ 'buffer': s:BufferNavigate,
  \ 'tab': s:TabNavigate,
  \ 'window': s:WindowNavigate,
  \ 'quickfix': s:QuickFixNavigate}

" Ordered list of states for cycling
let g:nav_states = [
  \ 'normal',
  \ 'tab',
  \ 'window',
  \ 'buffer',
  \ 'quickfix']

"-----------------------------------------------------------------------------"
"
" Manipulate cycles
"
"-----------------------------------------------------------------------------"

function! s:ForwardCycle(lst)
  return lst[1:] + lst[:0]
endfunction

function! s:ReverseCycle(lst)
  return lst[-1:] + lst[:-2]
endfunction

function! s:PickCycle(el, lst)
  while el != lst[0]
    let lst = ForwardCycle(lst)
  endwhile
  return lst
endfunction

"-----------------------------------------------------------------------------"
"
" Change state
"
"-----------------------------------------------------------------------------"

function! s:ChangeState(state, announce)
  let g:nav_states = PickCycle(state)
  call g:nav_states[0](announce)
endfunction

function! s:NextState(announce)
  let g:nav_states = ForwardCycle(g:nav_states)
  call g:nav_states[0](announce)
endfunction

function! s:ReverseState(announce)
  let g:nav_states = ReverseCycle(g:nav_states)
  call g:nav_states[0](announce)
endfunction

"-----------------------------------------------------------------------------"
"
" Map state changing functions
"
"-----------------------------------------------------------------------------"

" (forward) cycle through navigate states
if !hasmapto("<Plug>NextState")
  nmap <silent> <unique> <Leader>n <Plug>NextState
endif
noremap <unique> <script> <Plug>NavigateCycle <SID>NextState
noremap <SID>NextState :call <SID>NextState(g:navigate_announce)<CR>

" (reverse) cycle through navigate states
if !hasmapto("<Plug>ReverseNavigateCycle")
  nmap <silent> <unique> <Leader>N <Plug>ReverseNavigateCycle
endif
noremap <unique> <script> <Plug>ReverseNavigateCycle <SID>ReverseCycle
noremap <SID>ReverseCycle :call <SID>ReverseCycle(g:navigate_announce)<CR>

"-----------------------------------------------------------------------------"
"
" gVim menu
"
"-----------------------------------------------------------------------------"

" TODO: navigate_top_menu defined but not used
if has("gui")
  if !exists("g:navigate_top_menu")
    let g:navigate_top_menu = "."
  endif

  silent noremenu Navigate.Normal <SID>NormalNavigate
  silent noremap <SID>NormalNavigate
        \ :call <SID>ChangeState("normal", g:navigate_announce)<CR>

  silent noremenu Navigate.Tabs <SID>TabNavigate
  silent noremap <SID>TabNavigate
        \ :call <SID>ChangeState("tab", g:navigate_announce)<CR>

  silent noremenu Navigate.Windows <SID>WindowNavigate
  silent noremap <SID>WindowNavigate
        \ :call <SID>ChangeState("window", g:navigate_announce)<CR>

  silent noremenu Navigate.Buffers <SID>BufferNavigate
  silent noremap <SID>BufferNavigate
        \ :call <SID>ChangeState("buffer", g:navigate_announce)<CR>

  silent noremenu Navigate.Quick\ Fix <SID>QuickFixNavigate
  silent noremap <SID>QuickFixNavigate
        \ :call <SID>ChangeState("quickfix", g:navigate_announce)<CR>
endif

" leave key mappings alone as a safe default choice (and store this locally)
if exists("g:navigate_state")
  let s:state = g:navigate_state
else
  let s:state = "normal"
endif

" define an index variable
let s:state_index = 0

" tell the user about changing navigate states unless this is not wanted
if !exists("g:navigate_announce")
  let g:navigate_announce = 1
endif

call s:ChangeState(s:state, 0) " announcing at start-up makes Vim wait for input

let &cpo = s:save_cpo

" vim:sw=2
