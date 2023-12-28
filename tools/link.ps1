
$modPath = $PSScriptRoot
$modPath = Split-Path -Path $modPath -Parent
$modName = Split-Path (Split-Path $PSScriptRoot) -Leaf

$hoiModPath = "$env:USERPROFILE\Documents\Paradox Interactive\Hearts of Iron IV\mod"
$pdxModPathName = Join-Path $hoiModPath $modName

New-Item -itemtype Junction `
    -path "$hoiModPath" `
    -name "$modName" `
    -value "$modPath" `
    -force #>$null 2>&1
