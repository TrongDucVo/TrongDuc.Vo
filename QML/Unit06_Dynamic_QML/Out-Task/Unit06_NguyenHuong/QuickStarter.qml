import QtQuick 2.0

Item {
    width: 400; height: 300
    Rectangle {
        id: submit
        width: parent.width/2; height: parent.height/2
        anchors.centerIn: parent
        border.color: "black"
        Rectangle {
            id: accept
            width: 10; height: 100
            x: 12; y:12
            color: "blue"
            Text {
                anchors.centerIn: parent
                text: "Submit"
            }
        }
        Rectangle {
            id: quit
            width: 60; height: 10
            x: 12; y:100
            color: "red"
            Text {
                anchors.centerIn: parent
                text: "Quit"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()
            }
        }
    }
}
