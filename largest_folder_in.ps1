# Execution Example:
# .\largest_folder_appdata.ps1 -FolderName "$(pwd)"
Param(
    [Parameter(Mandatory)]
    [string[]]
    $FolderName
)
$appdataFolders=(Get-ChildItem -Path $folderName) | Where-Object {$_.PSIsContainer} | Select-Object FullName
$folderLength=[ordered]@{}
foreach ($Folder in $appdataFolders) {
    $total=0
    ((Get-ChildItem -Path $Folder.FullName -rec) | Where-Object {!$_.PSIsContainer} | Select-Object Length) | ForEach-Object {
        $total+=$_.Length
    }
    $folderLength.Add($Folder.FullName, $total)
}
$longestV=0
$longestK=""
$folderLength.GetEnumerator() | ForEach-Object {
    if ($_.Value -gt $longestV) {
        $longestV=0 + $_.Value
        $longestK="$($_.Key)"
    }
    if ($_.Value -gt 10000000) {
        Write-Output "$($_.Key): $($_.Value / 1000000000)"
    }
}
Write-Output "${longestK}: ${longestV}"