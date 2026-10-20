-- Krastorio2 在场时的数值补丁。
--
-- 不覆盖 K2 的物品、配方原料、产物、回收率与科技：这些一律沿用 K2。
-- 只把净化器的吸污量与本 mod 的净化时长对齐（K2 原值为 -50/分钟、480 秒）。
local guard = require("prototypes.guard")

local purifier = data.raw["furnace"]["kr-air-purifier"]
if purifier then
  purifier.energy_source.emissions_per_minute = { pollution = guard.base_emissions }
else
  log("[K2PollutionPurification] kr-air-purifier entity not found, emissions patch skipped.")
end

local cleaning = data.raw["recipe"]["kr-air-cleaning"]
if cleaning then
  cleaning.energy_required = guard.cleaning_time
else
  log("[K2PollutionPurification] kr-air-cleaning recipe not found, cleaning time patch skipped.")
end
