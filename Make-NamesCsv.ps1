param ($Lang)

$items = Get-ChildItem ".\DBM-CountPack-HotS-$Lang" -Directory
$outFile = './names.csv'

$list = @()

foreach ($hero in $items) {
    $list += @{
        Dir  = $hero.Name
        Name = $hero.Name
    }
}

$list | Export-Csv -Path $outFile
