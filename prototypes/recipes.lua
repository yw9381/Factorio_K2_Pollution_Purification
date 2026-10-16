local guard = require("prototypes.guard")

local ICONS = "__K2PollutionPurification__/graphics/icons"

--- 净化一个过滤器后得到"用过的过滤器"的结果表。
--- 回收率 100% 时必须写成必定产出；写 independent_probability = 1 在引擎里没有意义。
local function used_filter_result()
  local result = { type = "item", name = "kr-used-pollution-filter", amount = 1 }
  if guard.recovery < 1 then
    result.independent_probability = guard.recovery
  end
  return { result }
end

data:extend({
  {
    type = "recipe",
    name = "kr-air-purifier",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-plate", amount = 4 },
      { type = "item", name = "advanced-circuit", amount = 4 },
      { type = "item", name = "plastic-bar", amount = 20 },
      { type = "item", name = "engine-unit", amount = 1 },
    },
    results = { { type = "item", name = "kr-air-purifier", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-pollution-filter",
    categories = { "advanced-crafting" },
    enabled = false,
    energy_required = 2,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 4 },
      -- 装了 Space Age 用碳（活性炭），否则用煤
      { type = "item", name = guard.carbon_item, amount = 2 },
      { type = "item", name = "plastic-bar", amount = 2 },
    },
    results = { { type = "item", name = "kr-pollution-filter", amount = 1 } },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "kr-air-cleaning",
    icon = ICONS .. "/recipes/filtering.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "zz[air-cleaning]",
    enabled = false,
    hidden = false,
    hide_from_player_crafting = true,
    categories = { "kr-air-purification" },
    energy_required = guard.cleaning_time,
    ingredients = {
      { type = "item", name = "kr-pollution-filter", amount = 1 },
    },
    results = used_filter_result(),
    -- 用过的过滤器必须靠回收配方处理，不能被回收机变回干净的过滤器
    auto_recycle = false,
    allow_quality = false,
  },
  {
    type = "recipe",
    name = "kr-restore-used-pollution-filter",
    icon = ICONS .. "/recipes/restore-used-pollution-filter.png",
    icon_size = 128,
    subgroup = "k2pf-filters",
    order = "c[restore-used-pollution-filter]",
    enabled = false,
    categories = { "chemistry" },
    energy_required = 10,
    ingredients = {
      { type = "item", name = "kr-used-pollution-filter", amount = 1 },
      { type = "fluid", name = "water", amount = 50 },
    },
    results = { { type = "item", name = "kr-pollution-filter", amount = 1 } },
    auto_recycle = false,
    allow_quality = false,
  },
})
