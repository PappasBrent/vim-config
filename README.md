# Brent's Vim Configuration

## Quickstart

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

