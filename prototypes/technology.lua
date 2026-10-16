data:extend({
  {
    type = "technology",
    name = "kr-air-purification",
    icon = "__K2PollutionFilter__/graphics/icons/technologies/air-purifier.png",
    icon_size = 256,
    order = "a-e-d",
    -- K2 原本的前置是 kr-advanced-chemistry 与 kr-bio-processing（K2 专属科技），
    -- 独立版本改用本体科技。
    prerequisites = { "chemical-science-pack" },
    unit = {
      time = 45,
      count = 275,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "military-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "kr-air-purifier" },
      { type = "unlock-recipe", recipe = "kr-pollution-filter" },
      { type = "unlock-recipe", recipe = "kr-air-cleaning" },
      { type = "unlock-recipe", recipe = "kr-restore-used-pollution-filter" },
    },
  },
})
