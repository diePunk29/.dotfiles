" init.vim for DiePunk!
"

" setting the encoding
set encoding=UTF-8

" needed this setting for polyglot
set nocompatible 

" need this for polyglot
let g:polyglot_disabled = ['markdown']
let g:python3_host_prog = '/usr/bin/python3.9'

" calling vim plug
call plug#begin()

" plugin list 
" themes

" Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'

" fancy start screen for neovim
Plug 'mhinz/vim-startify'

" float term
Plug 'voldikss/vim-floaterm'

" syntax check
" Plug 'w0rp/ale'
Plug 'dense-analysis/ale'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" vim commenter
Plug 'preservim/nerdcommenter'

" indentation lines
Plug 'lukas-reineke/indent-blankline.nvim'

" Autocomplete + snippet engine
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Autocomplete pairs
Plug 'tmsvg/pear-tree'

" C/CPP autocompletion! + syntax highlighting
Plug 'Shougo/deoplete-clangx'
Plug 'bfrg/vim-cpp-modern'


" Python Completion + other tweaks
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim', { 'do': 'UpdateRemotePlugins' }
" syntax highlighting for python
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'

" Nerdtree plugin
Plug 'scrooloose/nerdTree'

" airline theme + customization
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ojroques/vim-scrollstatus'

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" git nerd tree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Rainbow brackets -> shows matching brackets
Plug 'luochen1990/rainbow'

" vim icons mate
Plug 'ryanoasis/vim-devicons'

" plugin list ends here
call plug#end()

" OTHER CONFIGURATIONS
" color scheme
" colorscheme nord
set termguicolors
colorscheme iceberg
set bg=dark
highlight Normal guibg=black guifg=white

" enables loading of plugin and indent files
filetype plugin indent on
filetype plugin on

" turning on syntax high lighting
syntax on

" turning on automatic indentation
set autoindent

" # of spaces to use for autoindent
set shiftwidth=4
set tabstop=4

" used for command line completion
set wildmenu

" sets ignore case in search patterns
set ignorecase

" overrides the 'ignorecase' option if the search pattern contains upper case
" char
set smartcase

" when a bracket is inserted, briefly jump to its corresponding one
set showmatch

set hidden

" Highlight the screen line of the curso with CursorLine
set cursorline

"  Highlight the screen column of the cursor with CursorColumn (Useful to align text)
"  set cursorcolumn

" While typing a search command, show where the pattern, as it was typed
" so far, matches.  The matched string is highlighted.
set incsearch

" Shows the effects of a command incrementally, as you type.
" "nosplit": Shows the effects of a command incrementally, as you type.
" "split"  : Also shows partial off-screen results in a preview window.
set inccommand=split

" Show the line number relative to the line with the cursor in front of each line.
set number
set relativenumber

" Use the appropriate number of spaces to insert a <Tab>
set expandtab

" Disable line wrapping
set nowrap


" Enables mouse support
" Mouse support can be enabled for different modes:
" 	n	Normal mode
" 	v	Visual mode
" 	i	Insert mode
" 	c	Command-line mode
" 	h	all previous modes when editing a help file
" 	a	all previous modes
" 	r	for |hit-enter| and |more-prompt| prompt
set mouse=a

" Minimal number of screen lines to keep above and below the cursor.
" This will make some context visible around where you are working.
set so=999

" Plugin enablers + customizations
let g:airline_powerline_fonts = 1
let g:indentLine_char = '│'
let g:deoplete#enable_at_startup = 1
let g:indentLine_enabled = 1
let g:airline_theme = 'base16_unikitty_dark'
let g:airline_powerline_fonts = 1
let g:rainbow_active = 1
let g:airline_section_x = '%{ScrollStatus()} '
let g:airline_section_y = airline#section#create_right(['filetype'])
let g:airline_section_z = airline#section#create([
            \ '%#__accent_bold#%3l%#__restore__#/%L', ' ',
            \ '%#__accent_bold#%3v%#__restore__#/%3{virtcol("$") - 1}',
            \ ])
let g:completion_enable_snippet = "UltiSnips"

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1
" used for auto pairs to not delete braces when a space is entered an there is
" no strings between them
let g:pear_tree_repeatable_expand = 0

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" used for fuzzy search
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

" used for git nerd tree
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Key Bindings
nmap <C-n> :NERDTreeToggle<CR>

