# homebrew-yunxin

Homebrew tap for NetEase Yunxin desktop applications.

## Available casks

| Cask | Description |
|------|-------------|
| [tokbox](https://tokbox.netease.im/) | NetEase IM desktop client |

## Install

```bash
brew tap netease/yunxin
brew install --cask tokbox
```

Or, in one line:

```bash
brew install --cask netease/yunxin/tokbox
```

## Upgrade

```bash
brew upgrade --cask tokbox
```

## Uninstall

```bash
brew uninstall --cask tokbox
brew untap netease/yunxin
```

## Releasing a new version

1. Upload the new `Tokbox_<version>_universal.dmg` to the package host.
2. Compute the SHA-256:

   ```bash
   shasum -a 256 Tokbox_<version>_universal.dmg
   ```

3. Update `Casks/tokbox.rb` with the new `version` and `sha256`, then commit.

The `#{version}` token in the `url` is interpolated automatically by Homebrew,
so the download URL stays in sync with the declared version.

## Adding a new application

Create a new file under `Casks/<name>.rb`. See `Casks/tokbox.rb` for a
reference template, then validate with:

```bash
brew style Casks/<name>.rb
```
