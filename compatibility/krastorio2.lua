-- Krastorio2 在场时的数值补丁。
--
-- 不覆盖 K2 的物品、配方原料、产物、回收率与科技：这些一律沿用 K2。
-- 只把净化器的吸污量与本 mod 的净化时长对齐（K2 原值为 -50/分钟、480 秒）。
-- 由 data-final-fixes.lua 调用，确保晚于其它 mod 的 data-updates。
local guard = require("prototypes.guard")

local purifier = data.raw["furnace"]["kr-air-purifier"]
if purifier then
  -- 只覆盖污染值：K2SO 等兼容 mod 可能在同一张表里写入 spores 等条目，保留它们。
  local emissions = purifier.energy_source.emissions_per_minute or {}
  emissions.pollution = guard.base_emissions
  purifier.energy_source.emissions_per_minute = emissions
  log(("[K2PollutionPurification] kr-air-purifier patched: %d pollution/min"):format(guard.base_emissions))
else
  log("[K2PollutionPurification] kr-air-purifier entity not found, emissions patch skipped.")
end

local cleaning = data.raw["recipe"]["kr-air-cleaning"]
if cleaning then
  cleaning.energy_required = guard.cleaning_time
  log(("[K2PollutionPurification] kr-air-cleaning patched: %d s"):format(guard.cleaning_time))
else
  log("[K2PollutionPurification] kr-air-cleaning recipe not found, cleaning time patch skipped.")
end
