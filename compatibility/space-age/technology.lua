local guard = require("prototypes.guard")

if not guard.spore then
  return
end

-- 科技图标：以净化科技图标为底（科技的目标图标尺寸为 256），
-- 左上角叠一枚 Gleba 标记。Gleba 图标是 64×64，scale 0.5 后约占科技图标的四分之一。
data:extend({
  {
    type = "technology",
    name = "kr-spore-purification",
    icons = {
      { icon = "__K2PollutionPurification__/graphics/icons/technologies/air-purifier.png", icon_size = 256 },
      { icon = "__space-age__/graphics/icons/gleba.png", icon_size = 64, scale = 0.5, shift = { -32, -32 } },
    },
    order = "a-e-e",
    prerequisites = { "agricultural-science-pack" },
    unit = {
      time = 30,
      count = 250,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "agricultural-science-pack", 1 },
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "kr-spore-filter" },
      { type = "unlock-recipe", recipe = "kr-spore-cleaning" },
      { type = "unlock-recipe", recipe = "kr-restore-used-spore-filter" },
    },
  },
})
