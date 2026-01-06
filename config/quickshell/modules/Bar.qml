import Quickshell
import Quickshell.Wayland
import QtQuick

import "root:/utils/"

PanelWindow {
    anchors {
        top: true
    }
    implicitHeight: 30
    implicitWidth: 30
    color: "transparent"

    Text {
        anchors.centerIn: parent
        text: niri.focusedWindow?.title ?? ""
        color: Colors.mocha.blue
        font.pixelSize: 16
    }
}
