<# 初始化 PowerShell #>

# 获取当前脚本文件的路径
$private:old_location = (Get-Location)
$private:current_location = Split-Path -Parent $MyInvocation.MyCommand.Definition
cd $private:current_location

# 默认重定向编码设置为 UTF8
$PSDefaultParameterValues["Out-File:Encoding"] = "UTF8"
# starship
Invoke-Expression (&starship init powershell)

# 导出其他脚本
. ./function.ps1
. ./completion.ps1

# 回到默认路径
cd $private:old_location
