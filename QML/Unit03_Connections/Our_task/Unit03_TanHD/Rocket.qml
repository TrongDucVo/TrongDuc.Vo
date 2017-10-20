import QtQuick 2.0

Item {
    id: root
    width: 50
    height: 50
    visible: true
    property alias rColor: rect.color

    signal  clickImage
    signal  pressHold

    Rectangle {
        id: rect
        anchors.fill: parent
        x: parent.x
        y: parent.y
        radius: width/2
        color: myColor

        MouseArea {
            id: mousa
            anchors.fill: parent
            onClicked: {
                rect.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                console.log("clicked")
            }

            onPressAndHold: {
                rect.color = "white"
                drag.target = root
                 console.log("pressandhold")
            }

            onReleased: {
                rect.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                 console.log("released")
            }
        }
    }
}
