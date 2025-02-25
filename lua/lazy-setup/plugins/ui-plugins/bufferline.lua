local bufferline = require("bufferline")
bufferline.setup {
  options = {
    mode = "buffers",                               -- 버퍼 모드 설정 ("buffers" 또는 "tabs")
    style_preset = 
      {
        bufferline.style_preset.default, -- 기본 스타일 사용 (또는 minimal)
        bufferline.style_preset.no_bold
      },
    themable = false,                                -- 하이라이트 그룹을 덮어쓸 수 있도록 설정

    numbers = "ordinal",                               -- 버퍼 번호 표시 방식 (none, ordinal, buffer_id, both 또는 함수)
    close_command = "bdelete! %d",                  -- 버퍼 닫기 명령어
    right_mouse_command = "bdelete! %d",            -- 오른쪽 마우스 클릭 시 닫기 명령어
    left_mouse_command = "buffer %d",               -- 왼쪽 마우스 클릭 시 버퍼 전환
    middle_mouse_command = nil,                     -- 가운데 마우스 클릭 동작

    indicator = {
      icon = "▎",                                  -- 인디케이터 아이콘 (indicator style이 'icon'일 때)
      style = "icon",                              -- 인디케이터 스타일 (icon, underline, none)
    },

    buffer_close_icon = "󰅖",                        -- 버퍼 닫기 아이콘
    modified_icon = "● ",                           -- 수정된 버퍼 표시 아이콘
    close_icon = " ",                              -- 전체 닫기 아이콘
    left_trunc_marker = " ",                       -- 왼쪽 생략 마커
    right_trunc_marker = " ",                      -- 오른쪽 생략 마커

    max_name_length = 18,                           -- 버퍼 이름 최대 길이
    max_prefix_length = 15,                         -- 중복 버퍼 이름의 접두사 길이
    truncate_names = true,                          -- 이름이 긴 경우 잘라내기 여부
    tab_size = 18,                                  -- 탭(버퍼) 크기

    diagnostics = false,                            -- 진단 메시지 표시 (false, "nvim_lsp", "coc")
    diagnostics_update_in_insert = false,           -- 인서트 모드에서 진단 업데이트 여부
    diagnostics_update_on_event = true,             -- 이벤트 기반 진단 업데이트

    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "(" .. count .. ")"
    end,

    custom_filter = function(buf_number, buf_numbers)
      -- 예시: 파일 형식이 "qf"인 버퍼는 제외
      if vim.bo[buf_number].filetype ~= "qf" then
        return true
      end
    end,

    offsets = {
      {
        filetype = "NvimTree",                     -- 파일 탐색기(NvimTree)인 경우
        text = "File Explorer",                    -- 표시할 텍스트
        text_align = "left",                       -- 텍스트 정렬 (left, center, right)
        separator = true,                          -- 구분선 표시 여부
      },
    },

    color_icons = true,                             -- 파일 형식 아이콘에 색상 적용 여부
    get_element_icon = function(element)
      -- element: {filetype, path, extension, directory} 정보 포함
      local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,

    show_buffer_icons = true,                       -- 버퍼에 파일 형식 아이콘 표시 여부
    show_buffer_close_icons = true,                 -- 버퍼 닫기 아이콘 표시 여부
    show_close_icon = true,                         -- 전체 닫기 아이콘 표시 여부
    show_tab_indicators = true,                     -- 탭 인디케이터 표시 여부
    show_duplicate_prefix = true,                   -- 중복 버퍼의 접두사 표시 여부
    duplicates_across_groups = true,                -- 다른 그룹 간 중복 버퍼를 동일하게 처리 여부
    persist_buffer_sort = true,                     -- 사용자 정의 정렬 유지 여부
    move_wraps_at_ends = false,                     -- 양 끝에서 이동 시 랩(wrap) 여부
    separator_style = "slope",                      -- 구분자 스타일 (slant, slope, thick, thin 또는 테이블 형태)
    enforce_regular_tabs = false,                   -- 일반 탭 강제 여부
    always_show_bufferline = true,                  -- 항상 버퍼라인 표시 여부
    auto_toggle_bufferline = false,                 -- 버퍼가 없을 때 자동으로 버퍼라인 숨김 여부

    hover = {
      enabled = false,                               -- 호버 기능 활성화 여부
      delay = 200,                                  -- 호버 지연 시간 (밀리초)
      reveal = { "close" },                         -- 호버 시 표시할 요소 (예: 닫기 버튼)
    },

    sort_by = "insert_after_current",               -- 버퍼 정렬 기준 (insert_after_current, insert_at_end, id, extension, relative_directory, directory, tabs 또는 함수)
    pick = {
      alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", -- 버퍼 선택시 사용할 알파벳 문자열
    },
  }
}

return {}
