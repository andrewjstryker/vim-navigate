"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
" Construct navigate states with cursor and related key mappings.
" Currently buffer, window and quick fix states are defined.
"
" File:  navigate.vim
" Last Modified:  2007 April 24
" Version:  1.0 (first public release)
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

" total number of defined navigate states
let s:defined_states = 4

" leave key mappings alone as a safe default choice (and store this locally)
if exists("g:navigate_state")
  let s:state = g:navigate_state
else
  let s:state = 0
endif

" tell the user about changing navigate states unless this is not wanted
if !exists("g:navigate_announce")
  let g:navigate_announce = 1
endif

" (forward) cycle through navigate states
if !hasmapto("<Plug>NavigateCycle")
  nmap <silent> <unique> <Leader>n <Plug>NavigateCycle
endif
noremap <unique> <script> <Plug>NavigateCycle <SID>Cycle
noremap <SID>Cycle :call <SID>Cycle(g:navigate_announce)<CR>

" (reverse) cycle through navigate states
if !hasmapto("<Plug>ReverseNavigateCycle")
  nmap <silent> <unique> <Leader>N <Plug>ReverseNavigateCycle
endif
noremap <unique> <script> <Plug>ReverseNavigateCycle <SID>ReverseCycle
noremap <SID>ReverseCycle :call <SID>ReverseCycle(g:navigate_announce)<CR>

" gVim menu
if has("gui")
  if !exists("g:navigate_top_menu")
    let g:navigate_top_menu = "."
  endif
  silent noremenu Navigate.Normal <SID>NormalNavigate
  silent noremap <SID>NormalNavigate
	\ :call <SID>NormalNavigate(g:navigate_announce)<CR>
  silent noremenu Navigate.Tabs <SID>BufferTabs
  silent noremap <SID>BufferTabs
	\ :call <SID>BufferTabs(g:navigate_announce)<CR>
  silent noremenu Navigate.Buffers <SID>BufferNavigate
  silent noremap <SID>BufferNavigate
	\ :call <SID>BufferNavigate(g:navigate_announce)<CR>
  silent noremenu Navigate.Windows <SID>WindowNavigate
  silent noremap <SID>WindowNavigate
	\ :call <SID>WindowNavigate(g:navigate_announce)<CR>
  silent noremenu Navigate.Quick\ Fix <SID>QuickFixNavigate
  silent noremap <SID>QuickFixNavigate
	\ :call <SID>QuickFixNavigate(g:navigate_announce)<CR>
endif

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
  let s:state = 0
endfunction

function! s:BufferTabs(announce)
  noremap <Del> :tabclose<CR>
  noremap <Home> :tabfirst<CR>
  noremap <End> :tablast<CR>
  noremap <PageUp> <PageUp>
  noremap <PageDown> <PageDown>
  noremap <Up> <Up>
  noremap <Left> :tabprevious<CR>
  noremap <Right> :tabnext<CR>
  noremap <Down> :tabonly<CR>
  if a:announce
    echo "Tab navigation"
  endif
  let s:state = 1
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
  let s:state = 2
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
  let s:state = 3
endfunction

function! s:QuickFixNavigate(announce)
  noremap <Del> <Del>
  noremap <Home> :cfirst<CR>
  noremap <End> :clast<CR>
  noremap <PageUp> <PageUp>
  noremap <PageDown> <PageDown>
  noremap <Up> :clist<CR>
  noremap <Left> :cprevious<CR>
  noremap <Right> :cnext<CR>
  noremap <Down> <Down>
  if a:announce
    echo "Quick Fix navigation"
  endif
  let s:state = 4
endfunction

function! s:ChangeState(announce)
  if s:state == 1
    call s:BufferTabs(a:announce)
  elseif s:state == 2
    call s:BufferNavigate(a:announce)
  elseif s:state == 3
    call s:WindowNavigate(a:announce)
  elseif s:state == 4
    call s:QuickFixNavigate(a:announce)
  " put new navigate states here
  else
    call s:NormalNavigate(a:announce)
  endif
endfunction

function! s:Cycle(announce)
  let s:state = s:state + 1
  if s:state >= s:defined_states
    let s:state = 0
  endif
  call s:ChangeState(a:announce)
endfunction

function! s:ReverseCycle(announce)
  let s:state = s:state - 1
  if s:state < 0
    let s:state = s:defined_states - 1
  endif
  call s:ChangeState(a:announce)
endfunction

call s:ChangeState(0) " announcing at start-up makes Vim wait for input

let &cpo = s:save_cpo

" vim:sw=2
