function fishin --argument-names opt
  switch $opt
    case "update" "up"
      fisher update

    case ""
      for plugin in $plugins
        if not contains $plugin (fisher ls)
          fisher install $plugin | head -n 3 | tail -n 1 | string replace "Installing" (set_color normal)"Installing"(set_color green)
        end
      end

      for installed_plugin in (fisher ls)
        if not contains $installed_plugin $plugins
          fisher remove $installed_plugin | grep 'Removing' --color=never
        end
      end

    case "*"
      echo invalid option, run fishin or fishin up
      return 1
  end
end
