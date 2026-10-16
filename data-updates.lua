-- Krastorio2 本体在场时整体让位。
local guard = require("prototypes.guard")

if guard.yield then
  return
end

-- 兼容补丁在此处加载：compatibility/space-age/* 与 compatibility/quality/*。
-- 参见 docs/superpowers/plans/2026-10-17-K2PollutionFilter.md 的 Task 5 与 Task 6。
