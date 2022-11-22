local rust_tools_status, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status then
  return
end

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
})
