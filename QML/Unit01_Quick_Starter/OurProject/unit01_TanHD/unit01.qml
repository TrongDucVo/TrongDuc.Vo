import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 400
    height: 400
    title:  qsTr("Hello World")

    Rectangle {
        id: rect
        width: 200
        height: 200
        anchors.centerIn: parent
        border.color: "black"
        border.width: 5
        radius: 10

        Text {
            id: hello
            anchors.centerIn: parent
            font.pointSize: 25
            text: "Hello World"
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                hello.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                console.log("clicked")
            }
        }
    }

}
