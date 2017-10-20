import QtQuick 2.6

Item{
    id: car
    width: 500
    height: 270
    property alias source: image.source
    property alias h: car.y
    signal clicked

    y:h
    Image {
        id: image
        anchors.fill: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: car.clicked()
    }
}
