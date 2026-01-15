# Neovim Plugin Setup

This is my custom **Neovim** config, build uing **Lazy** as my plugins manager as a fast and modern approach.

## Features

- Performance & lazy-loading
- Native LSP workspace support
- Modern UI/UX
- Configured Formatting, linting, and code intelligence

## Categorized plugins overview

### Plugin Manager & Core

- **lazy.nvim** – Plugin manager with lazy-loading and locking
- **plenary.nvim** – Utility functions used by many plugins
- **nvim-web-devicons** – Filetype icons

---

### LSP, Completion & AI

- **nvim-lspconfig** – LSP configurations (native LSP approach)
- **mason.nvim** – Manages external tools (LSPs, linters, formatters)
- **blink.cmp** – Fast completion engine (LSP, snippets, buffer, etc.)
- **friendly-snippets** – Community snippet collection
- **lazydev.nvim** – Better Lua development for Neovim configs
- **neocodeium** – AI-assisted code completion

---

### Formatting & Linting

- **conform.nvim** – Formatter manager (format-on-save, fixes)
- **nvim-lint** – Asynchronous linting framework

---

### Treesitter & Syntax

- **nvim-treesitter** – AST-based syntax highlighting & parsing
- **vim-matchup** – Improved % matching using Treesitter
- **nvim-ts-autotag** – Auto-close & rename HTML/JSX tags
- **ts-comments.nvim** – Smarter comment handling

---

### Navigation & Search

- **telescope.nvim** – Fuzzy finder (files, grep, LSP, etc.)
- **flash.nvim** – Enhanced motion & jump navigation
- **which-key.nvim** – Displays keybinding hints

---

### UI, Status & Notifications

- **lualine.nvim** – Statusline
- **noice.nvim** – Better UI for messages, cmdline, LSP
- **nui.nvim** – UI components used by Noice & others
- **trouble.nvim** – Diagnostics, references & quickfix UI
- **indent-blankline.nvim** – Indentation guides
- **render-markdown.nvim** – Enhanced Markdown rendering
- **colorful-menu.nvim** – Colored completion menus

---

### Colors, Themes & Visuals

- **themify.nvim** – Theme manager
- **transparent.nvim** – Transparent background support
- **nvim-colorizer.lua** – Inline color previews
- **tailwindcss-colorizer-cmp.nvim** – Tailwind color previews in completion
- **smear-cursor.nvim** – Cursor motion effects
- **cinnamon.nvim** – Smooth scrolling

---

### Tailwind CSS

- **tailwind-tools.nvim** – Tailwind CSS utilities & LSP helpers

---

### Git & Productivity

- **gitsigns.nvim** – Git diff signs & hunk actions
- **todo-comments.nvim** – Highlight and search TODO/FIXME comments

---

### Terminals & Runners

- **toggleterm.nvim** – Floating & split terminals
- **code_runner.nvim** – Run code directly from Neovim
- **live-server.nvim** – Launch a live web server

---

### Editing Enhancements

- **tabout.nvim** – Jump out of brackets, quotes, etc.
- **smart-backspace.nvim** – Smarter backspace behavior
- **snacks.nvim** – Small productivity utilities
- **bento.nvim** – Layout & UX helpers

---

### Python

- **venv-selector.nvim** – Python virtual environment selector

---

### Version Locking

All plugins are pinned to specific commits using `lazy-lock.json` to ensure:

- Reproducible installs
- Stable behavior
- No unexpected breaking changes

---

### Philosophy

This setup follows a **clear separation of concerns**:

- **LSP** → diagnostics & intelligence
- **nvim-lint** → linting
- **conform.nvim** → formatting
- **blink.cmp** → completion UI

No monolithic plugins, no overlap, no magic.

---

### Requirements

- Neovim ≥ 0.10
- Node.js (for JS/TS, Tailwind, basedpyright)
- Python (for Python tooling)

---

Feel free to fork, adapt, or borrow the config
