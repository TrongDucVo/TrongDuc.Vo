import QtQuick 2.0

Item {
  width: 200; height: 200

  Loader {
    // Explicitly set the size of the
    // Loader to the parent item's size
    anchors.centerIn: parent
    sourceComponent: rect
  }

  Component {
    id: rect
    Rectangle {
      width: 50
      height: 50
      color: "red"
      }
  }
}
