local guard = require("prototypes.guard")

if not guard.spore then
  return
end

local ICONS = "__K2PollutionFilter__/graphics/icons"

-- 孢子过滤器的图标是带 mipmap 的 64×64 图（64+32+16+8 = 120 宽），icon_size 仍为 64。
data:extend({
  {
    type = "item",
    name = "kr-spore-filter",
    icon = ICONS .. "/spore-filter.png",
    icon_size = 64,
    subgroup = "k2pf-filters",
    order = "c[spore-filter]",
    stack_size = 50,
  },
  {
    type = "item",
    name = "kr-used-spore-filter",
    icon = ICONS .. "/used-spore-filter.png",
    icon_size = 64,
    subgroup = "k2pf-filters",
    order = "d[used-spore-filter]",
    stack_size = 50,
    -- 用过的孢子过滤器不能被回收机变回干净的过滤器
    auto_recycle = false,
  },
})
