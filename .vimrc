  set ruler
" 开启行号显示
  set number
" 高亮显示当前行/列
" set cursorline
" set cursorcolumn
" 高亮显示搜索结果
  set hlsearch
" 设置 gvim 显示字体
  set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 自动缩进
  set autoindent
  set cindent
" 统一缩进为4
  set softtabstop=4
  set shiftwidth=4
" Tab键的宽度
  set tabstop=4
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
  set mouse=a
  set selection=exclusive
  set selectmode=mouse,key
" 突出显示当前行
  set cursorline
" 总是显示状态行
  set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
  set cmdheight=2
" 在粘贴代码时不启动自动缩进
"	粘贴之前输入 :set paste
"	粘贴完后恢复 :set nopaste
" set paste
" sublime的配色
  syntax enable
  colorscheme monokai
" set backspace work  
  set backspace=indent,eol,start
" file coding
  set fileencodings=utf-8,gb18030,gbk,gb2312,big5
""""""""""""""""""""""""""""""""""""""""""""键盘命令""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""键盘命令""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 映射全选+复制 ctrl+a
  map <C-A> ggVG
  map! <C-A> <Esc>ggVG
" 映射全局缩进
  map <F12> gg=G
  map! <F12> <Esc>gg=G
" 映射全局按照clang风格缩进 clang-format
  map <C-F> :pyf ~/.vim/plugin/clang-format.py<CR>
  imap <C-F> <c-o>:pyf ~/.vim/plugin/clang-format.py<CR>
" python format
  map <C-D> :PymodeLintAuto<CR>
  imap <C-D> <c-o>:PymodeLintAuto<CR>
" 去空行  
  nnoremap <F2> :g/^\s*$/d<CR>  
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
    elseif &filetype == 'sh'
        :!./%
    endif
  endfunc
" C,C++的调试
  map <F8> :call Rungdb()<CR>
  func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
	exec "! rm %<"
  endfunc


""""""""""""""""""""""""""""""""""""""""""""YouCompleteMe""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""YouCompleteMe""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM 补全菜单配色
" 菜单
  highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
  highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
  let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
  let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
  let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
  let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
  set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
  inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
  set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
  let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
  let g:ycm_cache_omnifunc=0
" 语法关键字补全         
  let g:ycm_seed_identifiers_with_syntax=1

" nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>



""""""""""""""""""""""""""""""""""""""""""""Powerline""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""Powerline""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:Powerline_symbols = 'fancy'
" set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
" These lines setup the environment to show graphics and colors correctly.
  set nocompatible
  set t_Co=256
  let g:minBufExplForceSyntaxEnable = 1
  if ! has('gui_running')
     set ttimeoutlen=10
     augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
     augroup END
  endif
  set laststatus=2 " Always display the statusline in all windows
" set guifont=Inconsolata\ for\ Powerline:h14
  set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline


""""""""""""""""""""""""""""""""""""""""""""For Bundle""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""For Bundle""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set nocompatible              " be iMproved, required
  filetype off                  " required
" set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
  Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
  Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'Lokaltog/vim-powerline'
  Plugin 'klen/python-mode'
" All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""python-mode""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""python-mode""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  call pathogen#infect()
  call pathogen#helptags()
