-- Diagnostic and quickfix navigation.

-- Open floating diagnostic popup
vim.keymap.set("n", "<leader>td", vim.diagnostic.open_float, {
	desc = "Show line diagnostics",
	noremap = true,
	silent = true,
})

-- Jump to next/previous error
vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({
		severity = vim.diagnostic.severity.ERROR,
	})
end, {
	desc = "Next error",
	noremap = true,
	silent = true,
})
vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({
		severity = vim.diagnostic.severity.ERROR,
	})
end, {
	desc = "Previous error",
	noremap = true,
	silent = true,
})

-- Jump to next/previous warning
vim.keymap.set("n", "]w", function()
	vim.diagnostic.goto_next({
		severity = vim.diagnostic.severity.WARN,
	})
end, {
	desc = "Next warning",
	noremap = true,
	silent = true,
})
vim.keymap.set("n", "[w", function()
	vim.diagnostic.goto_prev({
		severity = vim.diagnostic.severity.WARN,
	})
end, {
	desc = "Previous warning",
	noremap = true,
	silent = true,
})

-- Open diagnostic quickfix list
vim.keymap.set("n", "<leader>qq", function()
	vim.diagnostic.setqflist()
end, {
	desc = "Open diagnostic Quickfix list",
	noremap = true,
	silent = true,
})

-- Clear quickfix and location lists
vim.keymap.set("n", "<leader>qc", function()
	vim.cmd.cexpr({})
	vim.cmd.lexpr({})
end, {
	desc = "Clear diagnostic lists",
	noremap = true,
	silent = true,
})

-- Close both quickfix and location lists
vim.keymap.set("n", "<leader>qx", function()
	vim.cmd.cclose()
	vim.cmd.lclose()
end, {
	desc = "Close diagnostic lists",
	noremap = true,
	silent = true,
})

-- Show floating diagnostics when idle (like hover, but for errors)
vim.api.nvim_create_autocmd("CursorHold", {
	group = vim.api.nvim_create_augroup("DiagnosticHover", {
		clear = true,
	}),
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false,
			close_events = {
				"BufLeave",
				"CursorMoved",
				"InsertEnter",
			},
			source = "if_many",
			prefix = "  ",
		})
	end,
	desc = "Show diagnostics on hover",
})
