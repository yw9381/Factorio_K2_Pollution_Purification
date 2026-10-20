-- K2 在场时的数值补丁放在最后阶段：晚于所有 mod 的 data-updates，
-- 避免被其它兼容补丁在 data-updates 里改回 K2 原值。
local guard = require("prototypes.guard")

if not guard.yield then
  return
end

require("compatibility.krastorio2")

if mods["quality"] or mods["quality-se"] then
  require("compatibility.quality.entity")
end
