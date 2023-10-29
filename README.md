# DBM-CountPack-HotS-Build-Scripts
This repository contains russian version of [DBM-CountPack-HotS](https://github.com/DeadlyBossMods/DBM-CountPack-HotS). Also it contains build scripts to make your own localized version of this addon.

## Make custom mod
First make fork of this repository and clone it.

### Extract resources
You need to extract localized sounds. You can use [CASCExplorer](https://github.com/WoW-Tools/CASCExplorer) to do that. You need to extract that folder `Root\mods\heroes.stormmod\xxxx.stormassets\LocalizedData\Sounds\VO` where `xxxx` is code of your locale (for example `enus`). If you doesn't see `xxxx.stormassets` folder in CASCExploer then change locale in View -> Locale.
Then place the `VO` folder in that repository.

### Modify script
On second part open `build.ps1` and change variables in start of file to yours.
 * `$Lang` used in creating folder and naming Lua function
 * `$ExcludeList` used to ignore some voices. For example "CloakenA", "LuchaA", "MurkyA", "Summer20A" are excluded because they doesn't have localized version in Russian locale. If you don't want any exclude just assign `@()` to it.
 * `$Author` - Your name that will be placed in TOC file.
 * `$CurseProjectId` - id of project on [CurseForge](https://www.curseforge.com). Set it if you want to publish your version of mod as separate project.
 * `$WagoProjectId` - id of project on [Wago](https://addons.wago.io). Set it if you want to publish your version of mod as separate project.
 * `$WowIProjectId` - id of project on [WoW Interface](https://www.wowinterface.com). Set it if you want to publish your version of mod as separate project.

### Building
Just run `build.ps1` in PowerShell

### Make localized names (optional)
If you want to make localized names in interface you can do it.
Make all of previous steps. Then run `Make-NamesCsv.ps1 -Lang xx` (replace `xx` with your `$Lang` variable value) in PowerShell. It will make file `names.csv`. Edit the second value in each row. After that rename it to `names_xx.csv` (replace `xx` with your `$Lang` variable value).
After that run `Make-LuaScript.ps1 -Lang xx` (replace `xx` with your `$Lang` variable value).

### Using
On this step you can just copy new folder `DBM-CountPack-Hots-XX` into your addon folder of World of Warcraft to use it.

### Building mod and publishing
This step is required if you want to publish your mod on GitHub, CurseForge of Wago.
Commit all changes and place tag with version. It will trigger the GitHub Action workflow that uses [WoW Packager](https://github.com/marketplace/actions/wow-packager)
