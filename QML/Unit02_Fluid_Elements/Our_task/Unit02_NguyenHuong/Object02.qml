import QtQuick 2.0

Item {
    id: root
    width: 600
    height: 400
    property int duration: 3000
    Text {
        text: "Dangerous!"
        anchors.centerIn: parent
        color: "white"
        font.family: "Ubuntu"
        font.pointSize: 20
        SequentialAnimation on opacity {
            NumberAnimation {
                to: 0.0;
                duration: 300
            }
            NumberAnimation {
                to: 1.0;
                duration: 300
            }
            loops: Animation.Infinite
        }
        NumberAnimation on rotation {
            from: 0
            to: 360
            duration: 2000
            loops: Animation.Infinite
        }
    }
}
