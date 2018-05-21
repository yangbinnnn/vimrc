call plug#begin('~/.config/nvim/plugged')

Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'roxma/SimpleAutoComplPop'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'klen/python-mode', {'branch': 'develop'}
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'

call plug#end()

" Improved Settings {
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 开启文件类型侦测
filetype on
" 自适应不同语言的智能缩进
filetype indent on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu
" 配色方案
" set background=light
set background=light
let g:solarized_termcolors=256
colorscheme solarized
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
" 高亮显示搜索结果
" neovim #7002
set guicursor=
set hlsearch
" 禁止折行
set nowrap
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 基于语法进行代码折叠
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
set noswapfile
set nobackup
set completeopt=menu

" for tmux
if exists($TMUX)
    set term=screen-256color
endif
" Improved Settings }

" Keys Map {
" 定义快捷键的前缀，即 <Leader>
let mapleader=","
" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>sw :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
" Keys Map }

" Functions {
" F2 行号开关
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" Functions }

" Plugin Settings {
" NERDTreeToggle
nmap <F7> :NERDTreeToggle<CR>
let NERDTreeWinSize=22
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=0
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.svn$', '\.ropeproject$', '\.pyc$', '\.idea$']

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 25

" EasyMotion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

" Vim-GO
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<Leader>sn"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|dmg|tar.gz|bgz|zip|pdf|pyc|PNG|png|gif|jpeg|iso)$',
  \ }
let g:ctrlp_mruf_max=200

" python-mode
let g:pymode_lint = 0
let g:pymode_rope = 1
let g:pymode_motion = 1
let g:pymode_options_colorcolumn = 0
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:python2_host_prog = '/usr/local/bin/python'

" Plugin Settings }
