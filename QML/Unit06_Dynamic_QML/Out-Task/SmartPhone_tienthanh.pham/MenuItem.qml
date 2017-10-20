import QtQuick 2.4

Rectangle {
    id: root
    property alias textName: name.text
    property alias imgSource: img.source
    signal click()
    width: 100
    height: 100
    color: "#00000000"
    Text{
        id: name
        text:textName
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            root.click()
        }
    }
    Image {
        id: img
        source: imgSource
        height: parent.height*8/10
        width: parent.width
    }
}
