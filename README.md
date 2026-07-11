# homebrew-yunxin

Homebrew tap for NetEase Yunxin desktop applications.

## Available casks

| Cask | Description |
|------|-------------|
| [tokbox](https://tokbox.netease.im/) | NetEase IM desktop client |

## Install

### One-line installer (recommended)

Add the tap and list available casks:

```bash
curl -fsSL https://raw.githubusercontent.com/netease-im/homebrew-yunxin/main/install.sh | bash
```

Add the tap and install a specific cask (e.g. `tokbox`) in one go:

```bash
curl -fsSL https://raw.githubusercontent.com/netease-im/homebrew-yunxin/main/install.sh | bash -s -- tokbox
```

The script installs Homebrew (if missing), adds the tap, then installs the
named cask(s). Pass multiple names to install several at once.

### Manual

```bash
brew tap netease-im/yunxin
brew install --cask tokbox
```

Or, in one line:

```bash
brew install --cask netease-im/yunxin/tokbox
```

## Upgrade

```bash
brew upgrade --cask tokbox
```

## Uninstall

```bash
brew uninstall --cask tokbox
brew untap netease-im/yunxin
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
