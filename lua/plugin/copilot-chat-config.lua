local prompts = require('CopilotChat.prompts')
local select = require('CopilotChat.select')

return {
	require('CopilotChat').setup({
  	system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
  	model = 'gpt-3.5-turbo', -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
  	temperature = 0.1, -- GPT temperature
  	context = 'manual', -- Context to use, 'buffers', 'buffer' or 'manual'
  	proxy = nil, -- [protocol://]host[:port] Use this proxy
  	allow_insecure = false, -- Allow insecure server connections
  	debug = false, -- Enable debug logging
  	show_user_selection = true, -- Shows user selection in chat
  	show_system_prompt = false, -- Shows system prompt in chat
  	show_folds = true, -- Shows folds for sections in chat
  	clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
  	auto_follow_cursor = true, -- Auto-follow cursor in chat
  	name = 'CopilotChat', -- Name to use in chat
  	separator = '---', -- Separator to use in chat
  	-- default prompts
  	prompts = {
  	  Explain = {
  	    prompt = '/COPILOT_EXPLAIN Write an explanation for the code above as paragraphs of text.',
  	  },
  	  Tests = {
  	    prompt = '/COPILOT_TESTS Write a set of detailed unit test functions for the code above.',
  	  },
  	  Fix = {
  	    prompt = '/COPILOT_FIX There is a problem in this code. Rewrite the code to show it with the bug fixed.',
  	  },
  	  Optimize = {
  	    prompt = '/COPILOT_REFACTOR Optimize the selected code to improve performance and readablilty.',
  	  },
  	  Docs = {
  	    prompt = '/COPILOT_REFACTOR Write documentation for the selected code. The reply should be a codeblock containing the original code with the documentation added as comments. Use the most appropriate documentation style for the programming language used (e.g. JSDoc for JavaScript, docstrings for Python etc.',
  	  },
  	  FixDiagnostic = {
  	    prompt = 'Please assist with the following diagnostic issue in file:',
  	    selection = select.diagnostics,
  	  },
  	  Commit = {
  	    prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
  	    selection = select.gitdiff,
  	  },
  	  CommitStaged = {
  	    prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
  	    selection = function(source)
  	      return select.gitdiff(source, true)
  	    end,
  	  },
  	},
  	-- default selection (visual or line)
  	selection = function(source)
  	  return select.visual(source) or select.line(source)
  	end,
  	-- default window options
  	window = {
  	  layout = 'vertical', -- 'vertical', 'horizontal', 'float'
  	  -- Options below only apply to floating windows
  	  relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
  	  border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
  	  width = 0.8, -- fractional width of parent
  	  height = 0.6, -- fractional height of parent
  	  row = nil, -- row position of the window, default is centered
  	  col = nil, -- column position of the window, default is centered
  	  title = 'Copilot Chat', -- title of chat window
  	  footer = nil, -- footer of chat window
  	  zindex = 1, -- determines if window is on top or below other floating windows
  	},
  	-- default mappings
  	mappings = {
  	  close = 'q',
  	  reset = '<C-l>',
  	  complete = '<Tab>',
  	  submit_prompt = '<CR>',
  	  accept_diff = '<C-y>',
  	  show_diff = '<C-d>',
  	},
	})
}
