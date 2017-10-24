import QtQuick 2.0

Rectangle {
    id: rec
    color: "#58FAD0"
    radius: 10
    Text{
        id: text
        width: 180
        height: 50
        text: model.name
        font.pointSize: 15
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent
        color: "#8A0829"
    }
}
