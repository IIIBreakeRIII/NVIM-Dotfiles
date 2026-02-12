# Neovim 설정 요약

이 저장소는 NvChad 기반의 개인 Neovim 설정입니다. 주요 진입점은 `init.lua`이며, 옵션/오토커맨드/키맵과 플러그인을 모듈로 분리해 관리합니다.

## 핵심 설정 파일
- `init.lua`: lazy.nvim 부트스트랩, NvChad 로드, 기본 설정/키맵 로드
- `lua/chadrc.lua`: 테마(Base46) 및 UI 설정
- `lua/options.lua`: 옵션 확장
- `lua/autocmds.lua`: 오토커맨드 확장
- `lua/mappings.lua`: 커스텀 키맵
- `lua/plugins/init.lua`: 플러그인 목록
- `lua/configs/*`: 플러그인별 상세 설정

## 플러그인 요약
### 기본 유틸/편의
- `stevearc/conform.nvim`: 포매터
- `neovim/nvim-lspconfig`: LSP 설정
- `hrsh7th/nvim-cmp` + `cmp-cmdline` + `cmp-path`: 자동완성 및 커맨드라인 완성

### UI / 생산성
- `folke/noice.nvim`: 커맨드라인 UI 및 메시지 개선
- `mrjones2014/legendary.nvim`: 커맨드/키맵 검색형 팔레트
- `MeanderingProgrammer/render-markdown.nvim`: 마크다운 렌더링
- `nvim-telescope/telescope-file-browser.nvim`: 파일 브라우저

### Git / 탐색
- `NeogitOrg/neogit`: Git UI
- `sindrets/diffview.nvim`: Diff/History 뷰어
- `luckasRanarison/nvim-devdocs`: DevDocs 검색

### 터미널 연동
- `christoomey/vim-tmux-navigator`: tmux/Neovim 이동 연동
