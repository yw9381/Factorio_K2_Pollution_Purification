# K2PollutionPurification (K2 Pollution Purification)

[简体中文](README.md)

Standalone extraction of Krastorio 2's pollution processing: the air purifier, the pollution
filter loop (filter → air cleaning → used filter → wash it back) and the air purification
technology — with no dependency on Krastorio 2 itself. Works with Space Age (spore chain) and
Quality (constant absorption, pinned crafting speed).

When Krastorio 2 is installed, this mod steps aside completely: it defines no prototypes at all
and only writes one line to the log, so K2's own versions stay authoritative.

## Installation

* Subscribe on the mod portal, or
* Copy the `K2PollutionPurification` folder (or the released `.zip`) into your Factorio `mods/` folder
  and enable it in the mod list.

Optional dependencies: `space-age`, `quality`, `quality-se`. Requires Factorio 2.1.

## Recipes

| Recipe | Category | Time | Ingredients | Result |
| --- | --- | --- | --- | --- |
| Air purifier | assembling machine | 5 s | 4 steel plate + 4 advanced circuit + 20 plastic bar + 1 engine unit | 1 air purifier |
| Pollution filter | assembling machine 2 (advanced crafting) | 2 s | 4 iron plate + 2 **carbon** (2 coal without Space Age) + 2 plastic bar | 1 pollution filter |
| Air cleaning | air purifier | 600 s | 1 pollution filter | 1 used pollution filter (see recovery rate) |
| Restore used pollution filter | chemical plant | 10 s | 1 used pollution filter + 50 water | 1 pollution filter |
| Spore filter *(Space Age)* | assembling machine 2 (advanced crafting) | 2 s | 4 iron plate + 2 carbon + 2 plastic bar | 1 spore filter |
| Spore cleaning *(Space Age)* | air purifier | 600 s | 1 spore filter | 1 used spore filter (see recovery rate) |
| Restore used spore filter *(Space Age)* | chemical plant | 10 s | 1 used spore filter + 50 water | 1 spore filter |

The air purifier absorbs 200 pollution per minute (see the strength setting), has a crafting
speed of 1, 200 health and uses 75 kW. With Space Age it also absorbs 200 spores per minute.
Cleaning and recycling recipes are never produced by recyclers (`auto_recycle = false`) and do
not take part in quality. The purifier's absorption does not change with quality either (see
below).

## Startup settings

| Setting | Values | Default | Effect |
| --- | --- | --- | --- |
| `k2pf-pollution-strength` | 0.5 / 1 / 2 / 4 | 1 | Multiplies the absorption rate: −100 / −200 / −400 / −800 per minute |
| `k2pf-filter-recovery` | 90% / 100% | 90% | Chance that cleaning leaves a reusable used filter instead of destroying it |
| `k2pf-spore-content` | on / off | on | Adds the spore chain (needs Space Age) |

## Compatibility

**Space Age.** The second ingredient of both filter recipes becomes carbon, the purifier gains a
200/min spore absorption, heating energy (100 kW) and `reset_animation_when_frozen`, and
`kr-air-purifier`, `kr-air-cleaning` and `kr-spore-cleaning` are restricted to surfaces with
atmosphere (`pressure >= 1`) — space platforms cannot craft them.

**Quality.** The purifier removes a flat **−200/min** at every quality. The engine never scales
emissions by quality (FFF-375: a furnace's quality bonuses are only "faster" and more health), so
there is no engine hook to build on — and this mod deliberately does not add one:

| Quality | Level | Absorption per minute | Per filter (600 s) | Health | Crafting speed |
| --- | --- | --- | --- | --- | --- |
| Normal | 0 | −200 | 2,000 | 200 | 1 |
| Uncommon | 1 | −200 | 2,000 | 260 | 1 |
| Rare | 2 | −200 | 2,000 | 320 | 1 |
| Epic | 3 | −200 | 2,000 | 380 | 1 |
| Legendary | 5 | −200 | 2,000 | 500 | 1 |

Health follows the engine default (`+30%` per level), so a legendary purifier is tougher — that is
the only quality bonus it keeps. Crafting speed is pinned to 1 for every quality via
`crafting_speed_quality_multiplier`, because absorption is tied to energy usage rather than
crafting speed: letting the engine speed the machine up would not raise the absorption rate at
all, it would only shorten the 600 s recipe and burn filters 2.5× faster at legendary. Energy
usage (75 kW) and module slots (none) are unchanged as well. The global
`k2pf-pollution-strength` setting still multiplies the value (0.5×/2×/4× → −100/−400/−800 per
minute). Qualities added by other mods are pinned the same way; `quality-unknown` is skipped.

## Known trade-offs

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

## Credits

* Air purifier graphics, sound, icons and the 23 extracted translations come from
  **Krastorio 2 / Krastorio 2 Assets** by *Linver, Krastor, raiguard* (LGPL-3.0).
* `graphics/icons/spore-filter.png` and `graphics/icons/used-spore-filter.png` come from
  **Air Scrubber** by *Lord_Curdin* (based on *atan-air-scrubbing*); the art is
  *malcolmriley/unused-renders*, released under CC BY 4.0.
* All other code and data in this mod: LGPL-3.0 (see `LICENSE`).

Translations of the spore chain, the settings and the subgroup name currently exist in English
and Simplified Chinese only — contributions for the other 21 languages are very welcome.

The mod name itself is localised into all 23 shipped languages through the official `[mod-name]`
category (see `locale/*/k2pf-meta.cfg`): "K2 Pollution Purification" in English, "K2污染净化" in Chinese.
The `title` in `info.json` is the fallback used when a language has no entry.
