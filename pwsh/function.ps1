# 依赖外部文件：
# ~/.config/brook.json          存储 Brook 服务器和密码，用法见 brook-client 函数
# ~/scoop/shims/curl.exe        使用 scoop 安装的 curl 命令

<#
读取 ~/.config/brook.json 的配置，具有两个字段：

server
    服务器的地址与使用的端口： ip:port
passwd
    brook 服务器密码
#>
function brook-client {
    param(
        [string] $port   = "1080",
        [switch] $attach
    )
    $config = (Get-Content ~/.config/brook.json | ConvertFrom-JSON)
    $server = $config.server
    $passwd = $config.passwd
    if ($attach) {
        brook client -s "$server" -p "$passwd" -l "127.0.0.1:$($port)" -i 127.0.0.1
    } else {
        start-process -filepath brook.exe -argumentlist 'client','-s',"$server",'-p',"$passwd",'-l',"127.0.0.1:$($port)",'-i','127.0.0.1' -windowstyle hidden
    }
}

function brook-socks2http {
    param(
        [string] $sport  = "1080",
        [string] $port   = "8080",
        [switch] $attach
    )
    if ($attach) {
        brook.exe socks5tohttp -s "127.0.0.1:$($sport)" -l "127.0.0.1:$($port)"
    } else {
        start-process -filepath brook.exe -argumentlist 'socks5tohttp','-s',"127.0.0.1:$($sport)",'-l',"127.0.0.1:$($port)" -windowstyle hidden
    }
}

function aria2c-rpc {
    param([switch] $attach)
    if ($attach) {
        aria2c.exe
    } else {
        start-process -filepath aria2c.exe -windowstyle hidden
    }
}

# 生成 Nikola 博文
function Nikola-New {
    param(
        [string] $slug = $(Read-Host -Prompt "slug> "),
        [string] $title = $slug,
        [string] $invalid_replace = ""
    )
    $invalid_chars = [System.IO.Path]::GetInvalidFileNameChars();
    foreach ($ic in $invalid_chars) {
        $slug = $slug.Replace($ic, ' ');
    }
    $basename = ($slug -replace " +", "-").ToLower();

    # 在控制台输入文章标题
    $titleread = (Read-Host -Prompt "title: $title> ").Trim();
    if ($titleread -ne "") {
        $title = $titleread;
    }
    $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss UTCzzzz";
    # 生成头内容
    $content = @("---",
        "title: '$title'",
        "slug: '$basename'",
        "date: $date",
        "tags:",
        "category:",
        "description:",
        "type: text",
        "---",
        "",
        ".. contents::",
        "",
        ".. TEASER_END");
    $content = [string]::Join("`n", $content);

    # 生成目录
    # 按 yyyy-MM 划分
    $ym = Get-Date -Format "yyyy-MM";
    if (-not (Test-Path "posts/$ym")) {
        New-Item -ItemType Directory -Path "posts/$ym";
    }
    $filename = "posts/$ym/$basename.rst";
    # from https://stackoverflow.com/questions/5596982/using-powershell-to-write-a-file-in-utf-8-without-the-bom
    [System.IO.File]::WriteAllLines($filename, $content, [System.Text.UTF8Encoding]::new($false))
    Write-Host $filename -ForegroundColor Green;
}

# 重定向 curl 命令
function curl {
    $bin = "C:/Users/zombi/scoop/shims/curl.exe"
    & $bin $args
}
rm Alias:\curl

# 用资源管理器打开
function open($x) {
    explorer.exe $x
}

