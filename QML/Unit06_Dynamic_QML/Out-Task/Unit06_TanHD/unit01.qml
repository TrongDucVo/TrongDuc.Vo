import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    id: recUnit01
    width: 580
    height: 400

    Text {
        id: hello
        anchors.centerIn: parent
        font.pointSize: 25
        text: "Hello World"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                hello.color = Qt.rgba(Math.random(), Math.random(),
                                      Math.random(), 1)
                console.log("clicked")
            }
        }
    }

    Text {
        anchors.bottom: parent.bottom
        text: qsTr("click on text to change color")
    }

}
