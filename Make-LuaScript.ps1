param ($Lang)

$items = Get-ChildItem ".\DBM-CountPack-HotS-$Lang" -Directory
$outFile = ".\DBM-CountPack-HotS-$Lang\CountLoadList.lua"

$namesCsv = Import-Csv -Path ".\names_$Lang.csv"
$namesDictionary = @{}
foreach ($r in $namesCsv) {
    $namesDictionary[$r.Dir] = $r.Name
}

$head = @"
local tinsert = table.insert
local inserted = false

function DBMCPHotS$Lang()
    if inserted then return end
"@

Out-File -FilePath $outFile -InputObject $head

$maxLocalizedNameLength = 0
$maxNameLength = 0
$maxPathLength = 0
$heroes = @()

foreach ($hero in $items) {
    $heroName = $hero.Name
    $heroLocalizedName = $namesDictionary[$heroName] ?? $heroName

    $hero = @{
        Name          = "$heroName"","
        LocalizedName = "$heroLocalizedName"","
        Path          = "$heroName\\"","
    }

    $heroes += $hero

    $maxLocalizedNameLength = ($maxLocalizedNameLength, $hero.LocalizedName.Length | Measure-Object -Maximum).Maximum
    $maxNameLength = ($maxNameLength, $hero.Name.Length | Measure-Object -Maximum).Maximum
    $maxPathLength = ($maxPathLength, $hero.Path.Length | Measure-Object -Maximum).Maximum
}

foreach ($hero in $heroes) {
    $line = @"
    tinsert(DBM.Counts, { text = "HoTS: $($hero.LocalizedName.PadRight($maxLocalizedNameLength)) value = "HoTS_$($hero.Name.PadRight($maxNameLength)) path = "Interface\\AddOns\\DBM-CountPack-HoTS-RU\\$($hero.Path.PadRight($maxPathLength)) max = 5})
"@
    Out-File -FilePath $outFile -Append -InputObject $line
}

Out-File -FilePath $outFile -Append -InputObject @"
    inserted = true
end
"@
