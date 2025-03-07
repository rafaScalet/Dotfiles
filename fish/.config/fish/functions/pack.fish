function pack --argument-names package
  eval set pack_dir (__get_pack_dir)

  set cmd awk '{print $1}' $pack_dir/$package.txt

  switch $package
    case 'gnome'; $cmd | xargs -n1 gext install
    case 'silly'; $cmd | xargs -n1 yay -S
    case 'yay'; $cmd | xargs -n1 yay -S
    case 'vscode'; $cmd | xargs -n1 codium --install-extension
  end
end
