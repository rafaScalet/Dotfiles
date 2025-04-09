function fishin --argument-names opt
    source $__fish_config_dir/conf.d/plugins.fish

    switch $opt
        case update up
            fisher update

        case ""
            for plugin in $plugins
                if not contains $plugin $_fisher_plugins
                    fisher install $plugin
                    # fisher install $plugin | head -n 3 | tail -n 1 | string replace Installing (set_color normal)"Installing"(set_color green)
                end
            end

            for installed_plugin in $_fisher_plugins
                if not contains $installed_plugin $plugins
                    fisher remove $installed_plugin
                    # fisher remove $installed_plugin | grep Removing --color=never
                end
            end

        case "*"
            echo invalid option, run fishin or fishin up
            return 1
    end
end
