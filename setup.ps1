$SourceDirectory = $PSScriptRoot
$TargetDirectory = "${env:USERPROFILE}\Documents\my games\Path of Exile 2"

$FilterFiles = Get-ChildItem -Path $SourceDirectory -Filter '*.filter'

foreach ($File in $FilterFiles) {
    $TargetPath = Join-Path -Path $TargetDirectory -ChildPath $File.Name
    'Creating symlink: {0} -> {1}' -f $File.FullName, $TargetPath
    New-Item -ItemType SymbolicLink -Path $TargetPath -Target $File.FullName -Force | Out-Null
}
