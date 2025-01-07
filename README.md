<p align="center">
 <a href="https://github.com/TiberiumWorld/Tiberium-Mechanic/releases/latest"><img src="https://img.shields.io/github/release/TiberiumWorld/Tiberium-Mechanic.svg?style=for-the-badge&label=Release%20Build" alt="Release Build Version"></a>
 <a href="https://github.com/TiberiumWorld/Tiberium-Mechanic/releases/"><img src="https://img.shields.io/github/release/TiberiumWorld/Tiberium-Mechanic/all.svg?style=for-the-badge&label=Pre-release" alt="Pre release and or current build version"></a>
 <a href="https://github.com/TiberiumWorld/Tiberium-Mechanic/tags"><img src="https://img.shields.io/github/tag/TiberiumWorld/Tiberium-Mechanic.svg?style=for-the-badge&colorB=df2d00&label=Latest%20Tag" alt="Dev-build or the latest tag of the current build."></a><br>
 <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=2374598544"><img src="https://img.shields.io/endpoint.svg?url=https%3A%2F%2Fshieldsio-steam-workshop.jross.me%2F2374598544&style=for-the-badge" alt="Steam Workshop"></a>
 <a href="https://github.com/TiberiumWorld/Tiberium-Mechanic/releases/latest"><img src="https://img.shields.io/github/downloads/TiberiumWorld/Tiberium-Mechanic/total.svg?style=for-the-badge&label=Downloads" alt="Tiberium-Mechanic Downloads"></a>
 <a href="https://github.com/TiberiumWorld/Tiberium-Mechanic/issues"><img src="https://img.shields.io/github/issues-raw/TiberiumWorld/Tiberium-Mechanic.svg?style=for-the-badge&label=Issues" alt="Tiberium-Mechanic Issues"></a>
 <a href="https://discord.gg/frDEmchRQx"><img src="https://img.shields.io/badge/Discord-Join-blue.svg?logo=Discord&style=for-the-badge" alt="Join Our Discord"></a>
 <a href="https://github.com/TiberiumWorld/Tiberium-Mechanic/projects/1#column-12546832"><img src="https://img.shields.io/badge/Roadmap-Plans-yellow.svg?style=for-the-badge" alt="Join Our Discord"></a>
</p>

# Tiberium
Tiberium is a crystal that suck up minerals and nutrients from the ground like a sponge. They alter the terrain and make it inhospitable for carbon-based life. This is represented in game via terrain province and state modifiers.

# About
Tiberium Spread Mechanic are a open source tiberium spread system built to be exported used and easily implemented to other mods. The mod works out of the box with the vanilla base game but might need some minor adjustments when used with mods changing UI and Province ID’s.

## Game Rules
| Icon | Name  | Options     |
|------|-------|-------------| 
| ![Arrival](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/game_rules/rule_astroid.png?raw=true) | Tiberium Arrival     | Random (The meteor will arrives some day within a 25 year period; unknown when.)<br>Start (The meteor will arrive at the start of the game.)*<br>1995 (The meteor will crash in to earth som day in 1995.)<br>Never (The meteor will never arrive; Why did you download this mod?)
| ![Growth](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/game_rules/rule_growth.png?raw=true)   | Tiberium Growth Rate | Low (10%)<br>Medium (20%)*<br>High (40%)<br>Extreme (60%) |
| ![Spread](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/game_rules/rule_spread.png?raw=true)   | Tiberium Spread Rate | Low (20%)<br>Medium (30%)*<br>High (40%)<br>Extreme (50%) |

`*` = Default

## Modifiers
### State
|  Modifier            |  ![Stage 1](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/interface/modifiers_tiberium_infestation_0_icon.png?raw=true) | ![Stage 2](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/interface/modifiers_tiberium_infestation_1_icon.png?raw=true)  | ![Stage 3](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/interface/modifiers_tiberium_infestation_2_icon.png?raw=true)  | ![Stage 4](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/interface/modifiers_tiberium_infestation_3_icon.png?raw=true) | ![Stage 5](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/interface/modifiers_tiberium_infestation_4_icon.png?raw=true)  |
|------------------------------------|----------|----------|----------|----------|-----------|
|  local_manpower                    |    -30%  |    -50%  |    -70%  |    -85%  |    -100%  |
|  local_non_core_manpower           |    -30%  |    -50%  |    -70%  |    -85%  |    -100%  |
|  recruitable_population_factor     |    -30%  |    -50%  |    -70%  |    -85%  |    -100%  |
|  local_factories                   |    -30%  |    -50%  |    -70%  |    -85%  |    -100%  |
|  local_building_slots_factor       |    -30%  |    -50%  |    -70%  |    -85%  |    -100%  |
|  army_speed_factor_for_controller  |    -30%  |    -50%  |    -70%  |    -85%  |    -100%  |
|  local_resources                   |    -30%  |    -50%  |    -70%  |    -85%  |    -100%  |

### Province
|  Modifier            |  ![Stage 1](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/interface/modifiers_tiberium_infestation_0_icon.png?raw=true) | ![Stage 2](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/interface/modifiers_tiberium_infestation_1_icon.png?raw=true)  | ![Stage 3](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/interface/modifiers_tiberium_infestation_2_icon.png?raw=true)  | ![Stage 4](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/interface/modifiers_tiberium_infestation_3_icon.png?raw=true) | ![Stage 5](https://github.com/TiberiumWorld/Tiberium-Spread-Mechanic/blob/main/gfx/interface/modifiers_tiberium_infestation_4_icon.png?raw=true)  |
|----------------------|----------|----------|----------|----------|----------|
|  attrition           |      0%  |      2%  |      4%  |      6%  |      8%  |
|  army_speed_factor   |    -10%  |    -15%  |    -25%  |    -45%  |    -60%  |
|  army_attack_factor  |    -10%  |    -20%  |    -30%  |    -40%  |    -50%  |
|  dig_in_speed_factor |    -10%  |    -15%  |    -20%  |    -25%  |    -30%  |
|  positioning         |     -5%  |    -10%  |    -15%  |    -20%  |    -25%  |
