set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" Sensible vimrc defaults
Plugin 'tpope/vim-sensible'

" YouCompleteMe plugin from https://github.com/Valloric/YouCompleteMe
" auto complete functionality for different kinds of files
Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-fugitive'

" automatic closing of quote, braces, ...
Plugin 'Raimondi/delimitMate'

" vim tmux integration, seamlessly switch panes between both programs
Plugin 'christoomey/vim-tmux-navigator'

"Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"remove trailing white spaces of edited lines
Plugin 'thirtythreeforty/lessspace.vim'

"search for file recursively
Plugin 'wincent/Command-T'

" install vala support
Plugin 'arrufat/vala.vim'

" tagbar plugin
Plugin 'majutsushi/tagbar'

" ctags for tagbar
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line





set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
"set autoindent

set number

set mouse=a

"copy and paste over ssh using xclip
"vmap "+y :!xclip -f -sel clip
"map "+p :r!xclip -o -sel clip
set clipboard=unnamedplus

set hlsearch

let &colorcolumn=101
highlight ColorColumn ctermbg=lightgrey

" YCM settings
let g:ycm_use_clangd = 0 " STL includes aren't working with clangd. Haven't found the root cause
let g:ycm_add_preview_to_completeopt = 1 " show detailed information
let g:ycm_autoclose_preview_window_after_insertion = 1 " auto close preview window

let g:ycm_server_log_level = 'debug'


" switching panes/windows
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" vim-airline settings
set laststatus=2 " always show powerline, see :help laststatus
set term=screen-256color " otherwise no colors are used
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

"" show trailing white spaces
set listchars=trail:·
set list

" Zoom / Restore window. https://coderwall.com/p/qqz1lq/vim-zoom-restore-window
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>

" deactivate vala source folding
let g:vala_syntax_folding_enabled = 0

set encoding=utf-8

let g:lessspace_blacklist = ['markdown']


let g:CommandTFileScanner = 'git'
