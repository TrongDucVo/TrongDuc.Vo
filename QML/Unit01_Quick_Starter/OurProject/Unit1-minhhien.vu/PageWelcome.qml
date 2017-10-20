import QtQuick 2.0

DarkSquare {
    width: 700
    height: 700
    visible: true
    AnimatedImage{
        id: img2
        source: "image/fire.gif"
    }
    MouseArea{
        anchors.fill: parent
        onClicked: Qt.quit()
    }
}
