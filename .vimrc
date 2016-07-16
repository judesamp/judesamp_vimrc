let mapleader = " "

set nocompatible
filetype off

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/TwitVim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

" TwitVim settings
let twitvim_browser_cmd = 'open'

" Syntastic Initial Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ragtag_global_maps = 1
let loaded_matchparen = 1
let g:user_emmet_leader_key='<C-Y>'

nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>cp :CtrlP<cr>
nmap <leader>ig :IndentGuidesToggle<CR>
nmap <leader>s :w<cr>
nmap <leader>q :q<cr>
nmap <leader>ccs <c-w:q<cr>
nmap <leader>cs :vnew ~/.cheat<cr>:vertical resize 40<cr><c-w>w
nmap <leader>ccs <c-w>w:q<cr>
nmap <leader>e :Explore<cr>
nmap <leader>ri :CtrlPClearCache<cr>
nmap 0 ^
nmap k gk
nmap j gj

inoremap jk <esc>:w<cr>
inoremap kj <esc>:w<cr>

filetype plugin indent on    " required

" Turn off vi compatibility
set smartindent
set autoindent
set showbreak=...

let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "!spring rspec {spec}"


" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append ! to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append ! to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append ! to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set runtimepath^=~/.vim/bundle/ctrlp.vim
" #### guidelines settings ####
colorscheme default
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1


set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set pastetoggle=


" Switch syntax highlighting on, when the terminal has colors
" " Also switch on highlighting the last used search pattern.
" if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
"   syntax on
"   endif
"
"   if filereadable(expand("~/.vimrc.bundles"))
"     source ~/.vimrc.bundles
"     endif
"
"     " Load matchit.vim, but only if the user hasn't installed a newer
"     version.
"     if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp)
"     ==# ''
"       runtime! macros/matchit.vim
"       endif
"
"       syntax enable
"       filetype plugin indent on
"
"       augroup vimrcEx
"         autocmd!
"
"           " When editing a file, always jump to the last known cursor
"           position.
"             " Don't do it for commit messages, when the position is invalid,
"             or when
"               " inside an event handler (happens when dropping a file on
"               gvim).
"                 autocmd BufReadPost *
"                     \ if &ft != 'gitcommit' && line("'\"") > 0 &&
line("'\"") <= line("$") |
    \   exe "normal g\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set softtabstop=2

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <Leader>d <c-d>
nnoremap <Leader>u <c-u>

" Clear trailing whitespace
:nnoremap <Leader>ws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" matchit
runtime macros/matchit.vim
