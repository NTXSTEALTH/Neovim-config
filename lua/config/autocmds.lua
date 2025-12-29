vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "javascriptreact", "typescriptreact" },
	callback = function(args)
		vim.lsp.start({
			name = "tailwindcss",
			bufnr = args.buf,
			root_dir = vim.loop.cwd(), -- FORCE root
		})
	end,
})
