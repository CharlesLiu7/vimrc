" 不使用Vi兼容模式
" no Vi-compatible
set nocompatible

"================================================================
" 用vim-plug做插件管理系统
" Use vim-plug for plugin manager
"================================================================
let mapleader="\<Space>"
call plug#begin()
	Plug 'Valloric/YouCompleteMe'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'easymotion/vim-easymotion'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/syntastic'
	Plug 'Yggdroot/indentLine'
	Plug 'terryma/vim-expand-region'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'Chiel92/vim-autoformat'
	Plug 'suan/vim-instant-markdown'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

"================================================================
" 让vim打开时回到上次编辑的位置
" Move to the point you edited last time when you start vim
"================================================================
autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
			\	exe "normal g'\"" |
			\ endif

"===============================================================
" 普通的一些配置
" Some normal configs
"===============================================================
" 关闭错误提示音和闪屏
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Gvim下使用右键菜单
set mousemodel=popup

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 修正Windows下退格键删不掉东西的问题
set backspace=indent,eol,start

" 增强的搜索模式
set incsearch
set ignorecase smartcase

" Vim默认使用的字符集
set encoding=utf-8

" 高亮光标所在行
set cursorline

" 显示相对行号
set number
set relativenumber

" 启动代码高亮
syntax enable
syntax on

" 关于缩进的设置
set cindent
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent

" 增强命令行补全
set wildmenu
set wildignore=*.o,*~,*.pyc,*.class

" 防止Windows下菜单乱码
if has('win32')||has('win64')
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
endif

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 让C++的public和private的缩进变正常
" To get public or private lable indented
set cinoptions=g0

" 字体和字号
" Font and font size
if has('unix')
	set guifont=Monaco\ 17 " English
	set guifontwide=Microsoft\ Yahei\ 17 "Chinese
elseif has('win32')||has('win64')
	set guifont=Monaco:h14 " English
	set guifontwide=Microsoft\ Yahei\ Mono:h14 "Chinese
endif

" Windows下使用DirectX进行渲染
" Use DirectX in Windows
if has('win32') || has('win64')
	if (v:version == 704 && has("patch393")) || v:version > 704
		set renderoptions=type:directx,level:0.50,
					\gamma:1.0,contrast:0.0,geom:1,renmode:5,taamode:1
    end
end

" 关闭菜单栏、工具栏以及滚动条
" Disable menu, toolbar and scrollbars
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" 主题配色，考虑到终端下有些配色显示不正常，故分开设置
" Color scheme, considering that some schemes may display abnormal
" so set them respectively
set t_Co=256
if has('gui_running')
	set background=dark
	colorscheme monokai
else
	colorscheme desert
endif

" 防止中文乱码
" Prevent Chinese character from messy
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5


" 启用Vim自带的matchit插件
runtime macros/matchit.vim

" 提高终端下的性能
" inprove the speed of vim in ternimal
set ttyfast
set ttyscroll=3
set lazyredraw

"===============================================================
" 编辑文本文件时的配置
"===============================================================
" 编辑文本类型时启用拼写检查
autocmd FileType text,plaintex,markdown setlocal spell spelllang=en,cjk

" 折行时自动缩进
set breakindent

" 折行时不会把一个单词切开
set linebreak

" 只对一行的前128列做语法高亮，提升响应速度
set synmaxcol=128

"===============================================================
" 好用的一些快捷键映射
" Some nice key mappings
"===============================================================
" C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
      exec "!g++ % -o %<"
      exec "! ./%<"
  exec "! rm %<"
  elseif &filetype == 'cpp'
      exec "!g++ % -o %<"
      exec "! ./%<"
  exec "! rm %<"
  elseif &filetype == 'java'
      exec "!javac %"
      exec "!java %<"
  exec "! rm %<"
  elseif &filetype == 'python'
      :! python ./%
  elseif &filetype == 'sh'
      :!./%
  endif
endfunc

" 当你忘了用sudo打开vim时，仍能保存文件
" Allow saving of files as sudo when you forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" 映射全选+复制 ctrl+a
map <C-A> ggVG
map! <C-A> <Esc>ggVG

" <Leader>p = 从系统剪切板粘贴
" <Leader>p = Paste from system clipboard
map <Leader>p "+p

" <Leader>y = 从系统剪切板复制
" 使用visual模式来选择范围，或者不用visual模式默认选择当前行
" <Leader>y = Copy from system clipboard
" Use visual mode to select, or select the current line by default
vnoremap <Leader>y "+y
nnoremap <Leader>y V"+y

" 对于长行，自动折行后按屏幕行移动而不是实际行
" 对于j、k，若有命令计数，仍按实际行移动
" When lines wrap, move according to display lines.
" Use original j and k if there is a command count.
noremap 0 g0
noremap ^ g^
noremap $ g$
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" H = 到行首, L = 到行尾
" H = the beginning of the line, L = the end of the line
noremap H g^
noremap L g$
vnoremap L g_

" Ctrl+l，Ctrl+h，在插入模式下左右移动光标
" Ctrl+l，Ctrl+h，move the cursor in insert mode
inoremap <C-l> <right>
inoremap <C-h> <left>

" 映射;为:从而进入命令行时不需按shift
" Map ; to : and save a million keystrokes
noremap ; :

" 在命令行中使用类似Bash的快捷键
" Bash like keys for the command line
"cnoremap <C-A> <Home>
"cnoremap <C-E> <End>
"cnoremap <C-K> <C-U>

" 让Ctrl+p和Ctrl+n也像上下键一样对历史记录进行过滤
" cnoremap <C-p> <Up>
" cnoremap <C-n> <Down>

"===============================================================
" <Leader>hljk 窗口间移动
"===============================================================
" 垂直、水平划分窗口
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <silent> <Leader>s :split<CR>

" 窗口间移动
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

" <Leader>Q 关闭当前窗口
nnoremap <silent> <Leader>q <C-w>c

"===============================================================
" Ctrl Left/h & Right/l buffer间切换
"===============================================================
" 如果当前buffer被修改了，在离开时自动将其设为隐藏
set hidden

" buffer间切换
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" Ctrl+q 关闭当前buffer
nnoremap <silent> <C-q> :bd<CR>

" <Leader>Ctrl+q 强制关闭当前buffer
nnoremap <silent> <Leader><C-q> :bd!<CR>

" 切换buffer时，不让光标每次都移到第一行
set nostartofline

"================================================================
" YouCompleteMe的配置
" Config for YouCompleteMe
"================================================================
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
" 当离开插入模式时，关闭preview窗口
" Close the preview window when you leave insert mode
let g:ycm_autoclose_preview_window_after_insertion=1
"autocmd InsertLeave * if pumvisible()==0|pclose|endif
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" <leader>+d 跳转到定义
" <leader>+d Jump to definition
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

"===============================================================
" Airline的配置
" Config for Airline
"===============================================================
" 一直显示Airline
" Always appear Airline
set laststatus=2
" 在preview窗口中不显示airline
" No airline in preview window
let g:airline_exclude_preview = 1
" 显示buffer名
" Display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

"===============================================================
" Easymotion的配置
" Config for Easymotion
"===============================================================
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
"nmap s <Plug>(easymotion-overwin-f2)
" 开启智能大小写，例如a能匹配到a和A，但A只能匹配到a
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
map <Leader>J <Plug>(easymotion-j)
map <Leader>K <Plug>(easymotion-k)
map <Leader>H <Plug>(easymotion-linebackward)
map <Leader>L <Plug>(easymotion-lineforward)
map <Leader>. <Plug>(easymotion-repeat)

"===============================================================
" nerdcommenter的配置
" Config for nerdcommenter
"===============================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"===============================================================
" syntastic的配置
" Config for syntastic
"===============================================================
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"autocmd InsertLeave * SyntasticCheck

"===============================================================
" Ultisnips的配置
" Config for ultisnips
"===============================================================
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"===============================================================
" vim-autoformat的配置
" Config for vim-autoformat
"===============================================================
let g:formatdef_my_custom_clang = "\"clang-format -style=\'{BasedOnStyle: llvm, IndentWidth: 4}\'\""
let g:formatters_cpp = ['my_custom_clang']
let g:formatters_c = ['my_custom_clang']
let g:autoformat_autoindent = 0
" au BufWrite * :Autoformat
noremap <F3> :Autoformat<CR>

"===============================================================
" NERDTree的配置
" Config for NERDTree
"===============================================================
noremap <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
