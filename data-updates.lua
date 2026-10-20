local guard = require("prototypes.guard")

-- 装了 K2：不定义自己的原型，只把 K2 的净化数值对齐本 mod。
if guard.yield then
  require("compatibility.krastorio2")
  if mods["quality"] or mods["quality-se"] then
    require("compatibility.quality.entity")
  end
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
