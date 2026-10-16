local ICONS = "__K2PollutionFilter__/graphics/icons"

data:extend({
  {
    type = "item",
    name = "kr-pollution-filter",
    icon = ICONS .. "/items/pollution-filter.png",
    icon_size = 64,
    subgroup = "k2pf-filters",
    order = "a[pollution-filter]",
    stack_size = 50,
  },
  {
    type = "item",
    name = "kr-used-pollution-filter",
    icon = ICONS .. "/items/used-pollution-filter.png",
    icon_size = 64,
    subgroup = "k2pf-filters",
    order = "b[used-pollution-filter]",
    stack_size = 50,
    -- 用过的过滤器不能被回收机变回干净的过滤器
    auto_recycle = false,
  },
  {
    type = "item",
    name = "kr-air-purifier",
    icon = ICONS .. "/entities/air-purifier.png",
    icon_size = 64,
    subgroup = "production-machine",
    order = "z[air-purifier]",
    place_result = "kr-air-purifier",
    stack_size = 50,
  },
})
