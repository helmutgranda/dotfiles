"
"--------------------------------------"
"   Commands


"   Commands | Files
"   ~helper commands to make new files
command! Newhtml execute 'vnew' | execute 'Sethtml'
command! Newcss execute 'vnew' | execute 'Setcss'
command! Newscss execute 'vnew' | execute 'Setscss'
command! Newjs execute 'vnew' | execute 'Setjs'


"   Commands | Syntax
"   ~helper commands to set syntax
command! Sethtml execute 'set ft=html'
command! Setcss execute 'set ft=css'
command! Setscss execute 'set ft=scss'
command! Setjs execute 'set ft=javascript'


"   Commands | Vimrc
"   ~quickly open vimrc

command! Vimrc execute 'e $MYVIMRC'

"   ~quickly source vimrc
command! SO execute 'source $MYVIMRC'

"   ~open vimc from any location and source upon save and close
map <leader>vimrc :tabe ~/.vim/.vimrc<cr>
autocmd bufwritepost .vimrc source $MYVIMRC

"--------------------------------------"
"   Functions


"   Functions | Syntax

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"   General | Editing
"   ~load plugins for file types
filetype plugin on
"   ~if file changes: reload
set autoread
"   ~set file encoding to UTF8
set encoding=utf8
"   ~moving as expected through whitespace
set virtualedit=all

"   ~View Line Numbers
set number

"   General | Modes
"   ~get out of insert mode
inoremap jk <esc>
inoremap kj <esc>
"   ~quickly access command line
nnoremap ; :

"   General | Search
"
"   ~case intelligent search
set ignorecase
set smartcase

"   General | Tabs & Indents
"   ~reference #2 in options.txt under 'tabstop'
set tabstop=2
set shiftwidth=2
set expandtab
"   ~indent as expected
set autoindent
set copyindent
set smartindent

"   General | Terminal
"   ~set default shell
set shell=/bin/zsh
"   ~quickly get out of terminal mode
tnoremap kj <C-\><C-n>


"   General | Text
"   ~no text wrapping
set nowrap


"--------------------------------------"
"   Hotkeys


"   Hotkeys | Leader
"   ~set leader mapping
let g:mapleader = ','

"   ~quickly move between panes
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-[> <C-W>5<
nnoremap <C-]> <C-W>5>


"--------------------------------------"
"   Plugins


"   Plugins | Initialize
"   ~required to start plugins block
"
call plug#begin('~/.vim/plugged')

"   ~editing
Plug 'chrisbra/colorizer'
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

"   ~files
Plug 'iamcco/markdown-preview.vim'

"   ~navigation
Plug 'scrooloose/nerdtree'
Plug 'yuttie/comfortable-motion.vim'

"   ~searching
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
"   ~theme
Plug 'ap/vim-buftabline'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Yggdroot/indentLine'
"   ~tmux
Plug 'christoomey/vim-tmux-navigator'
"   ~whitespace
Plug 'ntpeters/vim-better-whitespace'

"   ~Ale
Plug 'w0rp/ale'

"   ~Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"   ~Git
Plug 'tpope/vim-fugitive'

"   ~DevIcons
Plug 'ryanoasis/vim-devicons'

"   Plugins | End
"   ~required to close plugins block
call plug#end()


"   Settings | Colorizer
"   ~enable show colors
map <leader>ct :ColorToggle<cr>


"   Settings | Nerd Tree
"   ~show hidden files by default
let NERDTreeShowHidden = 1
"   ~expandable icon - glyphs from SauceCodePro_Nerd_Font
let g:NERDTreeDirArrowExpandable = ''
"   ~collapsible icon - glyphs from SauceCodePro_Nerd_Font
let g:NERDTreeDirArrowCollapsible = ''
"   ~change working directory
let g:NERDTreeChDirMode = 2
"   ~force minimal UI
let g:NERDTreeMinimalUI = 0
"   ~show line numbers
let g:NERDTreeShowLineNumbers = 0
"   ~hide cursorline
let g:NERDTreeHighlightCursorline = 1
"   ~don't collapse only one child
let g:NERDTreeCascadeSingleChildDir = 0
"   ~toggle nerd tree
map <leader>nt :NERDTreeToggle<cr>

"   ~tmux colors
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

"--------------------------------------"
"   UI


"   UI | ColorScheme
"if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
"endif
"   ~enable cursorline
"set cursorline
"   ~enable terminal italics
let g:onedark_terminal_italics = 1
"   ~enable terminal 256 colors
let g:onedark_termcolors=256

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

let g:airline_theme='murmur'
let g:airline_powerline_fonts = 1

"   ~set colorscheme to onedark ... so sexy
colorscheme onedark
"   ~ Turn on Syntax Highlight
syntax on


"   UI | Statusline
set numberwidth=6
set statusline=
set statusline+=\ %4l•%-3c
set statusline+=\ %3p%%
set statusline+=\ \ \ %.30F\ %{WebDevIconsGetFileTypeSymbol()}
set statusline+=%#ErrorMsg#
set statusline+=\ %{getbufvar(bufnr('%'),'&mod')?'':''}
set statusline+=%*
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %{&fileformat}
set statusline+=\ \


"   UI | Syntax
"   ~no syntax highlight past 80 columns
"set synmaxcol=80
"   ~change bg color after 80 columns
"execute "set colorcolumn=" . join(range(81,335), ',')


"   UI | Theme
"   ~no borders between panes
set fillchars=""
"   ~color the tildes so it looks like none
hi EndOfBuffer guifg=#282C34 ctermfg=235
"   ~file colors can use 5c6370 or 636d83
hi NERDTreeFile guifg=#636d83 gui=NONE
"   ~folder colors
hi NERDTreeDir guifg=#abb2bf gui=NONE
"   ~slash after folder names
hi NERDTreeDirSlash guifg=#282c34 gui=NONE
"   ~folder open icon color
hi NERDTreeOpenable guifg=#abb2bf gui=NONE
"   ~folder close icon color
hi NERDTreeClosable guifg=#abb2bf gui=NONE
"   ~current working directory
hi NERDTreeCWD guifg=#636d83 gui=NONE
"   ~FZF
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 guifg=#61afef guibg=#20242b
  highlight fzf2 guifg=#61afef guibg=#20242b
  highlight fzf3 guifg=#61afef guibg=#20242b
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()
"   ~use Italics on comments and html/xml attributes
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
hi xmlAttrib gui=italic cterm=italic



"   ~ALEEnable
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
