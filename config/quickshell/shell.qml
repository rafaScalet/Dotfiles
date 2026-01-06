import Niri 0.1

import QtQuick
import Quickshell

import "root:/modules/"

ShellRoot{
    id: root

    property string wall: "/home/scalet/Dotfiles/assets/background.png"

    Bar {}
    Wall {}

    Niri {
        id: niri
        Component.onCompleted: connect()

        onConnected: console.info("Connected to niri")
        onErrorOccurred: function(error) {
            console.error("Niri error:", error)
        }
    }
}
