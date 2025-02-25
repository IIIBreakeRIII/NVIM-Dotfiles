require('nvim-treesitter.configs').setup {
  -- 설치할 언어 목록. 필요에 따라 추가하거나 수정하세요.
  ensure_installed = { "python", "lua", "c" },
  
  -- 언어 파서를 동기적으로 설치하지 않음 (비동기 설치)
  sync_install = false,
  
  -- 누락된 파서를 파일을 열 때 자동으로 설치
  auto_install = true,

  -- 구문 하이라이팅 활성화
  highlight = {
    enable = true,
    -- 파일 길이가 너무 긴 경우 하이라이팅 비활성화 (옵션)
    -- disable = function(lang, buf)
    --   return vim.api.nvim_buf_line_count(buf) > 1000
    -- end,
    additional_vim_regex_highlighting = false,
  },

  -- 자동 들여쓰기 활성화 (언어에 따라 비활성화 가능)
  indent = {
    enable = true,
    disable = { "python" }, -- 예: python은 들여쓰기 설정이 충돌할 수 있으므로 비활성화
  },

  -- 증분 선택 (incremental selection) 활성화 및 키맵 설정
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",      -- 선택 시작
      node_incremental = "grn",      -- 다음 노드로 확장
      scope_incremental = "grc",     -- 스코프 단위 확장
      node_decremental = "grm",      -- 선택 축소
    },
  },

  -- 텍스트 객체 기능 활성화 (함수, 클래스 등의 영역 선택 및 이동)
  textobjects = {
    select = {
      enable = true,
      lookahead = true,  -- 자동 전진
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,  -- 점프 기록 남김
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
    },
  },
}

return {}
