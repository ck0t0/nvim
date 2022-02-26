local status_ok, dap_install = pcall(require, "dap-install")
if not status_ok then
  return
end

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

dap_install.config("python", {})
-- dap_install.config("codelldb", {})

local dap, dapui = require("dap"), require("dapui")

dapui.setup({
  highlights: {
    DapUIVariable: Normal
    -- vim.cmd("hi default link DapUIVariable Normal")
    -- vim.cmd("hi default DapUIScope guifg=#00F1F5")
    -- vim.cmd("hi default DapUIType guifg=#D484FF")
    -- vim.cmd("hi default link DapUIValue Normal")
    -- vim.cmd("hi default DapUIModifiedValue guifg=#00F1F5 gui=bold")
    -- vim.cmd("hi default DapUIDecoration guifg=#00F1F5")
    -- vim.cmd("hi default DapUIThread guifg=#A9FF68")
    -- vim.cmd("hi default DapUIStoppedThread guifg=#00f1f5")
    -- vim.cmd("hi default link DapUIFrameName Normal")
    -- vim.cmd("hi default DapUISource guifg=#D484FF")
    -- vim.cmd("hi default DapUILineNumber guifg=#00f1f5")
    -- vim.cmd("hi default DapUIFloatBorder guifg=#00F1F5")
    -- vim.cmd("hi default DapUIWatchesEmpty guifg=#F70067")
    -- vim.cmd("hi default DapUIWatchesValue guifg=#A9FF68")
    -- vim.cmd("hi default DapUIWatchesError guifg=#F70067")
    -- vim.cmd("hi default DapUIBreakpointsPath guifg=#00F1F5")
    -- vim.cmd("hi default DapUIBreakpointsInfo guifg=#A9FF68")
    -- vim.cmd("hi default DapUIBreakpointsCurrentLine guifg=#A9FF68 gui=bold")
    -- vim.cmd("hi default link DapUIBreakpointsLine DapUILineNumber")
  }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


