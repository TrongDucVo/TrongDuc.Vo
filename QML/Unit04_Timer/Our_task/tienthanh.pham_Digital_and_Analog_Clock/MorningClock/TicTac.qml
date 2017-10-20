import QtQuick 2.6

Item
{
    property alias myTic: tictac.visible
    width: 20
    height: 100
    Rectangle{
        width: 20
        height: 100
        color: "#000000"
        anchors.centerIn: parent
        Text{
            id: tictac
            visible: myTic
            text:":"
            color: "red"
            font.pointSize: 70
            anchors.centerIn: parent
        }
    }
}
