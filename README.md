# K2PollutionFilter (K2 Pollution Processing)

[English](#english) | [简体中文](#简体中文)

## English

Standalone extraction of Krastorio 2's pollution processing: the air purifier, the pollution
filter loop (filter → air cleaning → used filter → wash it back) and the air purification
technology — with no dependency on Krastorio 2 itself. Works with Space Age (spore chain) and
Quality (quality-scaled pollution absorption).

When Krastorio 2 is installed, this mod steps aside completely: it defines no prototypes at all
and only writes one line to the log, so K2's own versions stay authoritative.

### Installation

* Subscribe on the mod portal, or
* Copy the `K2PollutionFilter` folder (or the released `.zip`) into your Factorio `mods/` folder
  and enable it in the mod list.

Optional dependencies: `space-age`, `quality`, `quality-se`. Requires Factorio 2.1.

### Recipes

| Recipe | Category | Time | Ingredients | Result |
| --- | --- | --- | --- | --- |
| Air purifier | assembling machine | 5 s | 4 steel plate + 4 advanced circuit + 20 plastic bar + 1 engine unit | 1 air purifier |
| Pollution filter | assembling machine 2 (advanced crafting) | 2 s | 4 iron plate + 2 **carbon** (2 coal without Space Age) + 2 plastic bar | 1 pollution filter |
| Air cleaning | air purifier | 600 s | 1 pollution filter | 1 used pollution filter (see recovery rate) |
| Restore used pollution filter | chemical plant | 10 s | 1 used pollution filter + 50 water | 1 pollution filter |
| Spore filter *(Space Age)* | assembling machine 2 (advanced crafting) | 2 s | 4 iron plate + 2 carbon + 2 plastic bar | 1 spore filter |
| Spore cleaning *(Space Age)* | air purifier | 600 s | 1 spore filter | 1 used spore filter (see recovery rate) |
| Restore used spore filter *(Space Age)* | chemical plant | 10 s | 1 used spore filter + 50 water | 1 spore filter |

The air purifier absorbs 50 pollution per minute (see the strength setting), has a crafting
speed of 1, 200 health and uses 75 kW. With Space Age it also absorbs 50 spores per minute.
Cleaning and recycling recipes are never produced by recyclers (`auto_recycle = false`) and do
not take part in quality.

### Startup settings

| Setting | Values | Default | Effect |
| --- | --- | --- | --- |
| `k2pf-pollution-strength` | 0.5 / 1 / 2 / 4 | 1 | Multiplies the absorption rate: −25 / −50 / −100 / −200 per minute |
| `k2pf-filter-recovery` | 90% / 100% | 90% | Chance that cleaning leaves a reusable used filter instead of destroying it |
| `k2pf-spore-content` | on / off | on | Adds the spore chain (needs Space Age) |

### Compatibility

**Space Age.** The second ingredient of both filter recipes becomes carbon, the purifier gains a
50/min spore absorption, heating energy (100 kW) and `reset_animation_when_frozen`, and
`kr-air-purifier`, `kr-air-cleaning` and `kr-spore-cleaning` are restricted to surfaces with
atmosphere (`pressure >= 1`) — space platforms cannot craft them.

**Quality.** The engine does not scale negative emissions by quality, so every quality level
above normal gets its own hidden copy of the purifier entity:

| Quality | Level | Multiplier | Pollution / spore absorption per minute | Absorbed per filter (600 s) |
| --- | --- | --- | --- | --- |
| Normal | 0 | 1× | −50 | 500 |
| Uncommon | 1 | 3× | −150 | 1,500 |
| Rare | 2 | 5× | −250 | 2,500 |
| Epic | 3 | 7× | −350 | 3,500 |
| Legendary | 5 | 10× | −500 | 5,000 |

The multiplier is this mod's own curve — legendary is deliberately one step above the 9× an
arithmetic progression would give. The global `k2pf-pollution-strength` setting still multiplies
on top of it. Crafting speed is deliberately pinned to 1 by `crafting_speed_quality_multiplier` —
the engine would otherwise also speed the machine up and scale the absorption a second time.
Other vanilla quality effects (health, energy usage, module slots) are left untouched, so those
values are identical at every quality. Qualities added by other mods are picked up automatically
and extrapolated as `1 + 2 × level`; `quality-unknown` is skipped.

### Known trade-offs

* **Carbon under Space Age.** Both filter recipes use carbon with Space Age. Carbon is unlocked
  by the *Tungsten carbide* technology (2 coal + 20 sulfuric acid → 1 carbon) or produced on
  Gleba in a biochamber (6 spoilage → 1 carbon), so filters become available noticeably later
  than in a base-game-only run.
* **Plastic on Gleba.** Spore filters need plastic bars, so producing them on Gleba requires
  shipping plastic in (or an alternative plastic source).
* **Base-game materials.** The purification technology requires chemical science packs and the
  purifier is built from base-game ingredients; K2's biomass/bio-processing chain is not
  included and the unlock point moves accordingly.
* **Entity description.** The air purifier description is K2's original text, which mentions a
  10% chance of filters being destroyed. That matches the default 90% recovery rate; with the
  recovery rate set to 100% the wording is slightly off.

### Credits

* Air purifier graphics, sound, icons and the 23 extracted translations come from
  **Krastorio 2 / Krastorio 2 Assets** by *Linver, Krastor, raiguard* (LGPL-3.0).
* `graphics/icons/spore-filter.png` and `graphics/icons/used-spore-filter.png` come from
  **Air Scrubber** by *Lord_Curdin* (based on *atan-air-scrubbing*); the art is
  *malcolmriley/unused-renders*, released under CC BY 4.0.
* All other code and data in this mod: LGPL-3.0 (see `LICENSE`).

Translations of the spore chain, the settings and the subgroup name currently exist in English
and Simplified Chinese only — contributions for the other 21 languages are very welcome.

## 简体中文

把 Krastorio 2 的污染处理体系单独抽出来：空气净化器、污染过滤器循环（过滤器 → 净化 →
用过的过滤器 → 洗回干净过滤器）以及空气净化科技，完全不依赖 K2 本体。支持 Space Age
（孢子链路）与 Quality（品质减污）。

**装 Krastorio 2 本体时本 mod 完全让位**：不定义任何原型，只往日志里写一行提示，让 K2
的版本保持权威。

### 安装

* 在 mod 门户订阅，或
* 把 `K2PollutionFilter` 目录（或发布的 `.zip`）放进 Factorio 的 `mods/` 目录并在 mod 列表启用。

可选依赖：`space-age`、`quality`、`quality-se`。需要 Factorio 2.1。

### 配方

| 配方 | 类别 | 时间 | 原料 | 产物 |
| --- | --- | --- | --- | --- |
| 空气净化器 | 组装机 | 5 秒 | 4 钢板 + 4 高级电路 + 20 塑料 + 1 引擎 | 1 空气净化器 |
| 污染过滤器 | 组装机 2（advanced crafting） | 2 秒 | 4 铁板 + 2 **碳**（无 Space Age 时为 2 煤）+ 2 塑料 | 1 污染过滤器 |
| 空气净化 | 空气净化器 | 600 秒 | 1 污染过滤器 | 1 用过的污染过滤器（见回收率） |
| 回收用过的污染过滤器 | 化工厂 | 10 秒 | 1 用过的污染过滤器 + 50 水 | 1 污染过滤器 |
| 孢子过滤器 *（Space Age）* | 组装机 2（advanced crafting） | 2 秒 | 4 铁板 + 2 碳 + 2 塑料 | 1 孢子过滤器 |
| 孢子净化 *（Space Age）* | 空气净化器 | 600 秒 | 1 孢子过滤器 | 1 用过的孢子过滤器（见回收率） |
| 回收用过的孢子过滤器 *（Space Age）* | 化工厂 | 10 秒 | 1 用过的孢子过滤器 + 50 水 | 1 孢子过滤器 |

空气净化器每分钟吸收 50 污染（受强度设置影响），制作速度 1，血量 200，耗电 75 kW；
装了 Space Age 后额外每分钟吸收 50 孢子。净化与回收配方不会被回收机处理
（`auto_recycle = false`），也不参与品质。

### 启动设置

| 设置 | 取值 | 默认 | 作用 |
| --- | --- | --- | --- |
| `k2pf-pollution-strength` | 0.5 / 1 / 2 / 4 | 1 | 吸污速率倍率：−25 / −50 / −100 / −200 每分钟 |
| `k2pf-filter-recovery` | 90% / 100% | 90% | 净化后得到可复用过滤器的几率，其余情况视为过滤器被摧毁 |
| `k2pf-spore-content` | 开 / 关 | 开 | 是否追加孢子链路（需要 Space Age） |

### 兼容性

**Space Age。** 两张过滤器配方的第二项原料改为碳；净化器额外吸收 50/分钟孢子，并获得加热
能耗（100 kW）与 `reset_animation_when_frozen`；`kr-air-purifier`、`kr-air-cleaning` 与
`kr-spore-cleaning` 限定在有大气压的星球（`pressure >= 1`），太空平台无法制作。

**Quality。** 引擎不会按品质缩放负排放，因此 normal 之上的每个品质都有一份隐藏的净化器实体：

| 品质 | 等级 | 倍率 | 每分钟减污 / 吸孢子 | 单过滤器吸污（600 s） |
| --- | --- | --- | --- | --- |
| 普通 | 0 | 1× | −50 | 500 |
| 罕见 | 1 | 3× | −150 | 1 500 |
| 稀有 | 2 | 5× | −250 | 2 500 |
| 史诗 | 3 | 7× | −350 | 3 500 |
| 传奇 | 5 | 10× | −500 | 5 000 |

倍率是本 mod 自定的曲线，传奇刻意比等差数列的 9× 高一档。全局设置
`k2pf-pollution-strength` 仍乘在品质倍率之上。制作速度用 `crafting_speed_quality_multiplier`
刻意钉在 1：否则引擎会连带提速，把吸污量再放大一次。其它常规品质收益（血量、能耗、插件槽）
保持引擎默认，因此各品质下这些数值完全相同。其它 mod 注入的品质会自动覆盖，并按
`1 + 2 × 等级` 外推；`quality-unknown` 跳过。

### 已知取舍

* **Space Age 下的碳。** 两张过滤器配方在有 SA 时都用碳。碳由「碳化钨（Tungsten carbide）」
  科技解锁（2 煤 + 20 硫酸 → 1 碳），或在 Gleba 用生物舱烧制（6 腐败物 → 1 碳），因此过滤器
  的实际可用点会明显晚于只装 base 的存档。
* **Gleba 上的塑料。** 孢子过滤器需要塑料，在 Gleba 上要外部运输塑料才能自给。
* **本体材料。** 净化科技前置化学科技瓶，净化器用本体材料建造；不包含 K2 的生物质产线，
  解锁点在科技树上相应后移。
* **实体描述。** 净化器的描述沿用 K2 原文，其中提到过滤器有 10% 的几率被摧毁：这与默认
  90% 回收率一致；若把回收率设为 100%，该描述会略不准确。

### 署名

* 净化器图形、音效、图标以及 23 种语言的既有译文来自 **Krastorio 2 / Krastorio 2
  Assets**，作者 *Linver, Krastor, raiguard*（LGPL-3.0）。
* `graphics/icons/spore-filter.png` 与 `graphics/icons/used-spore-filter.png` 来自
  **Air Scrubber**（作者 *Lord_Curdin*，基于 *atan-air-scrubbing*）；美术素材出自
  *malcolmriley/unused-renders*，以 CC BY 4.0 发布。
* 本 mod 的其余代码与数据：LGPL-3.0（见 `LICENSE`）。

孢子链路、设置项与子分组名的译文目前只有英文与简体中文；其余 21 种语言的补充非常欢迎。
