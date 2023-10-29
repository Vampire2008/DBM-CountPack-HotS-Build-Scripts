param ($Lang, $Author, $CurseProjectId, $WagoProjectId)

$outputDir = ".\DBM-CountPack-HotS-$Lang"

$tocLines = @(
    "## Interface: 100107",
    "## Interface-Classic: 11404",
    "## Interface-Wrath: 30403",
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
$tocLines += ""
$tocLines += "CountLoadList.lua"
$tocLines += ""

$tocLines | Out-File -FilePath "$outputDir\DBM-CountPack-HotS-$Lang.toc"
