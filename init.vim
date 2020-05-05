"
" _   _                 _           
"| \ | | ___  _____   _(_)_ __ ___  
"|  \| |/ _ \/ _ \ \ / / | '_ ` _ \ 
"| |\  |  __/ (_) \ V /| | | | | | |
"|_| \_|\___|\___/ \_/ |_|_| |_| |_|
"                                   
"

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

" Press <lead> twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Call figlet
map tx :r !figlet 

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

" 让光标在屏幕底部第6行  等号两边不能有空格
set scrolloff=6

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


" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1



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
map <C-Up> :resize +5<CR>    
map <C-Down> :resize -5<CR>
map <C-Left> :vertical resize-5<CR>
map <C-Right> :vertical resize+5<CR>


"打开新的vim
map <Leader>= :tabnew<CR>

"切换文件
map <Leader>[ :-tabnext<CR>
map <Leader>] :+tabnext<CR>



"skip from one window to another
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
nnoremap ,h <C-w>h
nnoremap ,j <C-w>j
nnoremap ,k <C-w>k
nnoremap ,l <C-w>l

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
noremap <Leader>, :nohlsearch<CR>


"开启vim命令自动补全
set wildmenu


"###################################
"            Plugin
"###################################


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" 用于调整状态栏
Plug 'vim-airline/vim-airline' 
"配色方案
Plug 'connorholyday/vim-snazzy'
" 文件浏览插件
Plug 'preservim/nerdtree'
" 语法检查
Plug 'dense-analysis/ale'
" 定义的函数列表
Plug 'majutsushi/tagbar'
" 修改记录 非常影响vim配置的保存速度
"Plug 'mbbill/undotree'
" 预览Markdown
" If you don't have nodejs and yarn, use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" 显示git修改
Plug 'Xuyuanp/nerdtree-git-plugin'
" 显示缩进
Plug 'nathanaelkane/vim-indent-guides'
" 多行注释
Plug 'preservim/nerdcommenter'
" 改变两端的符号
Plug 'tpope/vim-surround'
" 为python高量 相同的变量
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" vim的开始界面 显示文件目录
Plug 'mhinz/vim-startify'
" Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more
Plug 'ryanoasis/vim-devicons'
" 文件查找
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
"
"" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"
"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()







"###############################
" 			snazzy
" ##############################
colorscheme snazzy
let g:SnazzyTransparent = 1



"###############################
" 			nerd tree
" ##############################
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map tn :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"###############################
" 			ale
" ##############################
" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>o触发/关闭语法检查
nmap <Leader>o :ALEToggle<CR>
"<Leader>e查看错误或警告的详细信息
nmap <Leader>e :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0



"###############################
" 			tagbar
" ##############################
nmap tb :TagbarToggle<CR>


"###############################
" 		undo tree	
" ##############################
"nnoremap tu :UndotreeToggle<cr>




"###############################
" 	    markdown preview	还没有配置好	
" ##############################
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'






"###############################
" 	   nerd-tree-git-plug 
" ##############################
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }




"###############################
" 	   nerd-tree-git-plug 
" ##############################
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"hi IndentGuidesOdd  guibg=red   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4<Paste>



"###############################
" 	   nerd commenter
" ##############################

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


"###############################
" 	  		Semshi 
" ##############################
nmap <silent> <leader>rr :Semshi rename<CR>

nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>

nmap <silent> ,c :Semshi goto class next<CR>
nmap <silent> ,C :Semshi goto class prev<CR>

nmap <silent> ,f :Semshi goto function next<CR>
nmap <silent> ,F :Semshi goto function prev<CR>

nmap <silent> ,gu :Semshi goto unresolved first<CR>
nmap <silent> ,gp :Semshi goto parameterUnused first<CR>

nmap <silent> ,ee :Semshi error<CR>
nmap <silent> ,ge :Semshi goto error<CR>

"if you want the highlight groups to persist across colorscheme switches
autocmd ColorScheme * call MyCustomHighlights()

hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#ffaf00
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign



"###############################
" 	  	 devicon	
" ##############################
set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1
" Can nerdtree be enabled or disabled
let g:webdevicons_enable_nerdtree = 1
" Can be enabled or disabled
" adding to vim-startify screen
let g:webdevicons_enable_startify = 1


"###############################
" 	  	 startify 
" ##############################
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
 function! s:gitModified()
     let files = systemlist('git ls-files -m 2>/dev/null')
     return map(files, "{'line': v:val, 'path': v:val}")
 endfunction

 " same as above, but show untracked files, honouring .gitignore
 function! s:gitUntracked()
     let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
     return map(files, "{'line': v:val, 'path': v:val}")
 endfunction

 let g:startify_lists = [
         \ { 'type': 'files',     'header': ['   MRU']            },
         \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
         \ { 'type': 'sessions',  'header': ['   Sessions']       },
         \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
         \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
         \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
         \ { 'type': 'commands',  'header': ['   Commands']       },
         \ ]



"###############################
" 			fzf	
" ##############################








