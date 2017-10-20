import QtQuick 2.0

Rectangle{
    width: 520
    height: 520
    visible: true
    Image {
        id:image2
        source: "image/welcome1.jpg"
    }
    MouseArea{
        anchors.fill: parent
        onClicked: Qt.quit()
    }
}
