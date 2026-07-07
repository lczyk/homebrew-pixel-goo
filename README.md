# homebrew-pixel-goo

homebrew tap for [pixel-goo](https://github.com/lczyk/pixel-goo) -- a gpu particle
simulation where particles follow each other's trails.

## install

```sh
brew tap lczyk/pixel-goo
brew trust lczyk/pixel-goo
brew install goo
```

builds from source (deps are vendored, so it's a quick self-contained build). installs
the `goo` cli everywhere, plus the `goo-macwp` desktop-wallpaper binary on macos.

brew-installed binaries aren't gatekeeper-quarantined, so no "allow anyway" dance.

## update

```sh
brew update && brew upgrade goo
```
