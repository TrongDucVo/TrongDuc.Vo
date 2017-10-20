import QtQuick 2.6
Item{
    property alias wise: clockwise.source
    property alias time: rotation.to
    anchors.fill: parent
    Image {
        id: clockwise
        source: sourceClockwise
        anchors.fill: parent
        RotationAnimation{
            id: rotation
            target: clockwise
            to:time
            duration: 10
            running: true
            onToChanged: {
                rotation.start()
            }
        }
    }
}
