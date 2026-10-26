# Configuration sync

This is the chezmoi source for `rafael-alani/dotfiles`. Locate it with
`chezmoi source-path`; ignore the unrelated Git snapshot in `~/.config`.
For app ownership or restore procedures, read [docs/restoring.md](docs/restoring.md).

## Scope

- Back up selected portable text settings and the intended package list.
  Outside `.config`, the agreed settings scope is Rime, VS Code, cmux/Stats
  preferences and SSH configuration. Expand it only when requested.
- Keep Brewfile aligned with desired installed apps and explicitly requested
  tools; avoid dumping every transitive dependency. Updating the backup does
  not require installing or upgrading software on the current machine.
- Follow latest upstream for external dependencies; add no version pins unless
  requested. Preserve existing app lockfiles when capturing configuration.
- Private app data, credentials, binary exports, learned dictionaries/snapshots,
  caches and rollback backups belong outside this repo. Raycast may be in
  Brewfile; its live configuration remains excluded.
- Keep custom-tool code and generated installation files with their owning
  repositories. Record latest-source restore steps here. SquirrelVoice's
  installer owns its Lua hook, schema patch, app and LaunchAgent.
- Capture selected macOS preference keys through `defaults`, not whole plists.
  Preserve macOS/workstation guards and existing directory/file permissions;
  use chezmoi's `private_` attributes where needed.
- This repository is public. Keep SSH connection details in local chezmoi data
  with restore-time prompts; keep private keys and tokens out of Git.

## Sync workflow

1. Compare live files, chezmoi source, and freshly fetched `origin/main`.
   Preserve unrelated edits. For backup requests, capture intended live changes
   before applying anything; never overwrite them with stale source state.
2. Add/re-add explicit paths only. Review `chezmoi diff` before applying selected
   targets. Keep documentation and this root `AGENTS.md` ignored as destinations
   so they are not deployed into the home directory.
3. Check `git diff --check` and staged contents. Run `chezmoi status`/`verify`;
   distinguish deliberate drift from failures. For changed restore behavior,
   test in a temporary destination with separate state/cache; isolate preference
   writes and preserve unmanaged files and keys.
4. For an authorized GitHub sync, commit only scoped changes, push normally and
   verify the remote commit. Audit-only requests stop at findings. Report what
   changed and what remains untested; clean Git is not proof of a full restore.
