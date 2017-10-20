import QtQuick 2.6

Item {
    id: root
    width: container.childrenRect.width + 16
    height: container.childrenRect.height + 16
    property alias text: label.text
    property alias source: image.source
    signal clicked
    // M1>>
    // ... add a framed rectangle as container
    property bool framed : false
    Rectangle {
        anchors.fill: parent
        color: "white"
        visible: root.framed
    }
}
