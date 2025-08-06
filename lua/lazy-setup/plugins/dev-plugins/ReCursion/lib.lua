-- lua/lazy-setup/plugins/dev-plugins/ReCursion/lib.lua
local M = {}
local result_bufnr, result_winid

local function run_cmd(cmd)
  local h = io.popen(cmd)
  local out = h:read("*a")
  h:close()
  return out
end

local function open_window(ft)
  if result_bufnr and vim.api.nvim_buf_is_valid(result_bufnr)
     and result_winid   and vim.api.nvim_win_is_valid(result_winid)
  then
    vim.api.nvim_set_current_win(result_winid)
    vim.api.nvim_buf_set_lines(result_bufnr, 0, -1, false, {})
  else
    vim.cmd("rightbelow vsplit")
    result_winid = vim.api.nvim_get_current_win()
    vim.cmd("enew")
    result_bufnr  = vim.api.nvim_get_current_buf()
  end
  vim.bo[result_bufnr].filetype   = ft
  vim.bo[result_bufnr].buftype    = "nofile"
  vim.bo[result_bufnr].bufhidden  = "hide"
  vim.bo[result_bufnr].swapfile   = false
  vim.bo[result_bufnr].modifiable = true

  vim.keymap.set("n", ";bd", function()
    vim.cmd("bd")
  end, { buffer = result_bufnr, silent = true, noremap = true })
end

local function finalize()
  if result_bufnr and vim.api.nvim_buf_is_valid(result_bufnr) then
    vim.bo[result_bufnr].modifiable = false
  end
end

-- ▶ 수정된 disasm(): 소스 interleaved objdump
function M.disasm()
  
  local orig_fname = vim.fn.expand("%:t")

  local tmp_c = "/tmp/recursion_code.c"
  local tmp_o = "/tmp/recursion_code.o"

  -- C 파일 저장 & 디버그 심볼 포함 컴파일
  vim.cmd("write! " .. tmp_c)
  run_cmd("gcc -g -O0 -c " .. tmp_c .. " -o " .. tmp_o)

  -- 원본 소스와 함께 어셈블리 뽑기(-l:라인번호, -S:소스 interleave)
  local asm = run_cmd("objdump -d -l -S " .. tmp_o)

  open_window("asm")
  vim.api.nvim_buf_set_lines(result_bufnr, 0, -1, false, vim.split(asm, "\n"))
  vim.api.nvim_buf_set_name(result_bufnr, orig_fname .. "-Decompile")

  finalize()
end

function M.decompile()

  local orig_fname = vim.fn.expand("%:t")
  local tmp_c = "/tmp/recursion_code.c"
  local tmp_o = "/tmp/recursion_code.o"
  local tmp_dc= "/tmp/recursion_code_decompiled.c"

  vim.cmd("write! " .. tmp_c)
  run_cmd("gcc -c -O0 " .. tmp_c .. " -o " .. tmp_o)
  run_cmd("retdec-decompiler --output " .. tmp_dc .. " " .. tmp_o)

  local dc = run_cmd("cat " .. tmp_dc)

  open_window("c")
  vim.api.nvim_buf_set_lines(result_bufnr, 0, -1, false, vim.split(dc, "\n"))
  vim.api.nvim_buf_set_name(result_bufnr, orig_fname .. "-Disassemble")

  finalize()
end

function M.setup()
  vim.api.nvim_create_user_command("ReCDisasm",    M.disasm,    {})
  vim.api.nvim_create_user_command("ReCDecompile", M.decompile, {})
end

return M
