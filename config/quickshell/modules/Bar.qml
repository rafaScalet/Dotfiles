import QtQuick
import QtQuick.Layouts
import Quickshell

import "root:/utils"

PanelWindow {
    id: bar
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 30
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color: Colors.mocha.base
        // left
        
        // center
        RowLayout {
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            Text {
                text: niri.focusedWindow?.title ?? ""
                font.family: "Barlow Medium"
                font.pixelSize: 16
                color: Colors.mocha.blue
            }
        }
        // right
        RowLayout {
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 25
            }
            spacing: 10
            Loader { active: true; sourceComponent: Power {} }
            Loader { active: true; sourceComponent: Time {} }
        }
    }
}
