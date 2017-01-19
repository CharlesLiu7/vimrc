# .vimrc : Charles's private vim configuration

## Reference:

> [zhuohua's vimrc](https://github.com/lizhuohua/vimrc)

> commits: d23bb080c17799e634c819011898c51b6a4fff07

## Example:

![](https://github.com/CharlesLiu7/vimrc/raw/master/show.png)


## Complete configuration:

### Normal ones and useful key mapping

- Move to the point you edited last time when you start vim
- Allow saving of files as sudo when you forgot to start vim using sudo.
- ...
- `ctrl+a` select all
- `<Leader>p` Paste from system clipboard
- `<Leader>y` Copy from system clipboard
- When lines wrap, move according to display lines. Use original j and k if there is a command count.
- `H` the beginning of the line, `L` the end of the line
- `Ctrl+l`, `Ctrl+h`, move the cursor in insert mode
- Map ; to : and save a million keystrokes
- ??? Bash like keys for the command line
- ??? `<Leader>hljki` Move between windows
- `<Leader>Q` Closes the current window
- `Ctrl Left/h & Right/l` cycle between buffers
- `<Leader>q` Closes the current buffer
- `<Leader>Ctrl+q` Force Closes the current buffer

### ~~Bundle~~ vim-plug

[Github:junegunn/vim-plug](https://github.com/junegunn/vim-plug)

- including one file at `~/.vim/autoload/plug.vim`

### YouCompleteMe

[Github:Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

- set the `leader` = `\<space>`
- It includes a file at `~/.vim/ycm_extra_conf.py`, and this file configer the YouCompleteMe plug, I also comment one line to enable C++11 code-completion.
- Close the preview window when you leave insert mode
- `<leader>+d` Jump to definition

### ~~Powerline~~ airline

[Github:vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)

[Github:vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

- Always appear Airline
- No airline in preview window
- Display all buffers when there's only one tab open

### vim-multiple-cursors

There have been many attempts at bringing Sublime Text's awesome multiple selection feature into Vim, but none so far have been in my opinion a faithful port that is simplistic to use, yet powerful and intuitive enough for an existing Vim user. vim-multiple-cursors is yet another attempt at that.

[Github:terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

- To begin with `Ctrl+n`

### vim-easymotion

EasyMotion provides a much simpler way to use some motions in vim. It takes the `<number>` out of `<number>w` or `<number>f{char}` by highlighting all possible choices and allowing you to press one key to jump directly to the target.

[Github:easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)

[Usage Reference](http://www.wklken.me/posts/2015/06/07/vim-plugin-easymotion.html)

- Turn on case insensitive feature
- `<leader><leader>s` search jump

### nerdcommenter

[Github:scrooloose/nerdcommenter]

### syntastic

[Github:scrooloose/syntastic](https://github.com/vim-syntastic/syntastic)

[Github:Yggdroot/indentLine]
[Github:terryma/vim-expand-regiod]
[Github:ctrlpvim/ctrlp.vim]

### ultisnips

UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.

[Github:SirVer/ultisnips](https://github.com/SirVer/ultisnips)

[Usage reference](http://mednoter.com/UltiSnips.html)

[Github:honza/vim-snippets]

### vim-autoformat

[Github:Chiel92/vim-autoformat](https://github.com/Chiel92/vim-autoformat)

- clang-format for C+_+

[Github:suan/vim-instant-markdown]

### nerdtree

[Github:scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)

[Github:Xuyuanp/nerdtree-git-plugin]

