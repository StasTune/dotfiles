" Maintained by Sajoku
"
" Always use vim mode, even when starting with vi
set nocompatible
if !empty($MY_RUBY_HOME)
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*'),"\n"),',')
endif

" required!
filetype off

"Vundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-commentary'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-liquid'
Bundle 'tpope/vim-endwise'
Bundle 'tsaleh/vim-align'
Bundle 'rking/ag.vim'

Bundle 'groenewege/vim-less'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'ervandew/supertab'
Bundle 'bling/vim-airline'

Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'othree/html5.vim'
Bundle 'fatih/vim-go.git'

Bundle 'scrooloose/syntastic'
Bundle 'sajoku/vim-indent-guides'

" nelstrom's plugin depends on kana's
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

"color themes via vundle yeay
Bundle 'chriskempson/base16-vim'
Bundle 'endel/vim-github-colorscheme'
Bundle 'altercation/vim-colors-solarized'



syntax on
syntax enable
filetype plugin indent on
set encoding=utf-8

set backspace=indent,eol,start    " Allow backspacing over everything in insert mode
set autoindent                    " Always set autoindenting on
set history=50                  " Keep 50 lines in history
set ruler                         " Always show cursor
set showcmd                       " Display incomplete commands
set showmode
set mouse=a                       " Enable mouse
set mousehide                     " Hide mouse when typing
set timeoutlen=500                " Don't lag the leader key + command
set nofoldenable                  " Don't fold by default
set foldlevel=99
set expandtab                     " Use spaces instead of tabs
set tabstop=2                     " Global tab width
set shiftwidth=2
set softtabstop=2
set visualbell                    "no sounds
set incsearch                     "find as you type search

" Get rid of the delay when hitting esc!
set noesckeys

set listchars=tab:▸\ ,extends:>,precedes:< " fancy tabstops and eols symbols

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" http://items.sjbach.com/319/configuring-vim-right
set viminfo='100,f1               "Save up to 100 marks, enable capital marks
set autoread                      "refresh on changes without confirmation
set ignorecase                    "Ignore case with /  searched
set smartcase                     "Don't ignore case when search has capital
set scrolloff=3                   "Keep more context when csrolling, also use zz

"Map j and k when pressing tab to move, prevents from typing j and k though
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"

setglobal relativenumber
set relativenumber
set number                        " Show line numbers
set numberwidth=5

set backupdir=~/.vim/backup
set directory=~/.vim/backup
set makeprg=rake
" fancy status line
set statusline=%t%(\ [%n%M]%)%(\ %H%R%W%)\ %(%c-%v,\ %l\ of\ %L,\ (%o)\ %P\ 0x%B\ (%b)%)
" Automatic go to last edited line when opening file
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
"---------------------------------
"Mapping keys
"---------------------------------
" change mapleader to ,
let mapleader = ","
" Shortcuts
map <Leader>m :RVmodel<CR>
map <Leader>c :RVcontroller<CR>
map <Leader>l :set list!<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>r :NERDTreeFind<CR>
map <Leader>ps ysiw

nmap <Leader>f :call Focus()<CR>
nmap <Leader>h :call clearmatches()<CR>
" Quick'n'dirty hack to run rails tests
map <Leader>rt :!rake test %<CR>
map <Leader>rr :!ruby %<CR>

"resource and edit vimrc
nmap <leader>rs :so ~/.vimrc<CR>
nmap <leader>es :e ~/.vimrc<CR>

"indent and move cursor back to previous pos
map <Leader>i mmgg=G`m<CR>
"Paste with correct indentation
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"remap so i can use vim-suround
xmap s S

"Disable Ex mode
map Q <Nop>

" Split settings
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
set splitbelow   "Split windows below the current window.
" Tab completion
set wildmode=list:longest,list:full
set complete=.,w,t
set completeopt=menu,preview

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"exclude dirs for ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*,/build/,/resources/Storyboard.storyboardc/*,*.nib,*.tmp,*.log,releases/*
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.app$\|\.so$\|\.dat$\|.nib$\|.log$'
  \ }

" typo fixes
command! Q q
command! W w
command! Wa wa
command! Wq wq
command! Wqa wqa
command! Vsp vsp
command! Sp sp
command! Qa qa
command! Vs vs
command! Qall qall

" set 256 colors
colorscheme base16-chalk
set t_Co=256
set background=dark

" filetype mappings
au BufRead,BufNewFile {Gemfile,Rakefile,Guardfile,Vagrantfile,Thorfile,config.ru,*.rabl,Capfile}    set ft=ruby
au BufRead,BufNewFile Watchr set ft=ruby
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.hjs  set ft=handlebars
au BufRead,BufNewFile *.jst.ejs  set ft=html
au BufRead,BufNewFile *.zsh-theme  set ft=sh
au BufRead,BufNewFile *.strings set ft=yaml
au BufRead,BufNewFile *.md set ft=markdown

autocmd FileType markdown setlocal spell

"Remove trailing whitespace when writing a file
autocmd BufWritePre *.{rb,php,erb,js,css,sass,scss,html,htm,yml,markdown,feature,haml,mustache,cofffee,slim} :%s/\s\+$//e

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

" autoresize splits when resizing
au VimResized * exe "normal! \<c-w>="
" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

let g:airline_powerline_fonts = 1
set laststatus=2
runtime! macros/matchit.vim

""hi LineProximity ctermfg=white ctermbg=gray guifg=white guibg=#757160
""hi LineOverflow  ctermfg=white ctermbg=red guifg=white guibg=#FF2270
""
""autocmd BufRead,BufNewFile *.rb if !exists('w:created') | let w:m1=matchadd('LineProximity', '\%<120v.\%>115v', -1) | endif
""autocmd BufRead,BufNewFile *.rb if !exists('w:created') | let w:m2=matchadd('LineOverflow', '\%>119v.\+', -1) | endif
""autocmd VimEnter *.rb autocmd WinEnter * let w:created=1
""autocmd VimEnter *.rb let w:created=1
""autocmd WinEnter *.rb if !exists('w:created') | let w:m1=matchadd('LineProximity', '\%<120v.\%>115v', -1) | endif
""autocmd WinEnter *.rb if !exists('w:created') | let w:m2=matchadd('LineOverflow', '\%>119v.\+', -1) | endif

function! Focus()
  :let previous_line = (line(".") - 1)
  :let current_line = line(".")
  :let next_line = (".") + 1
  :call HighLightLine(next_line)
  :call HighLightLine(previous_line)
  :call HighLightLine(current_line)
endfunction

function! HighLightLine(line)
  let pattern="/"
  let pattern .= "\\%" . a:line . "l/"
  let commandToExecute = "match LineOverflow ".pattern
  execute commandToExecute
endfunction


" associate *.eye with ruby filetype
au BufRead,BufNewFile *.eye setfiletype ruby
