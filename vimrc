" VUNDLE:

	set nocompatible              " be iMproved, required
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

	" 
	Plugin 'Lokaltog/vim-easymotion'

	Plugin 'tpope/vim-capslock'
	Plugin 'scrooloose/nerdcommenter'

	" Track the engine.
	Plugin 'SirVer/ultisnips'
		" Trigger configuration. Do not use <tab> if you use
		" https://github.com/Valloric/YouCompleteMe.
		let g:UltiSnipsExpandTrigger="<c-e>"
		let g:UltiSnipsJumpForwardTrigger="<leader>j"
		let g:UltiSnipsJumpBackwardTrigger="<leader>k"
		let g:UltiSnipsListSnippets="<c-y>"
		"
		"If you want :UltiSnipsEdit to split your window.
		let g:UltiSnipsEditSplit="vertical"

		"Directories to search:
		let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]

		function! g:UltiSnips_Complete()
			call UltiSnips#ExpandSnippetOrJump()
			if g:ulti_expand_or_jump_res == 0
				if pumvisible()
					return "\<C-N>"
				else
					return "\<TAB>"
				endif
			endif

			return ""

		endfunction

		au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
		"let g:UltiSnipsJumpForwardTrigger="<tab>"
		"let g:UltiSnipsListSnippets="<c-e>"
		" this mapping Enter key to <C-y> to chose the current highlight item 
		" and close the selection list, same as other IDEs.
		" CONFLICT with some plugins like tpope/Endwise
		inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

	" Snippets are separated from the engine. Add this if you want them:
	Plugin 'honza/vim-snippets'
	Plugin 'altercation/vim-colors-solarized'

	Plugin 'bling/vim-airline'
	Plugin 'Valloric/YouCompleteMe'
	"Plugin 'pangloss/vim-javascript' " seems to insert stupid spaces for
	"identation, or causes something else to inser them. 

	Plugin 'marijnh/tern_for_vim'
		let g:tern#command = ["nodejs", expand('<sfile>:h') . '/../node_modules/tern/bin/tern', '--no-port-file']

	Plugin 'AndrewRadev/simple_bookmarks.vim'
		" Bookmark
		" GotoBookmark
		" DelBookmark
		" CopenBookmarks

		"Notice trailing space after both commands:
		nnoremap <leader>B :Bookmark 
		nnoremap <leader>gb :GotoBookmark 

	Plugin 'kien/ctrlp.vim'
		let g:ctrlp_map = '<c-p>'
		let g:ctrlp_cmd = 'CtrlP'

		let g:ctrlp_working_path_mode = '.'

		let g:ctrlp_open_new_file = 't' "ctrl-y to create
		
		let g:ctrlp_custom_ignore = {
		  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
		  \ 'file': '\v\.(exe|so|dll)$',
		  \ 'link': 'some_bad_symbolic_links',
		  \ }

		let g:ctrlp_prompt_mappings = {
		    \ 'AcceptSelection("e")': ['<c-e>'],
		    \ 'AcceptSelection("t")': ['<cr>'],
		\ }
	Plugin 'vim-scripts/dbext.vim'

	" The following are examples of different formats supported.
	" Keep Plugin commands between vundle#begin/end.
	" plugin on GitHub repo
	"Plugin 'tpope/vim-fugitive'
	"" plugin from http://vim-scripts.org/vim/scripts.html
	"Plugin 'L9'
	"" Git plugin not hosted on GitHub
	"Plugin 'git://git.wincent.com/command-t.git'
	"" git repos on your local machine (i.e. when working on your own plugin)
	"Plugin 'file:///home/gmarik/path/to/plugin'
	"" The sparkup vim script is in a subdirectory of this repo called vim.
	"" Pass the path to set the runtimepath properly.
	"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	"" Avoid a name conflict with L9
	"Plugin 'user/L9', {'name': 'newL9'}
	

	Bundle 'https://github.com/neilagabriel/vim-geeknote'
		autocmd Filetype geeknote call SetGeeknoteOptions()
		function SetGeeknoteOptions()
			set expandtab smarttab
			set shiftwidth=2 
			set tabstop=8 
			set softtabstop=0 
		endfunction
	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
	"runtime bundle/pathogen/autoload/pathogen.vim "So that pathogen itself can be kept in ./bundle as a submodule
	"execute pathogen#infect()
"END VUNDLE
"____________________________________________________________________________________________________

"CUSTOM_FUNCTIONAL:
	scriptencoding utf-8
	set encoding=utf-8

	syntax on

	filetype indent plugin on 

	set autoindent

	set smartcase "search case insensitive if no upper, otherwise sensitive, add \c or \C to override

	let mapleader = ','
	let maplocalleader = '\\'

	set splitbelow
	set splitright

"END CUSTOM_FUNCTIONAL
"---------------------------------------------------------------------------------------------------- 

"CUSTOM_APPEARANCE:
	set background=dark
	colorscheme solarized

	set tabstop=4
	set shiftwidth=4

	set so=22 "scrolloff

	set t_Co=256 " needed for airline/powerline

	set noshowmode "power/airline has mode indicator, disable native

	set colorcolumn=80 " color 80th column, so easier to see where to break lines
"END CUSTOM_APPEARANCE
"----------------------------------------------------------------------------------------------------


"CUSTOM_MAPPINGS:
	inoremap jk <esc>

	nnoremap <leader>b :buffer 

	nnoremap <leader>ev :vsplit $MYVIMRC<cr>
	nnoremap <leader>sv :source $MYVIMRC<cr>
	"nnoremap <leader>evl :vsplit ~/.vimrclocal<cr>

	nnoremap @so :tabn<CR>
	inoremap @so <ESC>:tabn<CR>
	nnoremap @si :tabp<CR>
	inoremap @si <ESC>:tabp<CR>

	inoremap <leader>u <esc>vBg~Ea
	inoremap <leader>um <esc>mxg~`z`xi

	nnoremap <leader>sp :setlocal spell! spelllang=en_us<CR>

	vnoremap <leader>qq <esc>`<i"<esc>`>a"<esc>


	nnoremap <leader>dt i===========\|<esc>"=strftime("%a %D %T %Z")<CR>pa\|=================<CR>T:<CR>CH:<CR>HW:<CR>Note:<CR>=======================================================<esc>
	"inoremap <leader>dt ===========\|<C-R>=strftime("%c")<CR>\|===========<CR>T:<CR>CH:<CR>HW:<CR>Note:<CR>=======================================================<esc>
"END CUSTOM_MAPPINGS

"PER_FILE:
	augroup VagrantfileAUGroup
		au! BufRead,BufNewFile,BufEnter Vagrantfile set expandtab smarttab tabstop=2 shiftwidth=2
	augroup END

"ABBREVIATIONS:

	iabbrev splitcode ____________________________________________________________________________________________________
	iabbrev doublesplit ====================================================================================================
	iabbrev dashsplit ----------------------------------------------------------------------------------------------------
	iabbrev plussplit ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	iabbrev testtext This is test text. It ConTAINS DifFerEnt CaSE LattERS, and some 09876543212323445 numbers 1;
	iabbrev amnt. amount
	iabbrev avg. average
	iabbrev gov. government
	iabbrev usa U.S.A.
	iabbrev op. operator
	iabbrev func. function
	iabbrev diff. differen
	iabbrev var. variable
	iabbrev lang. language
	iabbrev attr. attribute
	iabbrev expr. expression
	iabbrev num. number
	iabbrev val. value
	iabbrev obj. object
	iabbrev sys. system
	iabbrev dept. department
	iabbrev alg. algorithm
"END ABBREVIATIONS
"----------------------------------------------------------------------------------------------------


"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
"PLUGINS:

"EASY MOTION
	nmap <leader>w <leader><leader>w
	nmap <leader>e <leader><leader>e
	"nmap <leader>k <leader><leader>k
	"nmap <leader>j <leader><leader>j
"END EASY MOTION
"---------------------------------------------------------------------------------------------------- 

"Latex plugin 
	"REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
	filetype plugin on

	" IMPORTANT grep will sometimes skip displaying the file name if you
	" search in a singe file. This will confuse Latex-Suite. Set your grep
	" program to always generate a file-name.
	set grepprg=grep\ -nH\ $*

	" OPTIONAL This enables automatic indentation as you type.
	filetype indent on

	" OPTIONAL Starting with Vim 7, the filetype of empty .tex files defaultsto
	" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
	" The following changes the default filetype back to 'tex':
	let g:tex_flavor='latex'

"end Latex plugin 
"---------------------------------------------------------------------------------------------------- 


"Airline:
	"set laststatus=2
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_powerline_fonts = 1
	set nocompatible   " Disable vi-compatibility
	set laststatus=2   " Always show the statusline

"END powerline
"----------------------------------------------------------------------------------------------------


"YCMComplete:
	let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"END YCMComplete
"---------------------------------------------------------------------------------------------------- 


"ULTISNIPS 
	
"END ULTISNIPS
"---------------------------------------------------------------------------------------------------- 


"CAPSLOCK_i:
	imap <C-c> <C-G>c


"+++++++++++++++++++++++++++++++++++
"source ~/.vimrclocal
