param ($Lang, $Author, $CurseProjectId, $WagoProjectId, $WowIProjectId)

$outputDir = ".\DBM-CountPack-HotS-$Lang"

$tocLines = @(
    "## Interface: 110100",
    "## Interface-Classic: 11506",
    "## Interface-Cata: 40402",
    "## Category: DBM",
    "## Title:|cffffe00a<|r|cffff7d0aDBM Media|r|cffffe00a>|r |cff308530Countpack HotS $Lang|r",
    "## Title-ruRU:|cffffe00a<|r|cffff7d0aDBM Медиа|r|cffffe00a>|r |cff308530Звуки отсчёта из HotS $Lang|r",
    "## DefaultState: enabled",
    "## RequiredDeps: DBM-Core",
    "## Author: MysticalOS, $Author",
    "## Version: @project-version@",
    "## IconTexture: Interface\AddOns\DBM-Core\textures\dbm_airhorn",
    "## X-DBM-CountPack: 1,"
    "## X-DBM-CountPack-GlobalName: DBMCPHotS$Lang"
)

if ($CurseProjectId) {
    $tocLines += "## X-Curse-Project-ID: $CurseProjectId"
}

if ($WagoProjectId) {
    $tocLines += "## X-Wago-ID: $WagoProjectId"
}

if ($WowIProjectId) {
    $tocLines += "## X-WoWI-ID: $WowIProjectId"
}

$tocLines += ""
$tocLines += "CountLoadList.lua"

$tocLines | Out-File -FilePath "$outputDir\DBM-CountPack-HotS-$Lang.toc"

@"
package-as: DBM-CountPack-HotS-$Lang

move-folders:
  DBM-CountPack-HotS-$Lang/DBM-CountPack-HotS-$($Lang): DBM-CountPack-HotS-$Lang

ignore:
  - *.ps1
  - *.csv
"@ | Out-File -FilePath ".pkgmeta"
