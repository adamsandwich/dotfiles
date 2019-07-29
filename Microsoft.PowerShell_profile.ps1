Import-Module Get-ChildItemColor

$env:PYTHONIOENCODING="utf-8"
# Set encoding
[System.Console]::OutputEncoding=[System.Text.Encoding]::GetEncoding(65001)
# Remove curl alias
If (Test-Path Alias:curl) {Remove-Item Alias:curl}
If (Test-Path Alias:curl) {Remove-Item Alias:curl}
# Remove-Item alias:ls -force
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

function GitLogPretty {
  git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all
}

function PrettyLS {
  colorls --light -A
}

function GitStat {git status}

function GoBack {Set-Location ..}

function GetMyIp {curl -L tool.lu/ip}
function UpdateScoop {scoop update; scoop update *}

Import-Module posh-git
Import-Module oh-my-posh
$DefaultUser = 'Adam'

# Setup other alias
Set-Alias open Invoke-Item
Set-Alias .. GoBack
Set-Alias glola GitLogPretty
Set-Alias gst GitStat
Set-Alias myip GetMyIp
Set-Alias pls PrettyLS
Set-Alias suu UpdateScoop
# Set theme
Set-Theme SandwichTechy

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Set Proxy
$env:http_proxy = $env:https_proxy = "http://127.0.0.1:1080"