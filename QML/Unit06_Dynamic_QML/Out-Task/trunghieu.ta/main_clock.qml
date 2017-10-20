import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    id: root
    width: 800
    height: 600
    color: "white"
    Rectangle{
        id: id_root
        width: root.width
        height: id_root.width/2
        anchors.centerIn: parent
        Grid {
            id: gridClock
            columns: 3
            spacing: id_root.width/20
            anchors.horizontalCenter: parent.horizontalCenter
            y: 50

            Clock {id: cl1; cityText: "VIETNAM"; width: id_root.height/2; height: id_root.height/2}
            Clock {cityText: "FRANCH";width: id_root.height/2; height: id_root.height/2; value: -7}
            Clock {cityText: "KOREA"; width: id_root.height/2; height: id_root.height/2; value: +2}
        }

        Text {
            id: text
            text: qsTr("_______Design by Ace <3________")
            anchors.horizontalCenter: gridClock.horizontalCenter
            anchors.top: gridClock.bottom
            anchors.topMargin: id_root.width/30
            font.pixelSize: id_root.width/30
            font.bold: true
        }
    }


}
