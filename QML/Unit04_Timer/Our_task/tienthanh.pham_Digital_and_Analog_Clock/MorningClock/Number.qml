import QtQuick 2.6

Item {
    width: 100
    height: 100
    property alias myNumber: number.text
    Rectangle{
        width: 100
        height: 100
        radius: 5
        anchors.centerIn: parent
        color: "red"
        Text{
            id: number
            text: myNumber
            font.pointSize: 50
            color: "white"
            font.bold: true
            anchors.centerIn: parent
        }
    }
}
