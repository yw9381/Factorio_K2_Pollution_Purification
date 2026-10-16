local guard = require("prototypes.guard")

if not (mods["quality"] or mods["quality-se"]) then
  return
end

-- 引擎不会把"负排放"按品质缩放（品质只作用于正向属性），所以要让品质越高减污越强，
-- 只能为每个品质复制一份隐藏实体，并把排放表逐项乘上品质倍率。
local BASE_NAME = "kr-air-purifier"
local base = data.raw["furnace"][BASE_NAME]

-- normal 品质仍用主实体
base.placeable_by = { item = BASE_NAME, count = 1, quality = "normal" }

for name, quality in pairs(data.raw["quality"]) do
  -- quality-unknown 不是真实品质；level 0 即 normal，不生成副本
  if name ~= "quality-unknown" and quality.level and quality.level >= 1 then
    local copy = table.deepcopy(base)
    copy.name = name .. "-" .. BASE_NAME
    copy.hidden = true
    -- 副本本身标记为固定品质，不再让叠加品质影响表现
    copy.crafting_speed = 1
    -- 引擎默认会按品质给制作机器提速（crafting_speed_quality_multiplier 回落到
    -- QualityPrototype.crafting_machine_speed_multiplier = 1 + 0.3 × level）。
    -- 这里把速度钉死在 1，让"减污"成为唯一的品质收益；否则实际吸污量会变成 (1+0.3L)²。
    copy.crafting_speed_quality_multiplier = { [name] = 1 }
    copy.placeable_by = { item = BASE_NAME, count = 1, quality = name }

    local modifier = guard.quality_modifier(quality.level)
    local emissions = copy.energy_source.emissions_per_minute
    for key, value in pairs(emissions) do
      emissions[key] = value * modifier
    end

    data:extend({ copy })
  end
end
