param ($Lang, $ExcludeList)

$ExcludeList = @($ExcludeList)
$outputDir = ".\DBM-CountPack-HotS-$Lang"

Remove-Item $outputDir -Recurse -Force
New-Item $outputDir -ItemType Directory

$items = Get-ChildItem .\VO\ -Filter *_Countdown?sec00.ogg

foreach ($file in $items) {
    if (!($file.Name -match '^([A-Za-z\d]+)_Countdown(\d)')) {
        Write-Host "$($file.Name) doesn't match"
        continue
    }

    $name = $Matches.1
    if ($ExcludeList.Contains($name)) {
        continue
    }

    if ($name.EndsWith("A")) {
        $name = $name.Substring(0, $name.Length - 1)
    }
    $name = $name.Replace("Announcer", "").Replace("OW", "")

    $sec = $Matches.2

    if (!(Test-Path "$outputDir\$name")) {
        New-Item "$outputDir\$name" -ItemType Directory
    }

    Copy-Item $file -Destination ".\$outputDir\$name\$sec.ogg"
}
