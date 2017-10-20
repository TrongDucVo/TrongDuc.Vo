import QtQuick 2.0

Item {
    Rectangle {
        id: boadgame
        x: 250; y: 250
        width: 200; height: 200
        color: "blue"
        border.color: "red"
        Image {
            id: hpbd
            source: "happy.jpg"
            anchors.fill: parent
            anchors.margins: 8
        }
    }

}
