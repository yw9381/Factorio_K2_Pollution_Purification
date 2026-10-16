-- 让位判断、启动设置读取与共用常量。
--
-- 让位：装了 Krastorio2 本体时，本 mod 在 data 阶段不定义任何原型（K2 自己已经有
-- 这套污染处理体系），只输出一条日志提示。
local M = {}

M.yield = mods["Krastorio2"] ~= nil

if M.yield then
  log("[K2PollutionFilter] Krastorio2 detected, yielding: no prototype will be defined.")
  return M
end

M.strength = tonumber(settings.startup["k2pf-pollution-strength"].value)
M.recovery = settings.startup["k2pf-filter-recovery"].value == "100%" and 1 or 0.9
M.spore = settings.startup["k2pf-spore-content"].value and mods["space-age"] ~= nil
M.cleaning_time = 600
M.base_emissions = -50 * M.strength
M.carbon_item = mods["space-age"] and "carbon" or "coal"

--- 净化器的排放表：默认吸收污染，开启孢子内容时同时吸收孢子。
--- 每次调用返回新表，避免品质副本修改时污染基础原型。
function M.emissions()
  local emissions = { pollution = M.base_emissions }
  if M.spore then
    emissions.spores = M.base_emissions
  end
  return emissions
end

--- 品质减污倍率：normal 0 / uncommon 1 / rare 2 / epic 3 / legendary 5。
function M.quality_modifier(level)
  return 1 + 0.3 * level
end

return M
