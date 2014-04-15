" Must come first because it changes other options.
set nocompatible
set noswapfile

" Vundle setup
filetype off " required by Vundle 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My bundles from GitHub
Bundle 'sjl/badwolf'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'b4winckler/vim-objc'
Bundle 'msanders/snipmate.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'mileszs/ack.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'tpope/vim-repeat'
Bundle 'nono/vim-handlebars'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'pangloss/vim-javascript'
Bundle 'milkypostman/vim-togglelist'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'scrooloose/nerdtree'
Bundle 'michalliu/jsruntime.vim'
Bundle 'michalliu/jsoncodecs.vim'
Bundle 'michalliu/sourcebeautify.vim'
Bundle 'jnwhiteh/vim-golang'
Bundle 'teranex/jk-jumps.vim'
Bundle 'mattn/emmet-vim'

filetype plugin indent on " required by Vundle 


" Other configurations...

" Enable syntax highlighting
syntax on

" Sets the colorscheme for terminal sessions too.
colorscheme badwolf

" Load the matchit plugin.
runtime macros/matchit.vim

" Display incomplete commands.
set showcmd
" Display the mode you're in.
set showmode

" Intuitive backspacing.
set backspace=indent,eol,start
" Handle multiple buffers better.
set hidden

" Enhanced command line completion.
set wildmenu
" Complete files like a shell.
set wildmode=list:longest

set number
" Indentation, textwidth and colorcolumn
set autoindent smartindent

" Case-insensitive searching.
set ignorecase
" But case-sensitive if expression contains a capital letter.
set smartcase

" Show line numbers.
set number
" Show cursor position.
set ruler

" Highlight matches as you type.
set incsearch
" Don't highlight matches.
set nohlsearch

" Turn off line wrapping.
set nowrap    
" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title
" No beeping.
set visualbell

" Don't make a backup before overwriting a file.
set nobackup
" And again.
set nowritebackup
" Keep swap files in one location
set directory=$HOME/.vim/tmp//,.

" Global tab width.
set tabstop=2
" And again, related.
set shiftwidth=2
" Specific shiftwidth for ruby files
autocmd FileType ruby set shiftwidth=2
" But not for erb files...
autocmd FileType eruby set shiftwidth=4

" Show the status line all the time
set laststatus=2
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Leader = ,
let mapleader = ","

" Gui 
set guioptions=

" Look good
if has("unix")
	let s:uname = system("echo -n \"$(uname)\"")
		if !v:shell_error && s:uname == "Linux"
			set t_Co=256
			if $TERM =~ '256color'
									      " Disable Background Color Erase (BCE) so that color
												" schemes work
												"       " properly when Vim is used inside tmux and
												"       GNU screen.  See also
												"             "
												"             http://snk.tuxfamily.org/log/vim-256color-bce.html
				set t_ut=
			endif
		endif
endif

" Tab mappings.
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>e :tabedit
nnoremap <leader>c :tabclose<cr>
nnoremap <leader>o :tabonly<cr>
nnoremap <leader>f :tabfirst<cr>
nnoremap <leader>l :tablast<cr>
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>p :tabprevious<cr>
nnoremap <leader>f :tabfirst<cr>
nnoremap <leader>l :tablast<cr>

" Fugitive mappings
" (thanks to Steve Losh's vimrc)
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gm :Gmove
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gp :Git push

" Edit and load vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Toggles hlsearch
nnoremap <leader>hs :set hlsearch!<cr>

" Toggles NERDtree
noremap <leader>nt :NERDTreeToggle<CR>

let g:NERDTreeHijackNetrw = 0

" Maps <C-C> to <esc>
noremap <C-C> <esc>

" Go to start of line with H and to the end with $
nnoremap L $
nnoremap H ^

" Go to start/end of line while using operators.
onoremap L $
onoremap H ^

" Go to start/end of line while using operators.
vnoremap L $
vnoremap H ^

" Scroll without moving cursor with C-J and C-K
nnoremap <C-J> <C-e>
nnoremap <C-K> <C-y>

" Airline options
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline_section_warning = ''
let g:airline_inactive_collapse = 0
let g:airline#extensions#default#section_truncate_width = {
  \ 'a': 60,
  \ 'b': 80,
  \ 'x': 100,
  \ 'y': 100,
  \ 'z': 60,
  \ }

" CtrlP - works not only in ancestor directories of my working directory.
let g:ctrlp_working_path_mode = 'a'
" Custom ignores
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store'

" Yankring default mapping conflicts with CtrlP
let g:yankring_replace_n_pkey = '<C-M>'

" Brings Ack on Ctrl+F
noremap <C-F> :Ack!<space>

" Remaps textobj-rubyblock's bindings to vim's defaults
autocmd FileType ruby map aB ar
autocmd FileType ruby map iB ir

" Sets markdown syntax for *.md files.
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Sets javascript syntax for *.json files.
autocmd BufRead,BufNewFile *.json set filetype=javascript
"
" Sets html syntax for *.ejs files.
autocmd BufRead,BufNewFile *.ejs set filetype=html

" Wrap markdown files.
autocmd BufRead,BufNewFile *.md set wrap

" Files open expanded
set foldlevelstart=20

" Toggles folding with space
nnoremap <Space> za

" Toggle relative/absolute line counting
let g:NumberToggleTrigger="<C-l>"
