$Lang = "Ru"
$ExcludeList = "CloakenA", "LuchaA", "MurkyA", "Summer20A"
$Author = "KainStropov"


if (!(Test-Path "./VO")) {
    Write-Error "No sound source files found. Please extract thems from Heroes of the Storm data"
    exit 1
}

. .\Make-SoundFiles.ps1 -Lang $Lang -ExcludeList $ExcludeList
. .\Make-LuaScript.ps1 -Lang $Lang
. .\Make-BaseAddonFiles.ps1 -Lang $Lang -Author $Author