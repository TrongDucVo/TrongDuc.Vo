import QtQuick 2.0

Rectangle {
    id: rect1
    color: "#58FAD0"
    radius: 20
    Text{
        id: text
        width: 100
        height: 50
        text: model.name
        font.pointSize: 15
        anchors.centerIn: rect1
        color: "#8A0829"
    }
}
