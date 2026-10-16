-- Space Age 下机器需要加热才能工作；冻结时重置动画，避免解冻后动画错位。
-- 与孢子内容开关无关：装了 Space Age 就生效。
-- 参考 air-scrubber 的既有做法。
local purifier = data.raw["furnace"]["kr-air-purifier"]

purifier.heating_energy = "100kW"
purifier.graphics_set.reset_animation_when_frozen = true
