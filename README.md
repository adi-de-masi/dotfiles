# dotfiles
My Configuration

## Usage

From [hackernews](https://news.ycombinator.com/item?id=11071754):

I use:
```
    git init --bare $HOME/.myconf
    alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
    config config status.showUntrackedFiles no
```

where my ~/.myconf directory is a git bare repository. Then any file within the home folder can be versioned with normal commands like:

```
    config status
    config add .vimrc
    config commit -m "Add vimrc"
    config add .config/redshift.conf
    config commit -m "Add redshift config"
    config push
```

And so one…
No extra tooling, no symlinks, files are tracked on a version control system, you can use different branches for different computers, you can replicate you configuration easily on new installation.

