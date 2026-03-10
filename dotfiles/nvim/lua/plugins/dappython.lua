return {
	"mfussenegger/nvim-dap-python",
	config = function()
		local executable
		executable = vim.fn.exepath("python3")
		if executable == "" then
			executable = vim.fn.exepath("python")
		end

		if executable == "" then
			error("Could not find python executable for dap-python", 0)
		end
		require("dap-python").setup(executable)
	end,
}
