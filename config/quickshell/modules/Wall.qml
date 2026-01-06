import QtQuick
import Quickshell
import Quickshell.Io

Item {
  id: wallpaper

  Process {
    id: swaybg
    command: [
      "swaybg",
      "-m", "fill",
      "-i", wall
    ]
    running: true
  }

  Component.onCompleted: {
    swaybg.start()
  }

  Component.onDestruction: {
    swaybg.terminate()
  }
}
