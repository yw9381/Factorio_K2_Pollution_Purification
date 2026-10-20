-- 品质兼容：只做一件事 —— 把净化器的制作速度对每个品质钉死在 1。
--
-- 不装 K2 时作用在本 mod 自己的实体上；装了 K2 时作用在 K2 的实体上，保证
-- 「每个过滤器始终跑满 600 s」在两种情况下都成立。
--
-- 减污/污染速率只跟能耗挂钩，与制作速度无关（官方文档：emissions_per_minute 是"满能耗下
-- 每分钟的排放量"）。引擎默认会按品质给制作机器提速（crafting_speed_quality_multiplier
-- 回落到 QualityPrototype.crafting_machine_speed_multiplier = 1 + 0.3 × level），那不会让
-- 每分钟减污变多，只会让 600 s 的净化配方变短（传奇 240 s 就吃掉一个过滤器），平白多烧
-- 2.5 倍过滤器。所以排放保持固定，速度对每个品质写 1：每个过滤器始终跑满 600 s。
local guard = require("prototypes.guard")

if not (mods["quality"] or mods["quality-se"]) then
  return
end

local purifier = data.raw["furnace"]["kr-air-purifier"]
if not purifier then
  log("[K2PollutionPurification] kr-air-purifier entity not found, quality speed pinning skipped.")
  return
end

purifier.crafting_speed_quality_multiplier = {}
for name in pairs(data.raw["quality"]) do
  -- quality-unknown 不是真实品质
  if name ~= "quality-unknown" then
    purifier.crafting_speed_quality_multiplier[name] = 1
  end
end
