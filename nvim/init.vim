" Vim 配置
set nocompatible " 不与 vi 兼容
set encoding=utf-8

" 语法高亮, 缩进处理, 色彩
syntax on
set t_Co=256 " 使用 TrueColor
filetype indent on " 载入文件类型对应的缩进规则
set autoindent
set tabstop=4
set shiftwidth=4
colorscheme default
set background=dark

set expandtab " 将 Tab 展开为空格
set softtabstop=4 " 设置 Tab 展开宽度

" 外观, 状态栏
set number " 显示行号
"set relativenumber " 使用相对行号
set showcmd " 显示指令
set showmode " 显示模式
set ruler " 显示光标坐标
set laststatus=2 " 显示状态栏, 0 不显示, 1 多窗口时显示, 2 一直显示

" 设置折行
" set textwidth=80 " 强行规定一行80字符, 超过会使用 **换行符** 换行
set wrap " 自动折行显示

" 设置匹配高亮
set showmatch " 高亮匹配括号
set hlsearch " 高亮搜索结果
" set incsearch " 搜索时自动动态跳转
set ignorecase " 搜索忽略大小写
set smartcase " 智能选择大小写忽略策略
set listchars=tab:>>,nbsp:_,trail:~,eol:$ " 空白字符显示规则
set list
set wildmenu " 命令模式下, tab 键补全
set wildmode=longest:list,full

" 编辑
" set spell spelllang=en_us,CJK " 英文拼写检查, 会把所有非英文字符视作错误, 不使用
set undofile " 保留撤销文件
set backupdir=~/.vim/.backup/ " 需要自行创建对应目录
set directory=~/.vim/.swap/
set undodir=~/.vim/.undo/
set autochdir " 自动跳转至编辑文件目录, 以便使用内置终端
set noerrorbells " 出错时不响铃
set visualbell " 使用视觉错误提醒
set history=1000 " 保留历史
set autoread " 文件监视, 如果文件被第三者修改, 则提示

" 按键映射
set backspace=indent,eol,start " 定义 backspace 行为, 可以删除 缩进,换行符,输入字符

