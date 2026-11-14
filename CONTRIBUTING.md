# Contributing to Monokai Neovim

Thanks for taking the time to contribute. This is a personal Neovim config, but issues and pull requests are welcome as long as they stay small, focused, and consistent with the existing setup.

## Project layout

```
init.lua                  # Entry point: lazy.nvim bootstrap, VSCode mode branch
lazy-lock.json            # Pinned plugin revisions (committed)
lazyvim.json              # LazyVim version metadata
lua/
  config/                 # lazy, options, keymaps, autocmds
  code/                   # Minimal config used when running inside VSCode (vim.g.vscode)
  plugins/                # One file per plugin spec
    lsp/                  # mason, lspconfig, conform
    cmp/                  # nvim-cmp and completion sources
    treesitter/           # parsers, textobjects, treesj, context
    custom/               # Custom plugins (projects picker)
assets/
  preview/                # Screenshots used in README.md
  icons/                  # Custom icons
```

There is no test suite and no CI. Validation is done by launching Neovim and exercising the change, both in the normal config and in VSCode mode.

## Requirements

- Neovim 0.10+ (the config uses `vim.uv`)
- Git, `ripgrep`, and a Nerd Font
- Node.js for the JS/TS language servers and Prettier
- Optional: `tmux` for `vim-tmux-navigator`

## Local setup

Fork the repo, then clone it over your existing config (back it up first):

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/<your-user>/monokai-neovim.git ~/.config/nvim
nvim
```

To test without touching your daily config:

```bash
git clone https://github.com/Malick-Tammal/monokai-neovim.git ~/.config/nvim-test
NVIM_APPNAME=nvim-test nvim
```

Before opening a PR, check that:

- `:Lazy` shows no errors and `lazy-lock.json` only contains intended changes
- `:checkhealth` reports no new failures
- `:messages` is free of startup errors
- Startup stays reasonable: `nvim --startuptime /tmp/nvim-start.log` (the config targets a fast startup)
- The VSCode path still loads: `nvim --cmd "lua vim.g.vscode = true"`
- Formatting was applied with `stylua` (also available via `:ConformInfo` / Mason)

## Coding conventions

- **One plugin per file** in `lua/plugins/`, returning a lazy.nvim spec table. Group by concern in subfolders: `lsp/`, `cmp/`, `treesitter/`, `custom/`.
- **Lazy by default.** `lua/config/lazy.lua` sets `lazy = true` globally. Prefer `event`, `cmd`, or `keys` over `lazy = false`; colorschemes are the exception (`priority = 9999`).
- **VSCode guard.** Plugins and LSP modules that do not work inside the VSCode extension must set `cond = not vim.g.vscode`. The VSCode path lives in `lua/code/`.
- **Pin versions only when needed.** If a plugin update breaks the config, pin it with `tag` or `commit` and add a short comment explaining why (see `monokai-pro` pinned to `v1.26.0`).
- **Every keymap needs a `desc`.** Use `<leader>` (`Space`) and keep the existing prefix scheme (`<leader>c` for code, `<leader>s` for splits, `<leader>d` for diagnostics, `<leader>t` for toggles, `<leader>G` for git).
- **Format with `stylua`** — tabs for indentation (4-column width), double quotes, no trailing whitespace. There is no `stylua.toml`, so defaults apply.
- **Keep section comments.** Header blocks (`--  HACK:`, `--  INFO:`, `--  TIP:`, `--  TODO:`) are used consistently; match them in new files.
- **Do not reformat unrelated code.** A PR should diff only what it claims to change.
- **Avoid new plugins when a builtin or an existing plugin already covers it.** The config already loads 50+ plugins.

### Adding a plugin

```lua
return {
	"author/plugin.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	opts = {},

	keys = {
		{ "<leader>xx", "<Cmd>PluginToggle<CR>", desc = "Toggle plugin" },
	},

	-- HACK: Explain any non-obvious configuration here
	config = function()
		require("plugin").setup({})
	end,
}
```

1. Add the file under the matching `lua/plugins/` folder.
2. Add keymaps with `desc` (either in `keys` or `lua/config/keymaps.lua`).
3. Update `lazy-lock.json` via `:Lazy sync`.
4. If the plugin adds UI, add a screenshot to `assets/preview/` and reference it in `README.md`.

### Adding an LSP or formatter

1. Add the server to `ensure_installed` in `lua/plugins/lsp/mason.lua`.
2. Add or extend the setup in `lua/plugins/lsp/lsp_config.lua` (capabilities, settings, filetypes).
3. Register the formatter in `formatters_by_ft` inside `lua/plugins/lsp/conform.lua`.
4. Add the parser to the treesitter `ensure_installed` list when highlighting is needed.
5. Document the language in the Features section of `README.md`.

## Commit messages

Short, imperative, and technical. Keep messages scannable — a reader should understand the change without opening a diff.

### Format

```
<Subject line>

- <change>
- <change>
```

### Rules

- **Subject line** — one line, under 72 characters, imperative mood ("Improve", not "Improved" or "Improves"). No trailing period. Summarize the overall goal, not a list of files.
- **Body** — bullet list, one bullet per logical change. Each bullet starts with an imperative verb (Add, Fix, Remove, Tighten, Show, Update). Group related changes into a single bullet when they belong together.
- **Be technical, not vague** — include concrete values, thresholds, and component names where they matter (`0.5`, `50 samples`, `RegisterView`). Avoid filler like "improve performance" or "update stuff".
- **No trailers** (`Co-authored-by`, etc.) unless it is a merge or release commit.

### Examples

```
Add yaml LSP and formatter

- Register yamlls in Mason ensure_installed and lspconfig
- Format yaml with prettier via Conform
- Enable highlight for yaml in treesitter
```

```
Tighten Neotree git symbols and add LspInfo alias

- Replace default git glyphs with Nerd Font icons in NeoTreeGitAdded/Modified/Deleted
- Map <leader>li to :LspInfo<CR> to match muscle memory
- Remove unused <leader>lq mapping
```

```
Fix real-icons pin and QML LSP flags

- Pin nvim-web-devicons to a specific commit to stop icon regressions
- Pass -E to qmlls to skip the experimental warning
- Disable color names in nvim-colorizer
```

### Anti-patterns

```
improved the face stuff
update files
fix bugs
```

Vague, non-imperative, no technical detail — don't do this.

## Pull requests

- Branch from `main`; keep one logical change per PR.
- Use a descriptive branch name: `feat/yaml-lsp`, `fix/qml-format`, `chore/plugin-bump`.
- Write the PR title in the same style as a commit subject, and put the bullet list in the description.
- State what you tested (Neovim version, OS, VSCode mode, affected filetypes).
- Include `lazy-lock.json` only when plugin revisions actually changed.
- Keep screenshots or recordings for visual changes; store them under `assets/preview/`.

## Reporting issues

Include:

- Neovim version (`nvim --version`) and OS
- The exact steps to reproduce, starting from `nvim`
- Relevant output from `:messages`, `:checkhealth`, or `:Lazy`
- Whether it happens with `NVIM_APPNAME=nvim-test nvim` on a clean clone

## Scope and license

This repo has no license file. Treat it as a personal config: fork and adapt freely, but ask before redistributing it as-is or publishing it under another name.
