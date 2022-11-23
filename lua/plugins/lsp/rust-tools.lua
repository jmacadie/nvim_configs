local rust_tools_status, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status then
  return
end

local extension_path = vim.env.HOME .. "/.vscode-server/extensions/vadimcn.vscode-lldb-1.8.1/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

-- configure rust-tools server with plugin
rust_tools.setup({
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },
  server = {
    settings = { -- Custom settings for rust-tools
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
})
