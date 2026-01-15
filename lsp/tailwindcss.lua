return {
  name = "tailwindcss",

  cmd = { "tailwindcss-language-server", "--stdio" },

  filetypes = {
    "html",
    "css",
    "scss",
    "sass",
    "postcss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "astro",
  },

  root_dir = vim.fs.root(0, {
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "package.json",
    ".git",
  }),

  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidScreen = "error",
        invalidVariant = "error",
        invalidConfigPath = "error",
      },
      experimental = {
        classRegex = {
          -- clsx / cn / cva
          { "clsx%(([^)]*)%)", "[\"'`]([^\"'`]*)[\"'`]" },
          { "cn%(([^)]*)%)", "[\"'`]([^\"'`]*)[\"'`]" },
          { "cva%(([^)]*)%)", "[\"'`]([^\"'`]*)[\"'`]" },
        },
      },
    },
  },
}
