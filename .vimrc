" vaguely rational way, without forcing anyone into a specific useage pattern.
" half the fun is working out what works for you and what doesn't!
" however alot of the stuff in this base file is highly unlikely to change
" anything here that doesn't have a detailed enough explanation for you, then
" you need to learn the magic of :help <anything you want to know>


" VUNDLE
" this is a pretty stronk package manager for vim, you will see a few others
" mentioned such as pathogen or vim-addon-manager, they do basically the same
" thing. you should read this if you want to install plugins or scripts etc:
" https://github.com/gmarik/Vundle.vim
set nocompatible " so Vi (the precursor to Vim) is pretty bad, we don't want that.

filetype off "don't delete from here...

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'

" below are some plugins to make your life easier. uncomment and :BundleInstall
" when you feel brave enough. they are all pretty frickin usefull.
" Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'jpythonfold.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter'
Plugin 'hdima/python-syntax'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chase/vim-ansible-yaml'
Plugin 'Kazark/vim-SimpleSmoothScroll'
Plugin 'scrooloose/syntastic'
Plugin 'duff/vim-scratch'
Plugin 'Raimondi/delimitMate'
Plugin 'mazubieta/gitlink-vim'
Plugin 'Lokaltog/vim-easymotion'

filetype plugin indent on " ....to here.
filetype plugin on

" Get running OS
let os = ""
if has("win32")
  let os="win"
else
  if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      let os="mac"
    else
      let os="unix"
    endif
  endif
endif

"general settings
syntax enable
set t_Co=256
set background=dark
colorscheme monokai 
let g:molokai_original = 1
let g:rehash256 = 1

let NERDTreeQuitOnOpen = 0

"sanity settings
set backspace=indent,eol,start "makes backspacing non retarded
set scrolloff=3 "the number of lines before the end of the window.
set showmode "don't remember what this does
set hidden "lets you navigate away from buffer with unsaved changes
set encoding=utf-8 "because foreigners happened
set wildmenu "this changes things in the ':' menu, you'll like it.
set wildmode=longest:full,full
set visualbell "as in not audiobell that is basically a bell... ANNOYING!
set ttyfast "terminals are now fast, wow!
set undofile "saves an undo file

"sane search settings
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"this makes <Tab> make sense
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" line numbers
set relativenumber
set number

"mouse and things
set mouse=a
map <ScrollWheelUp> 3<C-Y>
map <ScrollWheelDown> 3<C-E>

" Pawel says this is important
noremap Q <nop>

"status line
set laststatus=2

" so stock vim does silly thing that you don't want. load this up (twice)
" never think about it again.
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
   call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
   call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
   call mkdir(expand(&directory), "p")
endif

"auto set clipboard
set clipboard=unnamed
if os == 'unix'
    set clipboard=unnamedplus
endif

"nerd tree stuff
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" ctrl p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" mapder to space
let mapleader = "\<Space>"

autocmd FileType python source ~/.vim/bundle/jpythonfold.vim/syntax/jpythonfold.vim

" match tmux
highlight Pmenu ctermfg=231 ctermbg=72  guibg=#407197

" Remap arrows to learn"
nnoremap   <Up>     :call system('say penis')<CR>
nnoremap   <Down>   :call system('say cock')<CR>
nnoremap   <Left>   :call system('say dong')<CR>
nnoremap   <Right>  :call system('say Johnson')<CR>
inoremap  <Up>     :call system('say Never Going To')<CR>
inoremap  <Down>   :call system('say Give You Up')<CR>
inoremap  <Left>   :call system('say Never going to')<CR>
inoremap  <Right>  :call system('say Let You down')<CR>


" folding and things
nnoremap <leader><leader> za
nnoremap <leader>r zr
nnoremap <leader>m zm
nnoremap <leader>k zk
nnoremap <leader>j zj

" write files
nnoremap <Leader>w :w<CR>

" buffer swap
nnoremap <leader><Tab> <C-^>

let python_highlight_all = 1

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225,E226,E265,E401,E122'

" ycm
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

autocmd FileType python abbreviate print logger.debug(" %r"

"git link
nmap <leader>gl :echo gitlink#GitLink()<CR>
command GitLink :echo gitlink#GitLink()

"easymotion
map <Leader> <Plug>(easymotion-prefix)
