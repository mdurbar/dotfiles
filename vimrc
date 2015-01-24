if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
NeoBundle 'dhruvasagar/vim-table-mode' "Plugin to Create Tables
NeoBundle 'kien/ctrlp.vim' " Plugin for Fuzzy search of files
NeoBundle 'ervandew/supertab' " Plugin to enable easy indentation with tabbing, and omnicompletion
NeoBundle 'davidhalter/jedi-vim' " Plugin for Python autocompletion using the
"Jedi library
NeoBundle 'Townk/vim-autoclose' " Plugin to auto-close braces, brackets and other things
NeoBundle 'blink/vim-airline' " statusline plugin
NeoBundle 'scrooloose/syntastic' " syntax checking plugin
NeoBundle 'scrooloose/nerdtree' " File tree manager
NeoBundle 'nvie/vim-flake8' " Python flake* file checking
NeoBundle 'mbadran/headlights' " GUI plugin, that shows all plugins in MacVim
NeoBundle 'airblade/vim-gitgutter' " Plugin showing file changes made
NeoBundle 'tpope/vim-fugitive' " Git in Vim
NeoBundle 'Yggdroot/indentLine' " Indentation lines
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-surround'
NeoBundle 'xolox/vim-misc'
 "NeoBundle 'xolox/vim-easytags'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-commentary'
"NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'chrisbra/Colorizer'
" NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'bolasblack/csslint.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'JulesWang/css.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'miripiruni/CSScomb-for-Vim.git'
NeoBundle 'honza/vim-snippets'
NeoBundle 'altercation/vim-colors-solarized'

 "Adding some plugins for WordPress.vim, basically ones that might be
 "dependencies
NeoBundle 'tpope/vim-markdown'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'vim-scripts/php.vim-html-enhanced'
NeoBundle 'dsawardekar/wordpress.vim'
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
filetype plugin on
filetype plugin indent on
 " Adding custom indentation based on the type of file maybe should consider
 " changing this to the seperate folder as recommended at some point
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
" autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType php setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2

" Some settings for enabling syntax, setting background, theme and filetype
" indent
syntax enable
set background=dark
colorscheme solarized
set showcmd
set hidden
set number
set modelines=0
set nomodeline
set ruler
set wildmode=list:full
set laststatus=2
set autoindent
set backspace=indent,eol,start
set t_Co=256
set timeout
set timeoutlen=500
set ttimeoutlen=500
set synmaxcol=512
set encoding=utf-8
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc
"set statusline+=%-10.3n\
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set nowrap
set smarttab
set title
set pastetoggle=<F2>

 " Custom Mappings
nmap <F8> :TagbarToggle<CR>
" Quit NERDTree if it is the las buffer there
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Ultisnips
" switch triggers to maintain compatibility with SuperTab & YCM
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>""

" Ctrlp
set wildignore+=vendor/*,docs/*,node_modules/*,components/*,build/*,dist/*

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
" tree view
let g:netrw_liststyle = 3

if has('gui_running')
	set spell spelllang=en_gb
	set antialias
	set guicursor+=a:blinkon0    " disable cursor blink
	set guioptions-=r   "kill right scrollbar
	set guioptions-=l   "kill left scrollbar
	set guioptions-=L   "kill left scrollbar multiple buffers
	set guioptions-=T   "kill toolbar "
	set guifont=SauceCode:20
	set spell spelllang=en_gb
	set background=dark

	" My Bundles here:
	" Refer to |:NeoBundle-examples|.
	NeoBundle 'mikewest/vimroom'
	NeoBundle 'reedes/vim-pencil'
	NeoBundle 'reedes/vim-colors-pencil'

	colorscheme pencil
 	let g:airline_theme = 'pencil'
 	let g:airline#extensions#tabline#enabled = 0
	let g:airline_left_sep='  '
	let g:airline_right_sep='  '
 	let g:airline_powerline_fonts= 0
	let g:airline#extensions#tabline#enabled = 0
else
	 " If there are uninstalled bundles found on startup,
	 " this will conveniently prompt you to install them.
	 NeoBundleCheck

	 " Airline settings, turned on powerline fonts, tabline extension on
	 " hunks for showing changes in code, and syntastic for syntex errors
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#hunks#enabled=1
	let g:airline#extensions#syntastic#enabled = 0
	 "Special Character for indentation lines
	let g:indentLine_char = ''
	"set list lcs=tab:\|\
	"set expandtab
	 " Initializing Colorizer
	let g:colorizer_auto_color = 1

	 "Settings to turn on spellchecking
	 " Changing the look of the terminal based on if its in normal mode or insert
	 " mode
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	" upon hitting escape to change modes,
	" " send successive move-left and move-right
	" " commands to immediately redraw the cursor
	inoremap <special> <Esc> <Esc>hl
	"
	" " don't blink the cursor
	set number
	set guicursor+=i:blinkwait0
endif

" omnicompletion config
set completeopt=menu,menuone,longest
set pumheight=15
" }}}1

