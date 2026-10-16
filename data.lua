-- Krastorio2 本体在场时整体让位。
local guard = require("prototypes.guard")

if guard.yield then
  return
end

-- 基础原型按顺序加载：类别 → 子分组 → 物品 → 实体 → 配方 → 科技。
require("prototypes.categories")
require("prototypes.subgroups")
require("prototypes.items")
require("prototypes.entity")
require("prototypes.recipes")
require("prototypes.technology")
