--
--  HACK: Autocmds
--

-----------------------------------------------------------
--  INFO: Macros status notify
-----------------------------------------------------------
vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		local msg = string.format("󰻃 Recording Macro : (Register:  %s)", vim.fn.reg_recording())
		_MACRO_RECORDING_STATUS = true
		vim.notify(msg, vim.log.levels.INFO, {
			title = "Macros",
			keep = function()
				return _MACRO_RECORDING_STATUS
			end,
		})
	end,
	group = vim.api.nvim_create_augroup("NoiceMacroNotfication", { clear = true }),
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		_MACRO_RECORDING_STATUS = false
		vim.notify(" Recorded!", vim.log.levels.INFO, {
			title = "Macros",
			timeout = 2000,
		})
	end,
	group = vim.api.nvim_create_augroup("NoiceMacroNotficationDismiss", { clear = true }),
})

-----------------------------------------------------------
--  INFO: Open help window in vertical split
-----------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

-----------------------------------------------------------
--  INFO: Resize splits when the terminal window resized
-----------------------------------------------------------
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-----------------------------------------------------------
--  INFO: No auto continue comments on new line
-----------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-----------------------------------------------------------
--  INFO: Syntax highlighting for dotenv files
-----------------------------------------------------------
vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("dotenv_ft", { clear = true }),
	pattern = { ".env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dosini"
	end,
})
