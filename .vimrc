set nocompatible
filetype on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'edkolev/tmuxline.vim'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'docteurklein/php-getter-setter.vim'
" Plugin 'tomasiser/vim-code-dark'
" Plugin 'dracula/vim'
" Plugin 'liuchengxu/space-vim-dark'
" Plugin 'dfxyz/CandyPaper.vim'
" Plugin 'jacoborus/tender.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'lumiliet/vim-twig'

"Plugin 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

"Plugin 'Shougo/vimproc'
"Plugin 'Shougo/unite.vim'
"Plugin 'm2mdas/phpcomplete-extended'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'chase/vim-ansible-yaml'

"Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

"Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

call vundle#end()

execute pathogen#infect()

set showcmd
set term=screen-256color
set omnifunc=syntaxcomplete#Complete
filetype plugin indent on
set completeopt-=preview
set completeopt=longest,menuone
set noswapfile
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
set nu
set hlsearch
set smartindent
set tabstop=4
set shiftwidth=0
set expandtab
set softtabstop=4
set t_Co=256
set t_ut=
" set autochdir
filetype plugin on
syntax on
colorscheme onedark
"colorscheme dracula

"colorscheme space-vim-dark
"hi Comment cterm=italic

scriptencoding utf-8
set encoding=UTF-8
set laststatus=2
set updatetime=600

hi link xmlEndTag xmlTag


"NERDTree
map <F5> :CtrlPClearCache<CR>
map <C-f> :NERDTreeToggle<CR>



function! s:CloseIfOnlyControlWinLeft()
    if winnr("$") != 1
        return
    endif
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
                \ || &buftype == 'quickfix'
        q
    endif
endfunction

augroup CloseIfOnlyControlWinLeft
    au!
    au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END
"NERDTree End

set ambiwidth=double
set timeoutlen=50
"let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='onedark'
let g:airline_section_z = '%l:%c [%p%%]'
let g:airline_section_x = ''

let g:airline_powerline_fonts = 0 
let g:airline_symbols = {}
"let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ' '
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''


" let g:tmuxline_preset = {
"             \'a'       : ' #S ',
"             \'b disabled'       : '',
"             \'c disabled'       : '',
"             \'win'     : [' #W '],
"             \'cwin'    : [' * #W '],
"             \'x'        : '',
"             \'y'       : [' %A, %b %d, %l:%M %p #(battery -t)'],
"             \'z'       : [' #(whoami) '],
"             \'options' : {'status-justify': 'left'}}

"let g:tmuxline_separators = {
"            \ 'left' : '',
"            \ 'left_alt': '>',
"            \ 'right' : '',
"            \ 'right_alt' : '|',
"            \ 'space' : ''}



"let g:indentLine_color_term = 235
let g:indentLine_color_term = 240
"let g:indentLine_char = '︙'¦'┆
let g:indentLine_char = '¦'
let g:user_emmet_leader_key='<C-b>'
let g:user_emmet_expandabbr_key = '<C-c>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/vendor/**,*/node_modules/*
let g:vim_json_syntax_conceal = 0


inoremap ] ]<Esc>ma==`aa
"inoremap { {}<Esc>i
"inoremap { {<Cr>}<Esc>O


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>


let g:AutoPairs = {}


"set cursorline
"hi clear CursorLine
"augroup CLClear
"    autocmd! ColorScheme * hi clear CursorLine
"augroup END
"
"hi CursorLineNR cterm=bold
"augroup CLNRSet
"    autocmd! ColorScheme * hi CursorLineNR cterm=bold
"augroup END
"
"augroup NerdCursor
"    autocmd!
"    autocmd BufEnter NERD_tree_* hi CursorLine cterm=none ctermbg=233
"    autocmd BufLeave NERD_tree_* highlight clear CursorLine
"    autocmd BufAdd * highlight clear CursorLine
"augroup END
"
"
"
"augroup CtrlPCursor
"    autocmd!
"    autocmd BufEnter CTRL* hi CursorLine cterm=none ctermbg=233
"    autocmd BufLeave CTRL* highlight clear CursorLine
"    autocmd BufAdd * highlight clear CursorLine
"augroup END



inoremap <C-l> <?=  ?><Esc>hhha
nnoremap <silent> <C-l> :nohl<CR><C-l>


vnoremap m :Commentary<CR>


"set cursorline
"hi CursorLine   cterm=NONE ctermbg=232




" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
    if exists("g:loaded_ctrlp") && g:loaded_ctrlp
        augroup CtrlPExtension
            autocmd!
            autocmd FocusGained  * CtrlPClearCache
            autocmd BufWritePost * CtrlPClearCache
        augroup END
    endif
endfunction
if has("autocmd")
    autocmd VimEnter * :call SetupCtrlP()
endif

let g:ctrlp_max_files=0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" let g:ctrlp_cmd='CtrlP :pwd'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif



"let g:phpcomplete_index_composer_command="composer"
"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

"autocmd FileType php setlocal omnifunc=phpactor#Complete



let g:airline_powerline_fonts = 1


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif



" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1


" let g:NERDTreeDirArrowExpandable = '⭢'
" let g:NERDTreeDirArrowExpandable = '⭢'
" let g:NERDTreeDirArrowCollapsible = ''
" let g:NERDTreeDirArrowCollapsible = ''

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" let g:NERDTreeDirArrowExpandable = '➙'
" let g:NERDTreeDirArrowCollapsible = '➘'
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''

" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
" let g:WebDevIconsUnicodeDecorateFolderNodes = 0

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" set cursorline
" set cursorcolumn
"nnoremap <C-x> :FZF<CR>

autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
nnoremap <space> :noh<CR>
nnoremap <c-p> :GFiles<cr>
nnoremap <c-g> :FZF<cr>

"Remove all trailing whitespace by pressing F8
nnoremap <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd Filetype json let g:indentLine_setConceal = 0
autocmd Filetype json set conceallevel=0 

autocmd FileType help,nerdtree IndentLinesDisable
let NERDTreeMinimalUI=1

" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
