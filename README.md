This is my Vim configuration

#Installation
To install it execute the following commands

```
cd ~
git clone https://github.com/zyedidia/dotvim.git ~/.vim
echo "runtime vimrc" > .vimrc
cd ~/.vim
git submodule update --init
```

To get the color scheme working you may have to install the solarized colorscheme for your terminal: http://ethanschoonover.com/solarized

##Managing Plugins
You can 
add plugins by running `./add-plugin pluginURL pluginName`
remove plugins by running `./remove-plugin pluginName`
update plugins by running `./update-plugins`
