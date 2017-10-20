import QtQuick 2.0

Item {
    width: 400; height: 300
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
    Rectangle {
        anchors.fill: parent
        color: blue
        SequentialAnimation on color {
            ColorAnimation {
                to: "yellow"
                duration: 1000
            }
            ColorAnimation {
                to: "red"
                duration: 1000
            }
            ColorAnimation {
                to: "blue"
                duration: 1000
            }
            loops: Animation.Infinite
        }
      }
}
