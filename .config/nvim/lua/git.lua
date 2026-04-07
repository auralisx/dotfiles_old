local stl = require('statusline')

-- Register Git as an external component
stl.external_left["git_branch"] = function()
  -- This only runs if gitsigns has attached to the buffer
  local branch = vim.b.gitsigns_head
  if branch and branch ~= "" then
    -- We can still use the stl.hl utility!
    return stl.hl("Orange", " " .. branch)
  end
  return ""
end
