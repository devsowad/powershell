Import-Module oh-my-posh
Import-Module posh-git

Import-Module git-aliases -DisableNameChecking

# cd which remembers your history https://www.powershellgallery.com/packages/z/
Import-Module "z"
# Set the posh theme
Set-PoshPrompt -Theme bubblesline
  
$env:POSH_GIT_ENABLED = $true

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

# Nice colors for listings
Import-Module "Get-ChildItemColor"
# Set l and ls alias to use the new Get-ChildItemColor cmdlets
Set-Alias l Get-ChildItemColor -Option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope
# Remove the Username from the terminal
$DefaultUser = $env:USERNAME
  
# Setting for git posh
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
  
Set-Alias -Name g -Value "git" -Description "git"

Set-Alias -Name c -Value "clear"
Set-Alias -Name open -Value "ii"

function gacm { git add  . && git commit -m $args }
function gacmy { git add  . && yarn commit }
function gacmn { git add  . && npm run commit }

$projectFolderLocation = 'C:\Users\sowad\projects'

function diskcleanup { cd $projectFolderLocation && npx rimraf */*/windows/flutter/ephemeral && npx rimraf */*/build && npx rimraf */*/node_modules && npx rimraf */*/vendor && del C:\Windows\Temp\* && del C:\Users\sowad\AppData\Local\Temp\* && del C:\Windows\prefetch\*}

# clear
