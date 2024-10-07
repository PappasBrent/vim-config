# Brent's Vim Configuration

## Prerequisites

- Python 2
- `python2-config`
- Python 3.8+
- `python3-config`
<!-- TODO(Brent): See if you can get this to work without installing Lua or Perl... -->
- Lua
- Perl
- Ripgrep

## Quickstart

- Download, build, and install vim:

    ```bash
    cd ~
    git clone https://github.com/vim/vim.git vim
    cd vim

    ./configure --with-features=huge \
        --enable-multibyte \
        --enable-python3interp=yes \
        --with-python3-config-dir=$(python3-config --configdir) \
        --enable-gui=gtk2 \
        --enable-cscope \
        --prefix=/usr/local

    make -j 8 VIMRUNTIMEDIR=/usr/local/share/vim/vim91
    sudo make install
    sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/vim 100
    ```

- Clone this repo to your home directory with the name `.vim`:

    ```bash
    git clone https://github.com/pappasBrent/vim-config.git .vim
    ```
- Run `download-vim-plug.sh` to install vim-plug to manage plugins:

    ```bash
    chmod +x download-vim-plug.sh
    ./download-vim-plug.sh
    ```

- Create a symbolic link to this directory's `.vimrc` file:

    ```bash
    ln -s .vim/.vimrc .vimrc
    ```

- Open Vim, and while in normal mode run `:PlugInstall`.

