return {
  {
    -- 깃허브 형식이 아닌 고유한 ID
    "ReCursion",

    -- 실제 플러그인 코드가 들어 있는 경로
    dir = vim.fn.stdpath("config")
      .. "/lua/lazy-setup/plugins/dev-plugins/ReCursion",

    -- 원격 버전 관리 건너뛰기
    version = false,

    -- lazy 로드 시 setup() 실행
    config = function()
      require("lazy-setup.plugins.dev-plugins.ReCursion.lib").setup()
    end,
  },
}
