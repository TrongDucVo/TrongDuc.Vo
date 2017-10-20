import QtQuick 2.0

Item {
    id: root
    width: 600
    height: 400
    property int duration: 3000
    Image {
        id: signal
        source: "signal.png"
        x:0; y:0
        MouseArea {
            anchors.fill: parent
            onClicked: {
                signal.x = 0;
                signal.y = root.height-signal.height;
                signal.rotation = 0;
                action.restart()
            }
        }
    }
    ParallelAnimation {
        id: action
            NumberAnimation {
                target: signal
                properties: "y"
                to: 40
                duration: root.duration
            }
            NumberAnimation {
                target: signal
                properties: "x"
                to: 0
                duration: root.duration

            }
            RotationAnimation {
                target: signal
                properties: "rotation"
                to: 720
                duration: root.duration
            }
            loops: Animation.Infinite
}
}
