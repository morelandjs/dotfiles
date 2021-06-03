"
" ~/.vimrc
"

" plugins
call plug#begin('~/.vim/plugged')

Plug 'icymind/NeoSolarized'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ntpeters/vim-better-whitespace'
Plug 'honza/vim-snippets'
Plug 'nvie/vim-flake8'
Plug 'hynek/vim-python-pep8-indent'
Plug 'mitsuhiko/vim-jinja'
Plug 'mattn/emmet-vim'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'

call plug#end()

" general
set backupdir=~/.local/share/nvim/backup
set termguicolors
set textwidth=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cindent
set smarttab
set showtabline=2
set laststatus=1
set hlsearch
set ignorecase
set incsearch
set number
set noswapfile
set wildmode=list:longest,full
set backspace=indent,eol,start
set nostartofline
set smartcase
set mouse=a
set ttimeout
set ttimeoutlen=100
set scrolloff=3
set sidescrolloff=5
set updatetime=100

" prefer vertical split
set splitright
set splitbelow

" extended matching
runtime! macros/matchit.vim

" solarized colors
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
colorscheme NeoSolarized
set background=dark

" link tab bar highlighting to main window
highlight! link TabLineFill Normal

" match gitgutter bg color to line number column
let s:guibg = synIDattr(hlID('LineNr'), 'bg', 'gui')
let s:ctermbg = synIDattr(hlID('LineNr'), 'bg', 'cterm')

for group in ['Add', 'Change', 'Delete', 'ChangeDelete']
  execute 'highlight GitGutter' . group . ' guibg=' . s:guibg . ' ctermbg=' . s:ctermbg
endfor

" gui options
if has('gui_running')
  set guifont=monospace\ 13

  " remove clutter
  set guioptions-=m   " menubar
  set guioptions-=T   " toolbar
  set guioptions-=r   " right scrollbar
  set guioptions-=L   " left scrollbar

  " disable cursor blink
  set guicursor=a:blinkon0

  " disable alt-key access to menus
  set winaltkeys=no
endif

" save and load views automatically for appropriate files
" (systemd-tmpfiles is configured to clean old view files)
function UseView()
  let l:fname = expand('%:p')
  return &modifiable
        \ && filewritable(l:fname)
        \ && &buftype == ''
        \ && !&l:diff
        \ && &filetype != 'gitcommit'
        \ && l:fname !~ '^\(fugitive://\|/run\|/tmp\)'
endfunction

autocmd BufWinLeave * if UseView() | mkview | endif
autocmd BufWinEnter * if UseView() | silent! loadview | endif

" prevent detecting some tex files as 'plaintex'
let g:tex_flavor='latex'

" whitespace
let g:better_whitespace_filetypes_blacklist = ['gitcommit']
