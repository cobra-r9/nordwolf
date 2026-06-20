# ~/.config/fish/functions/nordwolf.fish

set -l NORDWOLF_DIR "$HOME/.config/nordwolf"
set -l INSTALLER "$NORDWOLF_DIR/cli/installer"
set -l SUBCMD "$NORDWOLF_DIR/cli/subcommands"

function nordwolf
    set -l NORDWOLF_DIR "$HOME/.config/nordwolf"
    set -l INSTALLER "$NORDWOLF_DIR/cli/installer"
    set -l SUBCMD "$NORDWOLF_DIR/cli/subcommands"

    switch "$argv[1]"
        case '' --help -h help
            if test "$argv[1]" = ''
                cd $NORDWOLF_DIR
                return
            end
            echo ""
            echo "  Usage: nordwolf <command> [args]"
            echo ""
            echo "  (no args)                  cd into ~/.config/nordwolf"
            echo "  deps <args>                run deps.sh"
            echo "  link-config <args>         run config-linker.sh"
            echo "  srcrec <args>              run srcrec.sh"
            echo "  tasker <args>              run tasker.sh"
            echo "  help                       show this message"
            echo ""

        case deps
            bash $INSTALLER/deps.sh $argv[2..]

        case link-config
            bash $INSTALLER/config-linker.sh $argv[2..]

        case srcrec
            bash $SUBCMD/srcrec.sh $argv[2..]

        case tasker
            bash $SUBCMD/tasker.sh $argv[2..]

        case '*'
            echo "  ✗  Unknown command: $argv[1]"
            echo "     Run 'nordwolf help' for usage"
            return 1
    end
end
