# Restoring the workstation configuration

This repository owns the Brewfile and selected text configuration. Outside
`.config`, the managed application settings are Rime, VS Code, cmux and Stats,
plus SSH configuration. Packages use the current available versions. No custom
tool/runtime installer or version-pinning layer is maintained here.

Private application data, credentials, binary settings exports and Rime learned
dictionary snapshots are handled independently. Raycast is installed through the
Brewfile, but its live configuration is excluded. SquirrelTranslate is not part
of this setup.

## Restore

After installing Homebrew and chezmoi:

```sh
chezmoi init https://github.com/rafael-alani/dotfiles.git
chezmoi apply --exclude scripts "$HOME/.Brewfile"
brew bundle --file="$HOME/.Brewfile"
```

Select the `workstation` profile. Close cmux and Stats, then apply the remaining
configuration:

```sh
chezmoi apply -R
```

The cmux/Stats script writes only selected preference keys using macOS `defaults`;
it runs initially and again when the script contents change. Relaunch the apps
after restoring. macOS may require enabling Stats as a login item separately.
The script and Library app settings are disabled for the `headless` profile;
the new Library settings are also disabled outside macOS.

SSH configuration restores with private file/directory permissions. Its Colima
include uses the destination home directory, and `UseKeychain` is tolerated on
other OpenSSH clients. Host addresses, the worker alias and username are supplied during `chezmoi init`
and saved only in local chezmoi data, outside Git. Blank values omit those host
blocks. Recover these connection details and the referenced private keys independently.

## Squirrel / Rime

Homebrew installs `squirrel-app` into `/Library/Input Methods/Squirrel.app`.
Chezmoi restores the two personal patches under `~/Library/Rime` and fetches
these three files from the current `master` branch of
[rime/rime-terra-pinyin](https://github.com/rime/rime-terra-pinyin):

- `terra_pinyin.schema.yaml`
- `terra_pinyin.dict.yaml`
- `terra_pinyin_12345.schema.yaml`

They are deliberately unpinned, with a 24-hour cache refresh period. Use
`chezmoi apply -R` to fetch the latest files immediately. This only updates the
three source files and the personal patches; it does not manage learned data,
installation identity or the generated `build` directory.

Enable Squirrel in macOS input sources, run **Deploy** from its menu, then check
numeric tones `12345`, candidate selection `67890` and simplified output. Run
Deploy again after updating its source files. No snapshot recovery is performed.

## Capture future preference changes

Use `chezmoi re-add` on individual managed text files after editing them. For
cmux/Stats changes, update only the intended keys in
`.chezmoiscripts/run_onchange_after_20-macos-app-preferences.sh.tmpl` after reading
their current values with `defaults read`. Do not add entire preference plists.

The earlier local restoration audit records broader research; the scope above
is the selected implementation and supersedes its pinning and backup proposals.
