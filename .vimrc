set nocompatible
filetype off

" Plugins ----------- {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'edkolev/tmuxline.vim'
Plugin 'geekjuice/vim-spec'
Plugin 'kien/ctrlp.vim'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'tomtom/tinykeymap_vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'vadimr/bclose.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/taglist.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rking/ag.vim'
Plugin 'groenewege/vim-less'
Plugin 'mattn/emmet-vim'
Plugin 'lambdalisue/vim-gita'
Plugin 'mxw/vim-jsx'
Plugin 'nikvdp/ejs-syntax'
"Plugin 'othree/yajs.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'derekwyatt/vim-scala'
call vundle#end()
" }}}

" Options ---------- {{{
set encoding=utf-8
set modeline
set modelines=5
set autoindent
set showmode
set showcmd
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set norelativenumber
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw
set matchtime=5
set showbreak=↪
set splitbelow
set splitright
set autoread
set shiftround
set title
set linebreak
" }}}

" Tabs/Spaces/Wrapping {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set cindent
set smarttab
" }}}

" Searching and cursor movement{{{
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set cursorline

set scrolloff=4
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

noremap <silent> <leader><space> :noh<CR>:call clearmatches()<CR>

filetype plugin indent on
map <Leader>d :filetype detect<CR>

augroup ft_ruby
  au!
  au FileType ruby setlocal foldmethod=syntax
  au FileType ruby,eruby,yaml set ai ts=2 sw=2 sts=2 et
  au BufNewFile,BufRead *.mobile.erb let b:eruby_subtype='html'
  au BufNewFile,BufRead *.mobile.erb set filetype=eruby
augroup END

augroup ft_javascript
  au!
  au FileType javascript setlocal foldenable|setlocal foldmethod=syntax|setlocal foldlevel=2
  au FileType javascript,jade set ai ts=2 sw=2 sts=2 et
augroup END

" Autocmd
autocmd BufWritePre * %s/\s\+$//e

" Formatting

syntax on

set mouse+=a
if &term =~ '^screen'
	set ttymouse=xterm2
endif

set statusline=[%n]\ %f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%{fugitive#statusline()}%=%c,%l/%L\ %P

" Set leader key
let mapleader = ","
let g:mapleader = ","

" Prev and Next Buffer
nnoremap <c-u> :bp<CR>
nnoremap <c-i> :bn<CR>

" Close buffer
nnoremap <silent> <Leader>x :Bclose<CR>

" Fast saving
nmap <leader>s :w!<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ag
noremap <Leader>. :Ag<Space>

" CTRL-P
let g:ctrlp_max_files=0
let g:ctrlp_map = '<leader>,'
let g:ctrlp_command = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](.git|.svn|vendor|node_modules|_build|deps)'
	\ }

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#default#section_truncate_width = {
	\ 'y': 120,
	\ 'x': 110,
	\ 'z': 100
\ }
map <Leader>ar :AirlineRefresh<CR>

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'default' : '',
\ }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
let g:neosnippet#snippets_directory='~/.neosnippets'

" hi Pmenu ctermbg=grey ctermfg=white
" hi PmenuSel ctermbg=white ctermfg=grey
" hi PmenuSbar ctermbg=grey ctermfg=white

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" spec
if filereadable(fnamemodify('docker-compose.yml', ':p'))
  let g:rspec_command = "!docker-compose run web bash -c \"bundle exec rspec {spec}\""
  let g:mocha_js_command = "!docker-compose run web bash -c \"\\$(npm bin)/mocha {spec}\""
endif

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" vim-javascript
let g:jsx_ext_required = 0

" Colors
set background=dark
set t_Co=256
colorscheme base16-default-dark
hi LineNr ctermfg=grey ctermbg=236
hi CursorLine ctermbg=236

" Highlighting
" hi LineNr ctermfg=grey ctermbg=236
" hi CursorLine ctermbg=236
" hi CursorLineNR ctermfg=black ctermbg=grey
" hi Visual ctermfg=black ctermbg=white
" hi Search ctermfg=black ctermbg=white
" hi IncSearch ctermfg=black ctermbg=white
