"For Vundle filetype is initiate
filetype on
filetype off
"end Vundle initiation at macOSX

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.

set nocompatible

set showcmd     "show incomplete cmds down the bottom
set hlsearch    "hilight searches by default
set number      "add line numbers
set ruler       "add line, column number
set encoding=utf-8
set linespace=4 "add some line space for easy reading

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"turn on syntax highlighting
syntax on

"Vundle setting start

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-rails.git' (for example)
Bundle 'scrooloose/snipmate-snippets.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-sleuth.git' 
" >>> Detect & Set file's indentation style automatically

" vim-scripts repos
" Bundle 'L9'(for example)
"
Bundle 'snipMate'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'vcscommand.vim'
Bundle 'endwise.vim'
Bundle 'closetag.vim'
Bundle 'AutoClose'
Bundle 'AutoComplPop'
Bundle 'ruby-matchit'
Bundle 'matchit.zip'
Bundle 'Command-T'

"color setting
Bundle 'jellybeans.vim'
set term=xterm-256color
try
  colorscheme jellybeans
catch /^Vim\%((\a\+)\)\=:E185/
  "nothing
endtry
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'(for example)

filetype plugin indent on

"Vundle setting end

"Global leader key setting to spacebar(default: '\')
let mapleader = " "
"Local setting for NERDTree(Navigator) 
silent! nmap <silent> <leader>n :NERDTreeToggle<CR>
"Local strring for NERDCommenter
vmap <leader>c <plug>NERDCommenterAlignLeft
vmap <leader>x <plug>NERDCommenterUncomment
let NERDRemoveExtraSpaces=0

"snipmate-snippets setting
"   at the ~/.vim/bundle/snipmate-snippets/
"   rake deploy_local

"Setting for AutoComplPop
"Only restriction is snipMate shortcut is used only Capital letter
let g:acp_mappingDriven = 0
function! InsertTabWrapper()
let col = col('.') – 1
if !col || getline('.')[col-1]!~'\k'
return "\<TAB>"
else
if pumvisible()
return "\<C-N>"
else
return "\<C-N>\<C-P>"
end
endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

hi Pmenu ctermbg=blue
hi PmenuSel ctermbg=yellow ctermfg=black
hi PmenuSbar ctermbg=blue
"End AutoComplPop"

"CommandT settings
let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxHeight=15
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif
