$dest = Join-Path "${env:HOMEDRIVE}${env:HOMEPATH}" "AppData/Local/nvim/lua"
if (!(Test-Path $dest)) {
  throw "Unable to find destination path: [$dest]"
}

$source = Join-Path $PSScriptRoot 'custom'
$destFolder = Join-Path $dest 'custom'

New-Item -ItemType SymbolicLink -Path $destFolder -Target $source
