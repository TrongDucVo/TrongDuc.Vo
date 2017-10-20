import QtQuick 2.0

Item {
    id: id_root
    property int value: 0
    property int granularity: 60
    property int w: width
    property int h: height

    Rectangle {
        width: 3
        height: id_root.w * 0.4
        color: "red"
        anchors {
            horizontalCenter: id_root.horizontalCenter
        }
        antialiasing: true
        y: id_root.h * 0.4
    }

    rotation: 360/granularity * (value % granularity)
    antialiasing: true
}
