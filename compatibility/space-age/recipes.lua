local guard = require("prototypes.guard")

-- 表面条件：只要有大气压就允许建造/制作，即排除太空平台与无大气星球。
-- 这一项与孢子内容开关无关：装了 Space Age 就生效。
-- 参考 air-scrubber 的既有做法（pressure min = 1）。
data.raw["recipe"]["kr-air-purifier"].surface_conditions = { { property = "pressure", min = 1 } }
data.raw["recipe"]["kr-air-cleaning"].surface_conditions = { { property = "pressure", min = 1 } }

if not guard.spore then
  return
end

local ICONS = "__K2PollutionPurification__/graphics/icons"
local SPOILAGE_ICON = "__space-age__/graphics/icons/spoilage.png"

--- 以污染版的图标为底，叠一枚孢子（spoilage）标记。
--- 图标尺寸与偏移沿用 air-scrubber 的既有叠加写法（scale 0.25 / shift {-6,-6}）。
local function spore_icons(base_icon, base_icon_size)
  return {
    { icon = base_icon, icon_size = base_icon_size },
    { icon = SPOILAGE_ICON, icon_size = 64, scale = 0.25, shift = { -6, -6 } },
  }
end

--- 净化一枚过滤器后得到"用过的"结果表。
--- 回收率 100% 时必须写成必定产出；写 independent_probability = 1 在引擎里没有意义。
local function used_filter_result(item_name)
  local result = { type = "item", name = item_name, amount = 1 }
  if guard.recovery < 1 then
    result.independent_probability = guard.recovery
  end
  return { result }
end

data:extend({
  {
    type = "recipe",
    name = "kr-spore-filter",
    icons = spore_icons(ICONS .. "/items/pollution-filter.png", 64),
    categories = { "advanced-crafting" },
    enabled = false,
    energy_required = 2,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 4 },
      { type = "item", name = guard.carbon_item, amount = 2 },
      { type = "item", name = "plastic-bar", amount = 2 },
    },
    results = { { type = "item", name = "kr-spore-filter", amount = 1 } },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "kr-spore-cleaning",
    icons = spore_icons(ICONS .. "/recipes/filtering.png", 64),
    subgroup = "raw-material",
    order = "zz[spore-cleaning]",
    enabled = false,
    hidden = false,
    hide_from_player_crafting = true,
    categories = { "kr-air-purification" },
    energy_required = guard.cleaning_time,
    ingredients = {
      { type = "item", name = "kr-spore-filter", amount = 1 },
    },
    results = used_filter_result("kr-used-spore-filter"),
    -- 用过的孢子过滤器必须靠回收配方处理
    auto_recycle = false,
    allow_quality = false,
    surface_conditions = { { property = "pressure", min = 1 } },
  },
  {
    type = "recipe",
    name = "kr-restore-used-spore-filter",
    icons = spore_icons(ICONS .. "/recipes/restore-used-pollution-filter.png", 128),
    subgroup = "k2pf-filters",
    order = "d[restore-used-spore-filter]",
    enabled = false,
    categories = { "chemistry" },
    energy_required = 10,
    ingredients = {
      { type = "item", name = "kr-used-spore-filter", amount = 1 },
      { type = "fluid", name = "water", amount = 50 },
    },
    results = { { type = "item", name = "kr-spore-filter", amount = 1 } },
    auto_recycle = false,
    allow_quality = false,
  },
})
