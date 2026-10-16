-- Krastorio2 本体在场时整体让位。
local guard = require("prototypes.guard")

if guard.yield then
  return
end

-- 兼容补丁：四个子文件内部各自再做孢子开关 / Space Age 判断。
if mods["space-age"] then
  require("compatibility.space-age.items")
  require("compatibility.space-age.recipes")
  require("compatibility.space-age.entity")
  require("compatibility.space-age.technology")
end
