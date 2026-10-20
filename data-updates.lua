local guard = require("prototypes.guard")

-- 装了 K2：本 mod 不定义自己的原型；数值补丁放在 data-final-fixes，
-- 确保晚于所有 mod 的 data-updates，不会被后加载的兼容补丁覆盖。
if guard.yield then
  return
end

-- 兼容补丁：子文件内部各自再做孢子开关 / Space Age / Quality 判断。
if mods["space-age"] then
  require("compatibility.space-age.items")
  require("compatibility.space-age.recipes")
  require("compatibility.space-age.entity")
  require("compatibility.space-age.technology")
end

if mods["quality"] or mods["quality-se"] then
  require("compatibility.quality.entity")
end
