import QtQuick 2.0

Item {
    id: root1
    width: 100
    height: 100
    property alias text: label.text
    property alias source: image.source
    signal clicked
    Column {
        id: container
        Image {
            id: image
            width: 100
            height: 100
            source: ""
        }
        Text {
            id: label
            width: image.width
            font.pointSize: 14
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#111111"
            //text: "behavior on animation"
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root1.clicked()
    }
}
