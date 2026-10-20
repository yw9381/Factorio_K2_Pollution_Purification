-- K2 本体在场时不定义自己的原型：避免与 K2 重名冲突。
-- 净化时长与吸污量由 compatibility/krastorio2.lua 在 data-updates 阶段打到 K2 原型上。
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
