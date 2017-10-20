import QtQuick 2.6
Item{
    property alias hand: clockHand.source
    property alias time: rotation.to
    anchors.fill: parent
    Image {
        id: clockHand
        source: sourceClockHand
        anchors.fill: parent
        RotationAnimation{
            id: rotation
            target: clockHand
//            from: 0
            to:time
            duration: 10
            running: true
            onToChanged: {
                rotation.start()
            }
        }
    }
}
