data:extend({
  {
    type = "string-setting",
    name = "k2pf-pollution-strength",
    setting_type = "startup",
    order = "a1",
    default_value = "1",
    allowed_values = { "0.5", "1", "2", "4" },
  },
  {
    type = "string-setting",
    name = "k2pf-filter-recovery",
    setting_type = "startup",
    order = "a2",
    default_value = "90%",
    allowed_values = { "90%", "100%" },
  },
  {
    type = "bool-setting",
    name = "k2pf-spore-content",
    setting_type = "startup",
    order = "a3",
    default_value = true,
  },
})
