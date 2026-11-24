# clean claude

**macOS only.** It needs [Claude Code](https://claude.ai/code) and a Claude login.

`clean claude` starts Claude Code in a fresh folder inside the folder you're in, using a profile you choose, or a throwaway one that keeps nothing.

## Install

On a Mac with Node:

```sh
npx clean-claude
```

On a Mac with nothing set up:

```sh
curl -sL mlopchat.github.io/clean-claude/install | sh
```

This installs to `~/.clean-claude` and adds a `clean` command (plus `clean-claude`) in `~/.local/bin`. If you're already in a project folder, it starts the menu straight away.

## Use

```sh
cd my-project
clean claude
```

Each session runs in `my-project/Clean Claude Code/<session name>/` and can read and edit `my-project`.

A profile sets three things:

- **What loads:**
  - **Everything:** your whole Claude Code setup.
  - **MCP servers + skills:** your MCP servers and skills, plus a starter CLAUDE.md. No plugins or hooks.
  - **Bare:** stock Claude Code plus Context7.
- **Memory:**
  - **Off.**
  - **Built-in:** kept per profile.
  - **Claude Memory MCP:** needs Node.
  - **Brutal mode:** every transcript is saved, and the next session lists what was left unfinished.
- **Sandbox:** on or off.

The MCP servers and skills you don't have are skipped. Profiles other than Everything keep their own login, so type `/login` the first time you use one.

## Uninstall

```sh
rm -rf ~/.clean-claude ~/.local/bin/clean ~/.local/bin/clean-claude
```

Before running that, check that `~/.local/bin/clean` is clean claude's link and not another tool.

## License

MIT
