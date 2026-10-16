local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local guard = require("prototypes.guard")

local ENTITY_GRAPHICS = "__K2PollutionPurification__/graphics/entity/air-purifier"

data:extend({
  {
    type = "furnace",
    name = "kr-air-purifier",
    icon = "__K2PollutionPurification__/graphics/icons/entities/air-purifier.png",
    icon_size = 64,
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "kr-air-purifier" },
    result_inventory_size = 1,
    source_inventory_size = 1,
    max_health = 200,
    corpse = "medium-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    dying_explosion = "explosion",
    collision_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
    selection_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
    crafting_categories = { "kr-air-purification" },
    show_recipe_icon = false,
    crafting_speed = 1.0,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      -- 负排放即"吸收"污染：数值与倍率都来自 guard
      emissions_per_minute = guard.emissions(),
    },
    energy_usage = "75kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = {
      sound = { filename = "__K2PollutionPurification__/sounds/air-purifier.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
    },
    graphics_set = {
      animation = {
        layers = {
          {
            filename = ENTITY_GRAPHICS .. "/air-purifier.png",
            priority = "high",
            width = 150,
            height = 150,
            shift = { 0, -0.1 },
            frame_count = 16,
            line_length = 4,
            animation_speed = 0.5,
            scale = 0.5,
          },
          {
            filename = ENTITY_GRAPHICS .. "/air-purifier-sh.png",
            priority = "high",
            width = 164,
            height = 102,
            shift = { 0.22, 0.25 },
            repeat_count = 16,
            draw_as_shadow = true,
            animation_speed = 0.5,
            scale = 0.5,
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = ENTITY_GRAPHICS .. "/air-purifier-reflection.png",
          priority = "extra-high",
          width = 20,
          height = 25,
          shift = util.by_pixel(0, 40),
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },
    },
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(universal_connector_template, {
      {
        variation = 30,
        main_offset = util.by_pixel_hr(0, 40),
        shadow_offset = util.by_pixel_hr(-5, 35),
        show_shadow = false,
      },
      {
        variation = 30,
        main_offset = util.by_pixel_hr(0, 40),
        shadow_offset = util.by_pixel_hr(-5, 35),
        show_shadow = false,
      },
      {
        variation = 30,
        main_offset = util.by_pixel_hr(0, 40),
        shadow_offset = util.by_pixel_hr(-5, 35),
        show_shadow = false,
      },
      {
        variation = 30,
        main_offset = util.by_pixel_hr(0, 40),
        shadow_offset = util.by_pixel_hr(-5, 35),
        show_shadow = false,
      },
    }),
  },
})
