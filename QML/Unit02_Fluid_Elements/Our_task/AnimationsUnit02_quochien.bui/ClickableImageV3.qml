import QtQuick 2.8
import QtQuick.Window 2.2

Item{
    id: root
    width: container.childrenRect.width
    height: container.childrenRect.height
    property alias text: label.text
    property alias source: image.source
    signal clicked
    Column{
        id: container
        Image{
            id: image
            width: 200
            height: 200
        }
        Text{
            id: label
            width: image.width
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color:"#111111"
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
