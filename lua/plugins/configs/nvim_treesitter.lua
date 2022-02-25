local present, tree = pcall(require, "nvim-treesitter")

if not present then
	return
end

local ts_configs = require("nvim-treesitter.configs")

default = {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		use_languagetree = true,
		disable = { "yaml" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "grn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
		disable = { "yaml", "python" },
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ia"] = "@parameter.inner",
				["aa"] = "@parameter.outer",
				["ic"] = "@call.inner",
				["ac"] = "@call.outer",
				["iC"] = "@class.inner",
				["aC"] = "@class.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
			},
			goto_next_end = {
				["[F"] = "@function.outer",
				["[C"] = "@class.outer",
			},
			goto_previous_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_previous_end = {
				["]F"] = "@function.outer",
				["]C"] = "@class.outer",
			},
		},
	},
}

local M = {}

M.setup = function()
	ts_configs.setup(default)
end

return M
