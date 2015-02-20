" VIM-PLUG Setup {{{

" Automatic installation {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall
endif
" }}}

call plug#begin('~/.vim/plugged')

" Plugins {{{
Plug 'git://gitorious.org/vim-for-qt-kde/vim-qmake.git'
Plug 'biskark/vim-ultimate-colorscheme-utility'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/vim-operator-highlight'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Twinside/vim-haskellConceal'
Plug 'guns/xterm-color-table.vim'
Plug 'leafgarland/typescript-vim'
Plug 'idris-hackers/idris-vim'
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/limelight.vim'
Plug 'dietsche/vim-lastplace'
Plug 'oblitum/YouCompleteMe'
Plug 'embear/vim-localvimrc'
Plug 'vim-pandoc/vim-pandoc'
Plug 'junegunn/seoul256.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'marijnh/tern_for_vim'
Plug 'edkolev/tmuxline.vim'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'tikhomirov/vim-glsl'
Plug 'Shougo/vimshell.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'raichoo/haskell-vim'
Plug 'tpope/vim-obsession'
Plug 'thinca/vim-quickrun'
Plug 'Soares/longline.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-abolish'
Plug 'peterhoeg/vim-qml'
Plug 'gilligan/vim-lldb'
Plug 'bling/vim-airline'
Plug 'rizzatti/dash.vim'
"Plug 'jeaye/color_coded', { 'do': 'make' }
Plug 'oblitum/formatvim'
Plug 'junegunn/goyo.vim'
Plug 'ogier/guessindent'
Plug 'basyura/bitly.vim'
Plug 'rhysd/wandbox-vim'
Plug 'tpope/vim-eunuch'
Plug 'SirVer/ultisnips'
Plug 'ujihisa/neco-ghc'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
Plug 'oblitum/bufkill'
Plug 'morhetz/gruvbox'
Plug 'drn/zoomwin-vim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'vim-jp/cpp-vim'
Plug 'wting/rust.vim'
Plug 'tpope/vim-haml'
Plug 'fidian/hexmode'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'mattn/gist-vim'
Plug 'oblitum/frawor'
Plug 'fatih/vim-go'
Plug 'dahu/vimple'
Plug 'dag/vim2hs'
" }}}

call plug#end()

" Plugin Preloading {{{
runtime! plugin/sensible.vim
" }}}

" }}}

" General Settings {{{
set regexpengine=1          " set old regexp engine
set noswapfile              " No swap files
set hidden                  " hide buffer without notice
set hlsearch                " highlight the last searched term
set virtualedit=all         " let us walk in limbo
set cpoptions+=$            " dollar sign while changing
set foldmethod=marker       " folds on marks
set nowrap                  " don't wrap lines
set textwidth=80            " set expected line width to 80
set clipboard=unnamed       " for simplified clipboard copy/paste
set noshowmode              " hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowcmd               " disable blinking command feedback in bottom-right corner
set mouse=a                 " enable mouse to get scrolling
set vb t_vb=                " No visual bell
set pumheight=30            " Limit popup menu height

au InsertEnter * :let @/='' " Disable highlighted search on insert mode
au InsertLeave * :let @/='' " Enable it back
au GUIEnter * set vb t_vb=  " Enforces no visual bell for GUI

" Open QuickFix horizontally with line wrap and not avoiding long lines
au FileType qf wincmd J | setlocal wrap textwidth=0

" Preview window with line wrap and not avoiding long lines
au WinEnter * if &previewwindow | setlocal wrap textwidth=0 | endif

set wildignore+=CMakeFiles  " add ignored extension
set wildignore+=*.pyc       " add ignored extension
" }}}

" GUI Settings {{{
if has('gui_running')
    " Set default GUI font
    set guifont=monofur\ for\ Powerline:h18

    " Remove scroll bars
    set guioptions-=L
    set guioptions-=R
    set guioptions-=l
    set guioptions-=r

    " Disable toolbar
    set guioptions=-t
endif
" }}}

" Colorscheme {{{
let g:seoul256_background = 235
colors seoul256
hi! link Conceal Normal
" }}}

" File Type Settings {{{

" C++
au BufNewFile,BufRead *
            \ if expand('%:e') =~ '^\(h\|hh\|hxx\|hpp\|ii\|ixx\|ipp\|inl\|txx\|tpp\|tpl\|cc\|cxx\|cpp\)$' |
            \   if &ft != 'cpp'                                                                           |
            \     set ft=cpp                                                                              |
            \   endif                                                                                     |
            \ endif

" Go
let g:godef_split = 0
au FileType go setlocal noexpandtab

" Haskell
let g:hpaste_author = 'Francisco Lopes'
let g:syntastic_haskell_ghc_mod_args = '-g-fno-warn-type-defaults -g-fno-warn-missing-signatures'
au FileType haskell setlocal omnifunc=necoghc#omnifunc

" Ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

" Rust
let g:racer_cmd = "/opt/src/racer/target/racer"
" }}}

" Airline Setup {{{
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1
" }}}

" format.vim Setup {{{
let g:format_HTMLAdditionalCSS = '
\ @font-face {
\   font-family: "monofur";
\   src: url("http://typefront.com/fonts/825592811.eot");
\   src: local("☺"),
\        url("http://typefront.com/fonts/825592811.woff") format("woff"),
\        url("http://typefront.com/fonts/825592811.ttf") format("truetype"),
\        url("http://typefront.com/fonts/825592811.svg") format("svg");
\ }
\ body { font-family: "monofur", "Bitstream Vera Sans Mono", "DejaVu Sans Mono", Monaco, monospace; font-size:13.3pt; -webkit-font-smoothing: antialiased; }'
" }}}

" delimitMate Setup {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_quotes = "\" '"
" }}}

" YouCompleteMe Setup {{{
set completeopt-=preview
let g:ycm_confirm_extra_conf = 1

let g:ycm_register_as_syntastic_checker = 1

"YCM will put icons in Vim's gutter on lines that have a diagnostic set.
""Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers = {'haskell' : ['.']}

nnoremap <leader>h :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>e :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
" }}}

" Ultisnips Setup {{{
let g:UltiSnipsExpandTrigger = '<c-a>'
" }}}

" QuickRun Setup {{{
let g:quickrun_config = {
            \   '_': {
            \     'outputter/buffer/close_on_empty': 1
            \   },
            \   'cpp' : {
            \     'command': 'clang++',
            \     'cmdopt': '-g -O0 -Wall -Wextra -pedantic -std=c++1z -lpthread'
            \   }
            \ }
" }}}
                                                                                
" localvimrc Setup {{{
let g:localvimrc_ask = 0
" }}}

" VimShell Setup {{{
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
" }}}

" NERDTree Setup {{{

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.egg-info$', '\.DS_Store$', '^Session\.vim']
let NERDTreeShowBookmarks=1
let NERDTreeHightlightCursorline=1

" Map NERDTreeToggle to convenient key
nnoremap <silent> <c-n> :NERDTreeToggle<cr>

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>

" }}}

" CtrlP Setup {{{
nnoremap <silent> <space> :CtrlPBuffer<cr>
" }}}

" ClangFormat Setup {{{
let g:ycm_min_num_of_chars_for_completion = 1
let g:clang_format#style_options = {
            \ "AccessModifierOffset": -4,
            \ "AllowShortLoopsOnASingleLine": "false",
            \ "AllowShortBlocksOnASingleLine" : "false",
            \ "AllowShortFunctionsOnASingleLine": "None",
            \ "AllowShortIfStatementsOnASingleLine": "false",
            \ "AlwaysBreakTemplateDeclarations": "true",
            \ "DerivePointerBinding": "false",
            \ "PointerBindsToType": "false",
            \ "BinPackParameters" : "false",
            \ "ColumnLimit": 80,
            \ "Standard": "C++11" }
au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>f :ClangFormat<cr>
au FileType c,cpp,objc,objcpp noremap! <silent> <buffer> <leader>f <c-o>:ClangFormat<cr>
" }}}

" Jedi Setup {{{
let g:jedi#auto_vim_configuration = 1
let g:jedi#completions_enabled = 1
" }}}

" vim-notes Setup {{{
let g:notes_directories = ['~/Google Drive/Notes']
" }}}

" ZoomWin Setup {{{
nnoremap <leader>z :ZoomWin<CR>
" }}}

" GuessIndent Setup {{{
au BufReadPost * :GuessIndent
" }}}

" LongLine Setup {{{
let g:longline_autohl = 1
let g:longline_matchgroup = 'Visual'
" }}}

" Indent Guides Setup {{{
let g:indent_guides_enable_on_vim_startup = 0
" }}}

" Goyo Setup {{{
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

function! s:goyo_enter()
  silent !tmux set status off
endfunction

function! s:goyo_leave()
  silent !tmux set status on
endfunction

au! User GoyoEnter
au! User GoyoLeave
au  User GoyoEnter nested call <SID>goyo_enter()
au  User GoyoLeave nested call <SID>goyo_leave()

nnoremap <leader>g :Goyo<CR>
" }}}

" Fix borders of fullscreen GUI {{{
if has('gui_gtk') && has('gui_running')
    let s:border = synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
    exe 'silent !echo ''style "vimfix" { bg[NORMAL] = "' . escape(s:border, '#') . '" }'''.
                \' > ~/.gtkrc-2.0'
    exe 'silent !echo ''widget "vim-main-window.*GtkForm" style "vimfix"'''.
                \' >> ~/.gtkrc-2.0'
endif
" }}}

" Toggle Shell Pasting {{{
nnoremap <F2> :set invpaste paste?<cr>
set pastetoggle=<F2>
" }}}

" Paste block while inserting new lines to hold it {{{
function! FancyPaste(reg)
    let paste = split(getreg(a:reg), '\n')
    let spaces = repeat(' ', virtcol('.')-1)
    call map(paste, 'spaces . v:val')
    call append(line('.'), paste)
endfunction

nnoremap <leader>p :call FancyPaste('"')<cr>
nnoremap <leader>P :call FancyPaste('+')<cr>
" }}}

" Edit command output in a buffer {{{
command! -nargs=+ BufOut redir => bufout | silent <args> | redir END | new | call append(0, split(bufout, '\n'))
" }}}

" :Me[ssages] as shorthand for `:BufOut :messages' (the dominant use case of :BufOut) {{{
command! -nargs=0 Messages :redir => bufout | silent :messages | redir END | new | call append(0, split(bufout, '\n'))
" }}}

" Gist it to bl.ocks.org {{{
let g:gist_clip_command = 'pbcopy'
command! -range=% Blocks
            \ <line1>,<line2>Format format | f index.html | exe 'Gist -a' | bd!                                       |
            \ let @+ = 'http://bl.ocks.org/anonymous/raw/' . matchstr(@+, 'https://gist.github.com/\zs\w\+\ze') . '/' |
            \ let @+ = bitly#shorten(@+).url | redraw | echomsg 'Done: ' . @+ | setlocal nomodified
" }}}
