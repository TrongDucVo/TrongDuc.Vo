import QtQuick 2.0

Item {
    id: root
    width: container.childrenRect.width + 20
    height: container.childrenRect.height + 20
    property alias text: label.text
    property alias source: image.source
    signal clicked
    property bool framed : false
    Rectangle{
        anchors.fill: parent
        color: "white"
        visible: root.framed
    }
    Column {
            x:8
            y:8
        id: container
        Image {
        id: image
        x:40
        y:40
        source: "images.png"

        }
        Text {
        id: label
        width: image.width
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        color: "#e0e0e0"
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
