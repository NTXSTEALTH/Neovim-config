return {
	-- FIX: Windows requirement for Mason/npm binaries
	cmd = { "vtsls.cmd", "--stdio" },
	detached = false,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	settings = {
		complete_function_calls = true,
		vtsls = {
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		typescript = {
			updateImportsOnRename = "always",
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				variableTypes = { enabled = false },
			},
		},
	},
	root_dir = function(bufnr, on_dir)
		local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb" }
		local markers = root_markers
		if vim.fn.has("nvim-0.11.0") == 1 then
			markers = { root_markers, { ".git" } }
		else
			markers = vim.list_extend(root_markers, { ".git" })
		end

		local project_root = vim.fs.root(bufnr, markers) or vim.fn.getcwd()
		if on_dir then
			on_dir(project_root)
		end
		return project_root
	end,
	on_attach = function(client, bufnr)
		-- Custom command to organize imports (vtsls specific)
		vim.api.nvim_buf_create_user_command(bufnr, "OrganizeImports", function()
			vim.lsp.buf.execute_command({
				command = "typescript.organizeImports",
				arguments = { vim.api.nvim_buf_get_name(bufnr) },
			})
		end, { desc = "Organize Imports" })
	end,
}
