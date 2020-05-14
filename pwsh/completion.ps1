# 命令行参数补全
# rustup
# rg

using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'rustup' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'rustup'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-')) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'rustup' {
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Enable verbose output')
            [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, 'Enable verbose output')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Disable progress output')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Disable progress output')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('dump-testament', 'dump-testament', [CompletionResultType]::ParameterValue, 'Dump information about the build')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show the active and installed toolchains or profiles')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Update Rust toolchains')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall Rust toolchains')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Update Rust toolchains and rustup')
            [CompletionResult]::new('check', 'check', [CompletionResultType]::ParameterValue, 'Check for updates to Rust toolchains')
            [CompletionResult]::new('default', 'default', [CompletionResultType]::ParameterValue, 'Set the default toolchain')
            [CompletionResult]::new('toolchain', 'toolchain', [CompletionResultType]::ParameterValue, 'Modify or query the installed toolchains')
            [CompletionResult]::new('target', 'target', [CompletionResultType]::ParameterValue, 'Modify a toolchain''s supported targets')
            [CompletionResult]::new('component', 'component', [CompletionResultType]::ParameterValue, 'Modify a toolchain''s installed components')
            [CompletionResult]::new('override', 'override', [CompletionResultType]::ParameterValue, 'Modify directory toolchain overrides')
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, 'Run a command with an environment configured for a given toolchain')
            [CompletionResult]::new('which', 'which', [CompletionResultType]::ParameterValue, 'Display which binary will be run for a given command')
            [CompletionResult]::new('doc', 'doc', [CompletionResultType]::ParameterValue, 'Open the documentation for the current toolchain')
            [CompletionResult]::new('self', 'self', [CompletionResultType]::ParameterValue, 'Modify the rustup installation')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Alter rustup settings')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate tab-completion scripts for your shell')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;dump-testament' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;show' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('active-toolchain', 'active-toolchain', [CompletionResultType]::ParameterValue, 'Show the active toolchain')
            [CompletionResult]::new('home', 'home', [CompletionResultType]::ParameterValue, 'Display the computed value of RUSTUP_HOME')
            [CompletionResult]::new('profile', 'profile', [CompletionResultType]::ParameterValue, 'Show the current profile')
            [CompletionResult]::new('keys', 'keys', [CompletionResultType]::ParameterValue, 'Display the known PGP keys')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;show;active-toolchain' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;show;home' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;show;profile' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;show;keys' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;show;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;install' {
            [CompletionResult]::new('--profile', 'profile', [CompletionResultType]::ParameterName, 'profile')
            [CompletionResult]::new('--no-self-update', 'no-self-update', [CompletionResultType]::ParameterName, 'Don''t perform self-update when running the `rustup install` command')
            [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Force an update, even if some components are missing')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;uninstall' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;update' {
            [CompletionResult]::new('--no-self-update', 'no-self-update', [CompletionResultType]::ParameterName, 'Don''t perform self update when running the `rustup update` command')
            [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Force an update, even if some components are missing')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;check' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;default' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;toolchain' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List installed toolchains')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Install or update a given toolchain')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall a toolchain')
            [CompletionResult]::new('link', 'link', [CompletionResultType]::ParameterValue, 'Create a custom toolchain by symlinking to a directory')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;toolchain;list' {
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Enable verbose output with toolchain information')
            [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, 'Enable verbose output with toolchain information')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;toolchain;install' {
            [CompletionResult]::new('--profile', 'profile', [CompletionResultType]::ParameterName, 'profile')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Add specific components on installation')
            [CompletionResult]::new('--component', 'component', [CompletionResultType]::ParameterName, 'Add specific components on installation')
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Add specific targets on installation')
            [CompletionResult]::new('--target', 'target', [CompletionResultType]::ParameterName, 'Add specific targets on installation')
            [CompletionResult]::new('--no-self-update', 'no-self-update', [CompletionResultType]::ParameterName, 'Don''t perform self update when running the`rustup toolchain install` command')
            [CompletionResult]::new('--force', 'force', [CompletionResultType]::ParameterName, 'Force an update, even if some components are missing')
            [CompletionResult]::new('--allow-downgrade', 'allow-downgrade', [CompletionResultType]::ParameterName, 'Allow rustup to downgrade the toolchain to satisfy your component choice')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;toolchain;uninstall' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;toolchain;link' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;toolchain;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;target' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List installed and available targets')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a target to a Rust toolchain')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a target from a Rust toolchain')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;target;list' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('--installed', 'installed', [CompletionResultType]::ParameterName, 'List only installed targets')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;target;add' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;target;remove' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;target;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;component' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List installed and available components')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a component to a Rust toolchain')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a component from a Rust toolchain')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;component;list' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('--installed', 'installed', [CompletionResultType]::ParameterName, 'List only installed components')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;component;add' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('--target', 'target', [CompletionResultType]::ParameterName, 'target')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;component;remove' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('--target', 'target', [CompletionResultType]::ParameterName, 'target')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;component;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;override' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List directory toolchain overrides')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the override toolchain for a directory')
            [CompletionResult]::new('unset', 'unset', [CompletionResultType]::ParameterValue, 'Remove the override toolchain for a directory')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;override;list' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;override;set' {
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'Path to the directory')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;override;unset' {
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'Path to the directory')
            [CompletionResult]::new('--nonexistent', 'nonexistent', [CompletionResultType]::ParameterName, 'Remove override toolchain for all nonexistent directories')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;override;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;run' {
            [CompletionResult]::new('--install', 'install', [CompletionResultType]::ParameterName, 'Install the requested toolchain if needed')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;which' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;doc' {
            [CompletionResult]::new('--toolchain', 'toolchain', [CompletionResultType]::ParameterName, 'Toolchain name, such as ''stable'', ''nightly'', or ''1.8.0''. For more information see `rustup help toolchain`')
            [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, 'Only print the path to the documentation')
            [CompletionResult]::new('--alloc', 'alloc', [CompletionResultType]::ParameterName, 'The Rust core allocation and collections library')
            [CompletionResult]::new('--book', 'book', [CompletionResultType]::ParameterName, 'The Rust Programming Language book')
            [CompletionResult]::new('--cargo', 'cargo', [CompletionResultType]::ParameterName, 'The Cargo Book')
            [CompletionResult]::new('--core', 'core', [CompletionResultType]::ParameterName, 'The Rust Core Library')
            [CompletionResult]::new('--edition-guide', 'edition-guide', [CompletionResultType]::ParameterName, 'The Rust Edition Guide')
            [CompletionResult]::new('--nomicon', 'nomicon', [CompletionResultType]::ParameterName, 'The Dark Arts of Advanced and Unsafe Rust Programming')
            [CompletionResult]::new('--proc_macro', 'proc_macro', [CompletionResultType]::ParameterName, 'A support library for macro authors when defining new macros')
            [CompletionResult]::new('--reference', 'reference', [CompletionResultType]::ParameterName, 'The Rust Reference')
            [CompletionResult]::new('--rust-by-example', 'rust-by-example', [CompletionResultType]::ParameterName, 'A collection of runnable examples that illustrate various Rust concepts and standard libraries')
            [CompletionResult]::new('--rustc', 'rustc', [CompletionResultType]::ParameterName, 'The compiler for the Rust programming language')
            [CompletionResult]::new('--rustdoc', 'rustdoc', [CompletionResultType]::ParameterName, 'Generate documentation for Rust projects')
            [CompletionResult]::new('--std', 'std', [CompletionResultType]::ParameterName, 'Standard library API documentation')
            [CompletionResult]::new('--test', 'test', [CompletionResultType]::ParameterName, 'Support code for rustc''s built in unit-test and micro-benchmarking framework')
            [CompletionResult]::new('--unstable-book', 'unstable-book', [CompletionResultType]::ParameterName, 'The Unstable Book')
            [CompletionResult]::new('--embedded-book', 'embedded-book', [CompletionResultType]::ParameterName, 'The Embedded Rust Book')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;self' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Download and install updates to rustup')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall rustup.')
            [CompletionResult]::new('upgrade-data', 'upgrade-data', [CompletionResultType]::ParameterValue, 'Upgrade the internal data format.')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;self;update' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;self;uninstall' {
            [CompletionResult]::new('-y', 'y', [CompletionResultType]::ParameterName, 'y')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;self;upgrade-data' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;self;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;set' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('default-host', 'default-host', [CompletionResultType]::ParameterValue, 'The triple used to identify toolchains when not specified')
            [CompletionResult]::new('profile', 'profile', [CompletionResultType]::ParameterValue, 'The default components installed')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'rustup;set;default-host' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;set;profile' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;set;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;completions' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'rustup;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}

Register-ArgumentCompleter -Native -CommandName 'rg' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'rg'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-')) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'rg' {
            [CompletionResult]::new('-A', 'A', [CompletionResultType]::ParameterName, 'Show NUM lines after each match.')
            [CompletionResult]::new('--after-context', 'after-context', [CompletionResultType]::ParameterName, 'Show NUM lines after each match.')
            [CompletionResult]::new('-B', 'B', [CompletionResultType]::ParameterName, 'Show NUM lines before each match.')
            [CompletionResult]::new('--before-context', 'before-context', [CompletionResultType]::ParameterName, 'Show NUM lines before each match.')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'Controls when to use color.')
            [CompletionResult]::new('--colors', 'colors', [CompletionResultType]::ParameterName, 'Configure color settings and styles.')
            [CompletionResult]::new('-C', 'C', [CompletionResultType]::ParameterName, 'Show NUM lines before and after each match.')
            [CompletionResult]::new('--context', 'context', [CompletionResultType]::ParameterName, 'Show NUM lines before and after each match.')
            [CompletionResult]::new('--context-separator', 'context-separator', [CompletionResultType]::ParameterName, 'Set the context separator string.')
            [CompletionResult]::new('--dfa-size-limit', 'dfa-size-limit', [CompletionResultType]::ParameterName, 'The upper size limit of the regex DFA.')
            [CompletionResult]::new('-E', 'E', [CompletionResultType]::ParameterName, 'Specify the text encoding of files to search.')
            [CompletionResult]::new('--encoding', 'encoding', [CompletionResultType]::ParameterName, 'Specify the text encoding of files to search.')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Search for patterns from the given file.')
            [CompletionResult]::new('--file', 'file', [CompletionResultType]::ParameterName, 'Search for patterns from the given file.')
            [CompletionResult]::new('-g', 'g', [CompletionResultType]::ParameterName, 'Include or exclude files.')
            [CompletionResult]::new('--glob', 'glob', [CompletionResultType]::ParameterName, 'Include or exclude files.')
            [CompletionResult]::new('--iglob', 'iglob', [CompletionResultType]::ParameterName, 'Include or exclude files case insensitively.')
            [CompletionResult]::new('--ignore-file', 'ignore-file', [CompletionResultType]::ParameterName, 'Specify additional ignore files.')
            [CompletionResult]::new('-M', 'M', [CompletionResultType]::ParameterName, 'Don''t print lines longer than this limit.')
            [CompletionResult]::new('--max-columns', 'max-columns', [CompletionResultType]::ParameterName, 'Don''t print lines longer than this limit.')
            [CompletionResult]::new('-m', 'm', [CompletionResultType]::ParameterName, 'Limit the number of matches.')
            [CompletionResult]::new('--max-count', 'max-count', [CompletionResultType]::ParameterName, 'Limit the number of matches.')
            [CompletionResult]::new('--max-depth', 'max-depth', [CompletionResultType]::ParameterName, 'Descend at most NUM directories.')
            [CompletionResult]::new('--max-filesize', 'max-filesize', [CompletionResultType]::ParameterName, 'Ignore files larger than NUM in size.')
            [CompletionResult]::new('--path-separator', 'path-separator', [CompletionResultType]::ParameterName, 'Set the path separator.')
            [CompletionResult]::new('--pre', 'pre', [CompletionResultType]::ParameterName, 'search outputs of COMMAND FILE for each FILE')
            [CompletionResult]::new('--pre-glob', 'pre-glob', [CompletionResultType]::ParameterName, 'Include or exclude files from a preprocessing command.')
            [CompletionResult]::new('--regex-size-limit', 'regex-size-limit', [CompletionResultType]::ParameterName, 'The upper size limit of the compiled regex.')
            [CompletionResult]::new('-e', 'e', [CompletionResultType]::ParameterName, 'A pattern to search for.')
            [CompletionResult]::new('--regexp', 'regexp', [CompletionResultType]::ParameterName, 'A pattern to search for.')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Replace matches with the given text.')
            [CompletionResult]::new('--replace', 'replace', [CompletionResultType]::ParameterName, 'Replace matches with the given text.')
            [CompletionResult]::new('--sort', 'sort', [CompletionResultType]::ParameterName, 'Sort results in ascending order. Implies --threads=1.')
            [CompletionResult]::new('--sortr', 'sortr', [CompletionResultType]::ParameterName, 'Sort results in descending order. Implies --threads=1.')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'The approximate number of threads to use.')
            [CompletionResult]::new('--threads', 'threads', [CompletionResultType]::ParameterName, 'The approximate number of threads to use.')
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Only search files matching TYPE.')
            [CompletionResult]::new('--type', 'type', [CompletionResultType]::ParameterName, 'Only search files matching TYPE.')
            [CompletionResult]::new('--type-add', 'type-add', [CompletionResultType]::ParameterName, 'Add a new glob for a file type.')
            [CompletionResult]::new('--type-clear', 'type-clear', [CompletionResultType]::ParameterName, 'Clear globs for a file type.')
            [CompletionResult]::new('-T', 'T', [CompletionResultType]::ParameterName, 'Do not search files matching TYPE.')
            [CompletionResult]::new('--type-not', 'type-not', [CompletionResultType]::ParameterName, 'Do not search files matching TYPE.')
            [CompletionResult]::new('--block-buffered', 'block-buffered', [CompletionResultType]::ParameterName, 'Force block buffering.')
            [CompletionResult]::new('--no-block-buffered', 'no-block-buffered', [CompletionResultType]::ParameterName, 'no-block-buffered')
            [CompletionResult]::new('-b', 'b', [CompletionResultType]::ParameterName, 'Print the 0-based byte offset for each matching line.')
            [CompletionResult]::new('--byte-offset', 'byte-offset', [CompletionResultType]::ParameterName, 'Print the 0-based byte offset for each matching line.')
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Search case sensitively (default).')
            [CompletionResult]::new('--case-sensitive', 'case-sensitive', [CompletionResultType]::ParameterName, 'Search case sensitively (default).')
            [CompletionResult]::new('--column', 'column', [CompletionResultType]::ParameterName, 'Show column numbers.')
            [CompletionResult]::new('--no-column', 'no-column', [CompletionResultType]::ParameterName, 'no-column')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Only show the count of matching lines for each file.')
            [CompletionResult]::new('--count', 'count', [CompletionResultType]::ParameterName, 'Only show the count of matching lines for each file.')
            [CompletionResult]::new('--count-matches', 'count-matches', [CompletionResultType]::ParameterName, 'Only show the count of individual matches for each file.')
            [CompletionResult]::new('--crlf', 'crlf', [CompletionResultType]::ParameterName, 'Support CRLF line terminators (useful on Windows).')
            [CompletionResult]::new('--no-crlf', 'no-crlf', [CompletionResultType]::ParameterName, 'no-crlf')
            [CompletionResult]::new('--debug', 'debug', [CompletionResultType]::ParameterName, 'Show debug messages.')
            [CompletionResult]::new('--trace', 'trace', [CompletionResultType]::ParameterName, 'trace')
            [CompletionResult]::new('--no-encoding', 'no-encoding', [CompletionResultType]::ParameterName, 'no-encoding')
            [CompletionResult]::new('--files', 'files', [CompletionResultType]::ParameterName, 'Print each file that would be searched.')
            [CompletionResult]::new('-l', 'l', [CompletionResultType]::ParameterName, 'Only print the paths with at least one match.')
            [CompletionResult]::new('--files-with-matches', 'files-with-matches', [CompletionResultType]::ParameterName, 'Only print the paths with at least one match.')
            [CompletionResult]::new('--files-without-match', 'files-without-match', [CompletionResultType]::ParameterName, 'Only print the paths that contain zero matches.')
            [CompletionResult]::new('-F', 'F', [CompletionResultType]::ParameterName, 'Treat the pattern as a literal string.')
            [CompletionResult]::new('--fixed-strings', 'fixed-strings', [CompletionResultType]::ParameterName, 'Treat the pattern as a literal string.')
            [CompletionResult]::new('--no-fixed-strings', 'no-fixed-strings', [CompletionResultType]::ParameterName, 'no-fixed-strings')
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Follow symbolic links.')
            [CompletionResult]::new('--follow', 'follow', [CompletionResultType]::ParameterName, 'Follow symbolic links.')
            [CompletionResult]::new('--no-follow', 'no-follow', [CompletionResultType]::ParameterName, 'no-follow')
            [CompletionResult]::new('--heading', 'heading', [CompletionResultType]::ParameterName, 'Print matches grouped by each file.')
            [CompletionResult]::new('--no-heading', 'no-heading', [CompletionResultType]::ParameterName, 'Don''t group matches by each file.')
            [CompletionResult]::new('--hidden', 'hidden', [CompletionResultType]::ParameterName, 'Search hidden files and directories.')
            [CompletionResult]::new('--no-hidden', 'no-hidden', [CompletionResultType]::ParameterName, 'no-hidden')
            [CompletionResult]::new('-i', 'i', [CompletionResultType]::ParameterName, 'Case insensitive search.')
            [CompletionResult]::new('--ignore-case', 'ignore-case', [CompletionResultType]::ParameterName, 'Case insensitive search.')
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Invert matching.')
            [CompletionResult]::new('--invert-match', 'invert-match', [CompletionResultType]::ParameterName, 'Invert matching.')
            [CompletionResult]::new('--json', 'json', [CompletionResultType]::ParameterName, 'Show search results in a JSON Lines format.')
            [CompletionResult]::new('--no-json', 'no-json', [CompletionResultType]::ParameterName, 'no-json')
            [CompletionResult]::new('--line-buffered', 'line-buffered', [CompletionResultType]::ParameterName, 'Force line buffering.')
            [CompletionResult]::new('--no-line-buffered', 'no-line-buffered', [CompletionResultType]::ParameterName, 'no-line-buffered')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Show line numbers.')
            [CompletionResult]::new('--line-number', 'line-number', [CompletionResultType]::ParameterName, 'Show line numbers.')
            [CompletionResult]::new('-N', 'N', [CompletionResultType]::ParameterName, 'Suppress line numbers.')
            [CompletionResult]::new('--no-line-number', 'no-line-number', [CompletionResultType]::ParameterName, 'Suppress line numbers.')
            [CompletionResult]::new('-x', 'x', [CompletionResultType]::ParameterName, 'Only show matches surrounded by line boundaries.')
            [CompletionResult]::new('--line-regexp', 'line-regexp', [CompletionResultType]::ParameterName, 'Only show matches surrounded by line boundaries.')
            [CompletionResult]::new('--mmap', 'mmap', [CompletionResultType]::ParameterName, 'Search using memory maps when possible.')
            [CompletionResult]::new('--no-mmap', 'no-mmap', [CompletionResultType]::ParameterName, 'Never use memory maps.')
            [CompletionResult]::new('-U', 'U', [CompletionResultType]::ParameterName, 'Enable matching across multiple lines.')
            [CompletionResult]::new('--multiline', 'multiline', [CompletionResultType]::ParameterName, 'Enable matching across multiple lines.')
            [CompletionResult]::new('--no-multiline', 'no-multiline', [CompletionResultType]::ParameterName, 'no-multiline')
            [CompletionResult]::new('--multiline-dotall', 'multiline-dotall', [CompletionResultType]::ParameterName, 'Make ''.'' match new lines when multiline is enabled.')
            [CompletionResult]::new('--no-multiline-dotall', 'no-multiline-dotall', [CompletionResultType]::ParameterName, 'no-multiline-dotall')
            [CompletionResult]::new('--no-config', 'no-config', [CompletionResultType]::ParameterName, 'Never read configuration files.')
            [CompletionResult]::new('--no-ignore', 'no-ignore', [CompletionResultType]::ParameterName, 'Don''t respect ignore files.')
            [CompletionResult]::new('--ignore', 'ignore', [CompletionResultType]::ParameterName, 'ignore')
            [CompletionResult]::new('--no-ignore-global', 'no-ignore-global', [CompletionResultType]::ParameterName, 'Don''t respect global ignore files.')
            [CompletionResult]::new('--ignore-global', 'ignore-global', [CompletionResultType]::ParameterName, 'ignore-global')
            [CompletionResult]::new('--no-ignore-messages', 'no-ignore-messages', [CompletionResultType]::ParameterName, 'Suppress gitignore parse error messages.')
            [CompletionResult]::new('--ignore-messages', 'ignore-messages', [CompletionResultType]::ParameterName, 'ignore-messages')
            [CompletionResult]::new('--no-ignore-parent', 'no-ignore-parent', [CompletionResultType]::ParameterName, 'Don''t respect ignore files in parent directories.')
            [CompletionResult]::new('--ignore-parent', 'ignore-parent', [CompletionResultType]::ParameterName, 'ignore-parent')
            [CompletionResult]::new('--no-ignore-vcs', 'no-ignore-vcs', [CompletionResultType]::ParameterName, 'Don''t respect VCS ignore files.')
            [CompletionResult]::new('--ignore-vcs', 'ignore-vcs', [CompletionResultType]::ParameterName, 'ignore-vcs')
            [CompletionResult]::new('--no-messages', 'no-messages', [CompletionResultType]::ParameterName, 'Suppress some error messages.')
            [CompletionResult]::new('--messages', 'messages', [CompletionResultType]::ParameterName, 'messages')
            [CompletionResult]::new('--no-pcre2-unicode', 'no-pcre2-unicode', [CompletionResultType]::ParameterName, 'Disable Unicode mode for PCRE2 matching.')
            [CompletionResult]::new('--pcre2-unicode', 'pcre2-unicode', [CompletionResultType]::ParameterName, 'pcre2-unicode')
            [CompletionResult]::new('-0', '0', [CompletionResultType]::ParameterName, 'Print a NUL byte after file paths.')
            [CompletionResult]::new('--null', 'null', [CompletionResultType]::ParameterName, 'Print a NUL byte after file paths.')
            [CompletionResult]::new('--null-data', 'null-data', [CompletionResultType]::ParameterName, 'Use NUL as a line terminator instead of \n.')
            [CompletionResult]::new('--one-file-system', 'one-file-system', [CompletionResultType]::ParameterName, 'Do not descend into directories on other file systems.')
            [CompletionResult]::new('--no-one-file-system', 'no-one-file-system', [CompletionResultType]::ParameterName, 'no-one-file-system')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Print only matches parts of a line.')
            [CompletionResult]::new('--only-matching', 'only-matching', [CompletionResultType]::ParameterName, 'Print only matches parts of a line.')
            [CompletionResult]::new('--passthru', 'passthru', [CompletionResultType]::ParameterName, 'Print both matching and non-matching lines.')
            [CompletionResult]::new('-P', 'P', [CompletionResultType]::ParameterName, 'Enable PCRE2 matching.')
            [CompletionResult]::new('--pcre2', 'pcre2', [CompletionResultType]::ParameterName, 'Enable PCRE2 matching.')
            [CompletionResult]::new('--no-pcre2', 'no-pcre2', [CompletionResultType]::ParameterName, 'no-pcre2')
            [CompletionResult]::new('--no-pre', 'no-pre', [CompletionResultType]::ParameterName, 'no-pre')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Alias for --color always --heading --line-number.')
            [CompletionResult]::new('--pretty', 'pretty', [CompletionResultType]::ParameterName, 'Alias for --color always --heading --line-number.')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not print anything to stdout.')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not print anything to stdout.')
            [CompletionResult]::new('-z', 'z', [CompletionResultType]::ParameterName, 'Search in compressed files.')
            [CompletionResult]::new('--search-zip', 'search-zip', [CompletionResultType]::ParameterName, 'Search in compressed files.')
            [CompletionResult]::new('--no-search-zip', 'no-search-zip', [CompletionResultType]::ParameterName, 'no-search-zip')
            [CompletionResult]::new('-S', 'S', [CompletionResultType]::ParameterName, 'Smart case search.')
            [CompletionResult]::new('--smart-case', 'smart-case', [CompletionResultType]::ParameterName, 'Smart case search.')
            [CompletionResult]::new('--sort-files', 'sort-files', [CompletionResultType]::ParameterName, 'DEPRECATED')
            [CompletionResult]::new('--no-sort-files', 'no-sort-files', [CompletionResultType]::ParameterName, 'no-sort-files')
            [CompletionResult]::new('--stats', 'stats', [CompletionResultType]::ParameterName, 'Print statistics about this ripgrep search.')
            [CompletionResult]::new('--no-stats', 'no-stats', [CompletionResultType]::ParameterName, 'no-stats')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Search binary files as if they were text.')
            [CompletionResult]::new('--text', 'text', [CompletionResultType]::ParameterName, 'Search binary files as if they were text.')
            [CompletionResult]::new('--no-text', 'no-text', [CompletionResultType]::ParameterName, 'no-text')
            [CompletionResult]::new('--trim', 'trim', [CompletionResultType]::ParameterName, 'Trim prefixed whitespace from matches.')
            [CompletionResult]::new('--no-trim', 'no-trim', [CompletionResultType]::ParameterName, 'no-trim')
            [CompletionResult]::new('--type-list', 'type-list', [CompletionResultType]::ParameterName, 'Show all supported file types.')
            [CompletionResult]::new('-u', 'u', [CompletionResultType]::ParameterName, 'Reduce the level of "smart" searching.')
            [CompletionResult]::new('--unrestricted', 'unrestricted', [CompletionResultType]::ParameterName, 'Reduce the level of "smart" searching.')
            [CompletionResult]::new('--vimgrep', 'vimgrep', [CompletionResultType]::ParameterName, 'Show results in vim compatible format.')
            [CompletionResult]::new('-H', 'H', [CompletionResultType]::ParameterName, 'Print the file path with the matched lines.')
            [CompletionResult]::new('--with-filename', 'with-filename', [CompletionResultType]::ParameterName, 'Print the file path with the matched lines.')
            [CompletionResult]::new('--no-filename', 'no-filename', [CompletionResultType]::ParameterName, 'Never print the file path with the matched lines.')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'Only show matches surrounded by word boundaries.')
            [CompletionResult]::new('--word-regexp', 'word-regexp', [CompletionResultType]::ParameterName, 'Only show matches surrounded by word boundaries.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information. Use --help for more details.')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information. Use --help for more details.')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
