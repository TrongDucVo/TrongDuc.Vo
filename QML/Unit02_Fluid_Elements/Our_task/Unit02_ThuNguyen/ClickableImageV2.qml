// ClickableImageV2.qml
// Simple image which can be clicked
import QtQuick 2.0
Item {
    id: root
    width: 100
    height: 100
    //property alias text: label.text
    property alias source: image.source
    signal clicked
    Column {
        id: container
        Image {
            id: image
            width: 100
            height: 100
            source: "image/turtle.png"
        }
        Text {
            id: label
            width: image.width
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#111111"
            text: ""
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
