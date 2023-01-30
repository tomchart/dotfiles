local mason = require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")


mason_lspconfig.setup({
  automatic_installation = true
})

local on_attach = function (client)
  client.server_capabilities.semanticTokensProdiver = nil
end

lspconfig.bashls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = on_attach,
})

lspconfig.cssls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = on_attach,
  filetypes = {
    "html",
    "css",
  }
})

lspconfig.cssmodules_ls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = on_attach,
  filetypes = {
    "html",
    "css",
  },
  root_dir = function(fname)
    return vim.fn.getcwd()
  end,
})

lspconfig.html.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = on_attach,
  filetypes = {
    "html",
    "php"
  },
})

lspconfig.intelephense.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = on_attach,
})

lspconfig.jsonls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = on_attach,
})

lspconfig.pyright.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = on_attach,
  root_dir = function(fname)
    return vim.fn.getcwd()
  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        autoImportCompletions = false,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        pythonPath = "/usr/bin/python",
        extraPaths = {
          "/home/tom/.local/lib/python3.7/site-packages",
          "/usr/local/lib/python3.7/site-packages",
          "/home/tom/.pyenv/versions/rev3910/lib/python3.9/site-packages",
        },
      },
    },
  },
})

lspconfig.sumneko_lua.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
      completion = {
        keywordSnippet = 'Disable',
      },
    },
  },
})

lspconfig.tsserver.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = on_attach,
  root_dir = function()
    return vim.fn.getcwd()
  end,
})

local signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
}
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = true,
	float = {
		source = "always",
	},
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
vim.keymap.set("n", "E", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set('n', '[d', vim.diagnostic.goto_next)
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)
