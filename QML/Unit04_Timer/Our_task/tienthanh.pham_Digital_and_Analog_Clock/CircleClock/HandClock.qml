import QtQuick 2.6
Item{
    property alias hand: clockHand.source
    property alias time: rotation.duration
    anchors.fill: parent
    Image {
        id: clockHand
        source: sourceClockHand
        anchors.fill: parent
        RotationAnimation{
            id: rotation
            target: clockHand
            from: 0
            to:360
            duration: time
            running: true
            loops: Animation.Infinite
        }
    }
}
