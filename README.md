ArVim
=========

```
    ___        _    ___         
   /   |  ____| |  / (_)___ ___ 
  / /| | / ___/ | / / / __ `__ \
 / ___ |/ /   | |/ / / / / / / /
/_/  |_/_/    |___/_/_/ /_/ /_/ 
                                
```

**ArVim** (<strong>Ar</strong>da's **Vim**) (formerly known as my-vim-configuration) is my [Vim](http://www.vim.org) configuration which I've started to create from scratch on 2014.05.06.

This configuration is basically aimed for my needs.

Components
-----------

This configuration includes some packages:

* [Pathogen](https://github.com/tpope/vim-pathogen) - pathogen.vim makes it super easy to install plugins and runtime files in their own private directories.
* [Vundle](https://github.com/gmarik/Vundle.vim) - Vundle is a powerful plugin manager for Vim.
* [NERDTree](https://github.com/scrooloose/nerdtree) - A tree explorer plugin for vim.
* [Vim-Airline](https://github.com/bling/vim-airline) - lean & mean status/tabline for vim that's light as air.
* [Conque-shell](https://github.com/oplatek/Conque-Shell) - Conque is a Vim plugin which allows you to run interactive programs, such as bash on linux or powershell.exe on Windows, inside a Vim buffer. Original script: [here](https://code.google.com/p/conque/).
* [indentLine](https://github.com/Yggdroot/indentLine) - A vim plugin to display the indention levels with thin vertical lines.
* [Vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): True Sublime Text style multiple selections for Vim.
* [Syntastic](https://github.com/scrooloose/syntastic) - Syntax checking hacks for vim.
* [Neocomplcache](https://github.com/Shougo/neocomplcache.vim) - Ultimate auto-completion system for Vim.
* [ctrlp.vim](https://github.com/kien/ctrlp.vim) - Fuzzy file, buffer, mru, tag, etc finder.
* [Tagbar](https://github.com/majutsushi/tagbar) - Vim plugin that displays tags in a window, ordered by scope.
* [vim-autoclose](https://github.com/spf13/vim-autoclose) - Inserts matching bracket, paren, brace or quote. Original script: [here](http://www.vim.org/scripts/script.php?script_id=1849).
* [Vim-blade](https://github.com/xsbeats/vim-blade): Vim syntax highlighting for Blade templates ([Laravel 4](http://laravel.com)).
* [Solarized Color Scheme](https://github.com/altercation/vim-colors-solarized) - precision colorscheme for the vim text editor.
* [xoria256 Color Scheme](https://github.com/vim-scripts/xoria256.vim) - Finely tuned soft gamma, 256 colors, dark background. Original script: [here](http://www.vim.org/scripts/script.php?script_id=2140).


Screenshots
-------------

####Very recent screenshot with full features


![Preview1](http://i.imgur.com/I15YfMX.png)

####The rest is out of date, but you'll get the idea.

![Preview2](http://i.imgur.com/eH4CdlW.png)

![Preview3](http://i.imgur.com/qXOp9WX.png)

![Preview4](http://i.imgur.com/EmwAUYv.png)

Requirements
-------------
* Python 2.3+ or 3.0+ (for ConqueShell)
* Vim 7.0+ (for *nix), 7.3+ (for Windows, GVim)

Installation
--------------

###On *nix:

1. First, backup or remove your `.vimrc` file and `.vim` folder.
2. Then make sure you've installed `git`, `php`, and `ctags` globally.
3. And then, just run these commands on your terminal:

```
cd $HOME
rm -rf .vim .vimrc
git clone --recursive https://github.com/Ardakilic/arvim.git
cd arvim
mv .vim .vimrc $HOME
rm -rf $HOME/arvim
vim +PluginInstall +qall
```

###On Windows:

1. First, backup or remove your `_vimrc` file and `vimfiles` folder.
2. Download very latest version of this configuration from [here](https://github.com/Ardakilic/arvim/archive/master.zip).
3. Extract the archive to a folder.
3. Rename the `.vimrc` to something like `vimrc.vim`, and put it in the same folder as the file `_vimrc`, `vim$version`, and the folder `vimfiles` (the root folder of Windows Vim).
4. Open the _vimrc (that comes with default installation), find this line:
    ```
    source $VIMRUNTIME/mswin.vim
    ```
5. Add below:
    ```
    source $VIMRUNTIME/../vimrc.vim "or whatever you've renamed
    ```
6. Copy/move everything inside `.vim` to `vimfiles`. 
7. Run Vim or GVim.
8. Enjoy! :smile: 

**Note:** If the airline's separators are messed (`>` and `<`), roll back to default ones by deleting or commenting out these lines with `"`:

```
if !exists('g:airline_powerline_fonts')
    " Use the default set of separators with a few customizations
    let g:airline_left_sep='›'  " Slightly fancier than '>'
    let g:airline_right_sep='‹' " Slightly fancier than '<'
endif
```

Switching Color Schemes
--------------
This configuration comes with two color schemes, `xoria256` as 256 color terminal scheme (default), and `solarized` for rich color scheme. 

* To switch from xoria256 to solarized, because solarized uses rich colors, first you'll need to change colors of your terminal to see the colors correctly. [Here](http://www.webupd8.org/2011/04/solarized-must-have-color-paletter-for.html) are the instructions to set the Ubuntu Terminal, [official download](http://ethanschoonover.com/solarized) also includes OSX or other terminal palettes.
* Comment out these lines in `.vimrc` using `"`:

    ```
    set t_Co=256 "vim'e 256 renk terminaldeymiş gibi çalış de
    colorscheme xoria256
    ```

* Uncomment these lines:

    ```
    syntax enable
    set background=dark
    colorscheme solarized
    ```

    ```
    let g:airline_theme='solarized'
    ```

To change from solarized from xoria256, do the opposite.

**Note:** If you want to use light palette of solarized instead of dark one, change set `background=dark` to set `background=light`.



Updating Plugins
--------------

It's quite easy. Make sure `git` is installed, then just run the `update-plugins.sh` that comes within the repository. Make it executable, and run it. (Code taken from [here](https://coderwall.com/p/rffwva)):

```
chmod +x update-plugins.sh
./update-plugins.sh
```

Another way is to download the whole package again, but you may have to re-edit your configuration if required.

Some Tricks
--------------
* This configuration supports mouse input :)
* <kbd>CTRL+e</kbd> will toggle NERDTree.
* (default feature) Pressing <kbd>r</kbd> will reload contents on focused folder in NERDTree (you'll see changes if done), <kbd>R</kbd> will reload all contents from root of NERDTree.
* (default feature from plugins) <kbd>Ctrl+n</kbd> will select the next word, and there will be multiple cursors. After then you can multi edit/delete the matched words. More info: [here](https://github.com/terryma/vim-multiple-cursors#about).
* <kbd>:T</kbd> will split the current buffer, and open a new bash there. <kbd>:Tn</kbd> will open a new shell in the current buffer. (Note: To use `powershell.exe` etc. in Windows, you have to switch these lines: `:cabbrev T ConqueTermSplit bash` and `:cabbrev Tn ConqueTerm bash`)
* <kbd>F5</kbd> will toggle line numbers on active buffer. <kbd>F6</kbd> will enable, <kbd>F7</kbd> will disable it.
* <kbd>F9</kbd> will toggle the Tagbar.
* <kbd>CTRL+n</kbd> will open a new tab, <kbd>CTRL+←</kbd> will switch to previous tab, <kbd>CTRL+→</kbd> will switch to next tab.
* <kbd>CTRL+Shift+d</kbd> will duplicate the current line (just like Sublime Text).
* (default feature) To open a file in a new tab from NERDTree, choose the file, and press <kbd>t</kbd>
* If using mouse, <kbd>F12</kbd> will switch mouse focus from Vim to Terminal, pressing <kbd>F12</kbd> will switch again. (Using [this](https://github.com/nvie/vim-togglemouse/blob/master/plugin/toggle_mouse.vim) snippet)
* <kbd>F2</kbd> and <kbd>F3</kbd> will switch on current frames. 
* (default feature) <kbd>CTRL+W+W</kbd> will change the focus.
* (default feature) <kbd>CTRL+P</kbd> will open the ctrlp.vim menu, which you're already similar to if you've used Sublime Text.
* The cursor auto-wraps. This means, if you are at a start of a line and press <kbd>←</kbd>, the cursor will go to the end of previous line, also the opposite is available. If you press <kbd>→</kbd> at the end of the line, it will go to the first character of next line.
* You can use <kbd>TAB</kbd> and <kbd>SHIFT+TAB</kbd> on editor both on insert mode and and while focused.
* 3x<kbd>Left Click</kbd> will fold/unfold the code block.
* Pressing <kbd>TAB</kbd> will select the closest auto-complete word.
* After searching, pressing <kbd>CTRL+O</kbd> will remove the highlight.
* This configuration can highlight [Laravel](http://laravel.com)'s Blade Template Engine syntax.


TODO
----

I'm open to suggestions, if you have a suggestion, please feel free to add them from [issues page](https://github.com/Ardakilic/arvim/issues).

* Translation of `.vimrc` to English and tidying it up.
* On my Gnome Terminal, sometimes Airline + Solarized colors are messed even after I've set the colors (should be fixed).
* Git Integration
* Composer and Laravel support
* Tests on MacVim
* ?

License
----

**Free Software, Hell Yeah!**
