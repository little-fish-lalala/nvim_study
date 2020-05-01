"let settings take effect immediately
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"打开语法高亮，自动识别代码，使用多种颜色显示
syntax on

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"让vim在当前目录下执行命令
set autochdir


"保证每次打开文件 光标都在上次的那一行
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"解决终端配色问题
let &t_ut=''

"在底部显示，当前处于命令模式还是插入模式
set showmode

"使用utf-8编码
set encoding=utf-8

"启用256色
set t_Co=256

"设置光标线
set cursorline

"输入过长,自动换行
set wrap

"========
"缩进设置
"========


"按下回车键，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent

"tab等于4个空格
set tabstop=4

"是否显示状态烂 0不显示 1只在多窗口时显示 2一直显示
set laststatus=2



"set the key "leader"
let mapleader="\\"

"save changings of a file
nmap <Leader>w :w<CR>
"nmap只能作用与普通模式 
"n表示普通模式 v表示可是和选择模式 nore表示非递归
"map nmap noremap vnoremap

"force to quit
nmap <Leader>q :q!<CR>

"set row number
set number

"显示相对行号
set relativenumber

"copy and paste
vnoremap <Leader>y "+y

"split screen
nnoremap <Leader>r :set splitright<CR>:vsplit<CR>     "向右分
nnoremap <Leader>l :set nosplitright<CR>:vsplit<CR>   "向左分

nnoremap <Leader>u :set nosplitbelow<CR>:split<CR>    "向上分
nnoremap <Leader>d :set splitbelow<CR>:split<CR>      "向下分

map <Leader>v <C-w>t<C-w>H  "切换为垂直分屏
map <Leader>s <C-w>t<C-w>K  ”切换为水平分屏

"调整分屏尺寸
"map <up> :resize +5<CR>    
"map <down> :resize -5<CR>
"map <left> :vertical resize-5<CR>
"map <right> :vertical resize+5<CR>


"打开新的vim
map <Leader>= :tabnew<CR>

"切换文件
map <Leader>[ :-tabnext<CR>
map <Leader>] :+tabnext<CR>

"skip from one window to another
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"skip to the line head or line end
nmap H ^
nmap L &

"jump 3 lines
nmap J 5j
nmap K 5k







"开启实时搜索
set incsearch

"开启大小写不敏感
set ignorecase
set smartcase

"关闭兼容模式
set nocompatible

set hlsearch
"清除当前搜索内容的高亮
noremap <Leader><space> :nohlsearch<CR>


"开启vim命令自动补全
set wildmenu

