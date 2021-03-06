colorscheme molokai
syntax on
set nocompatible
set number
set expandtab "タブ入力を空白に置き換える
set tabstop=4 "タブ入力の幅
set shiftwidth=4 "自動インデントでずれる幅
set softtabstop=4 "空白に対してタブでカーソルがずれる幅
set autoindent "改行時に前のインデントを継続する
set smartindent "改行時に入力された末尾に合わせて次の行のインデントを増減する
set cursorline
set encoding=utf-8          " デフォルトencodeをutf8とする
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,ucs2le,ucs-2
set fileformats=unix "
hi CursorLine term=underline ctermbg=234 guibg=#293739

"NeoBundle {
set nocompatible
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
endif 

" plugin
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

filetype plugin indent on
" }

" Unite.vim {{{
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Space>u [unite]

" unite.vim keymap
let g:unite_source_history_yank_enable =1
nnoremap <silent> [unite]u :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
" vinarise
let g:vinarise_enable_auto_detect = 1 
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" ag {
" grepでagを利用
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_max_candidates = 200
let g:unite_source_grep_recursive_opt = ''
" unite-grepの便利キーマップ
vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
" }
" }}}

" Previm {{{
" The prefic key.
"nmap  <Space>p :g
" }}}
augroup PrevimSettings                                                                                                                                    
    autocmd!                                                                                                                                              
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown                                                                           
augroup END

" Previm
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>
