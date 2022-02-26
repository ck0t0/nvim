local status_ok, dap_install = pcall(require, "dap-install")
if not status_ok then
  return
end

dap_install.setup {
  installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
}

dap_install.config("python", {})
-- dap_install.config("codelldb", {})

vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

local dap, dapui = require "dap", require "dapui"

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup()
vim.g.dap_virtual_text = true
