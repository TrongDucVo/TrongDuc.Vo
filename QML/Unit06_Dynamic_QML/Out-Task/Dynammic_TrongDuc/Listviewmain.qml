import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle{
    id:root

    signal signal_remove(int index)
    Text {
        id: txt
        color: "black"
        text:model.name
        font.pointSize: 15
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10


    }
}
