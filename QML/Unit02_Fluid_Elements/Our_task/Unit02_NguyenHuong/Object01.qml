import QtQuick 2.0

Item {
    id: root
    width: 600
    height: 400
    property int duration: 3000
    Rectangle {
        anchors.fill: parent
        /*gradient: Gradient {
        GradientStop { position: 0.0; color: "#00FF00" }
        GradientStop { position: 1.0; color: "#00803F" }
        }*/
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
