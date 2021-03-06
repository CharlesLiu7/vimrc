# .vimrc : Charles's private vim configuration

## Reference:

> [zhuohua's vimrc](https://github.com/lizhuohua/vimrc)

> commits: d23bb080c17799e634c819011898c51b6a4fff07

## Example:

![](https://github.com/CharlesLiu7/vimrc/raw/master/show.png)


## Complete configuration:

### Normal ones and useful key mapping

- macros/matchit.vim enhances the `%` match function, it will match the pair tags when editing the files such as html, CSS...
- `<F5>`, for c, c++, java, python, shell script codes, instantly execute the code.
- `:w!!` Allow saving of files as sudo when you forgot to start vim using sudo.
- `Ctrl+a` select all
- Arch 本身的vim不支持clipboard，所以安装了Arch的Gvim就支持了
- `<Leader>y` Copy to system clipboard
- `<Leader>p` Paste from system clipboard
- `H` the beginning of the line, `L` the end of the line
- `Ctrl+l`, `Ctrl+h`, move the cursor in insert mode
- Map ; to : and save a million keystrokes

### :heavy_check_mark: spell checking

[Guidance for new one](http://blog.leanote.com/post/mybaby101@126.com/%E5%88%A9%E7%94%A8Vim%E7%9A%84%E6%8B%BC%E5%86%99%E6%A3%80%E6%9F%A5%E5%99%A8%EF%BC%8C%E6%9F%A5%E6%89%BE%E5%B9%B6%E6%9B%B4%E6%AD%A3%E6%8B%BC%E5%86%99%E9%94%99%E8%AF%AF)

- `]s` : 将光标移到下一个拼写错误处
- `[s` : 将光标移到上一个拼写错误处
- `zg` : 将单词加入词典
- `zug` : 撤销将单词加入词典
- `z=` : 拼写建议

### :heavy_check_mark: windows

- `<Leader>vs` split the window
- `<Leader>hljk` Move between windows
- `<Leader>Q` Closes the current window

### :heavy_check_mark: buffers

- `Ctrl Left/h & Right/l` cycle between buffers
- `<Leader>q` Closes the current buffer

### :heavy_check_mark: ~~Bundle~~ vim-plug

[GitHub:junegunn/vim-plug](https://github.com/junegunn/vim-plug)

- including one file at `~/.vim/autoload/plug.vim`

### :heavy_check_mark: YouCompleteMe

[GitHub:Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

- set the `leader` = `\<space>`
- It includes a file at `~/.vim/ycm_extra_conf.py`, and this file configuration the YouCompleteMe plug, I also comment one line to enable C++11 code-completion.
- Close the preview window when you leave insert mode
- `<leader>+d` Jump to definition

### :heavy_check_mark: ~~Powerline~~ airline

[GitHub:vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)

[GitHub:vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

- Always appear Airline
- No airline in preview window
- Display all buffers when there's only one tab open

### vim-multiple-cursors

There have been many attempts at bringing Sublime Text's awesome multiple selection feature into Vim, but none so far have been in my opinion a faithful port that is simplistic to use, yet powerful and intuitive enough for an existing Vim user. vim-multiple-cursors is yet another attempt at that.

[GitHub:terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

- To begin with `Ctrl+n`

### vim-easymotion

EasyMotion provides a much simpler way to use some motions in vim. It takes the `<number>` out of `<number>w` or `<number>f{char}` by highlighting all possible choices and allowing you to press one key to jump directly to the target.

[GitHub:easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)

[Usage Reference](http://www.wklken.me/posts/2015/06/07/vim-plugin-easymotion.html)

- Turn on case insensitive feature
- `s` search mode
- `<Leader>K` line up mode
- `<Leader>J` line down mode
- `<Leader>L` line forward mode
- `<Leader>H` line backward mode
- `<Leader>.` repeat mode

### :heavy_check_mark: nerdcommenter

[GitHub:scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)

Here is a [usage DOC](http://www.wklken.me/posts/2015/06/07/vim-plugin-nerdcommenter.html)

- `<leader>cc`   加注释
- `<leader>cu`   解开注释
- `<leader>c<space>`  加上/解开注释, 智能判断
- `<leader>cy`   先复制, 再注解(p可以进行黏贴)

### ale

[GitHub:w0rp/ale](https://github.com/w0rp/ale)

### indentLine

[GitHub:Yggdroot/indentLine](https://github.com/Yggdroot/indentLine)

### vim-expand-regiod

[GitHub:terryma/vim-expand-regiod](https://github.com/terryma/vim-expand-regiod)

### ctrlp

[GitHub:ctrlpvim/ctrlp.vim](https://github.com/ctrlp.vim)

### ultisnips

UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.

[GitHub:SirVer/ultisnips](https://github.com/SirVer/ultisnips)

[Usage reference](http://mednoter.com/UltiSnips.html)

### vim-snippets

[GitHub:honza/vim-snippets](https://github.com/honza/vim-snippets)

### :heavy_check_mark: vim-autoformat

[GitHub:Chiel92/vim-autoformat](https://github.com/Chiel92/vim-autoformat)

- clang-format for C++
- autopep8 for python

### :heavy_check_mark: vim-instant-markdown

[GitHub:suan/vim-instant-markdown](https://github.com/suan/vim-instant-markdown)

- `:InstantMarkdownPreview` to open the preview window in browser

### nerdtree

[GitHub:scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)

[GitHub:Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)

### vim-surround

[GitHub:tpope/vim-surround](https://github.com/tpope/vim-surround)
