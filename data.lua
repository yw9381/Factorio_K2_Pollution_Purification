-- Krastorio2 本体在场时整体让位。
local guard = require("prototypes.guard")

if guard.yield then
  return
end

-- 基础原型按顺序加载：类别 → 子分组 → 物品 → 实体 → 配方 → 科技。
-- 参见 docs/superpowers/plans/2026-10-17-K2PollutionFilter.md 的 Task 4。
