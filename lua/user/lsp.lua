lvim.lsp.buffer_mappings.normal_mode["gd"] = {
  "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>",
  "Goto definition"
}
lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
  "Goto references"
}
lvim.lsp.buffer_mappings.normal_mode["gI"] = {
  "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>",
  "Goto Implementation"
}
