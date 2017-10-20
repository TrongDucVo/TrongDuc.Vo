import QtQuick 2.0

Item {
    Grid {
        x: 50; y: 50
        columns: 2
        spacing: 5
        Rectangle {
            id: button1
            color: "yellow"
            border.color: "black"
            width: 60;height: 30
            Text {
                anchors.centerIn: parent
                text: "Your Name"
            }
        }
        Rectangle {
            id: button2
            color: "yellow"
            border.color: "black"
            width: 100;height: 30
            TextEdit {
                id:input
                focus: true
                anchors.centerIn: parent
                color: " blue"
                text: " "
            }
        }
        Rectangle {
            id: button3
            color:"red"
            border.color: "black"
            width: 60;height: 30
            Text {
                anchors.centerIn: parent
                text: "Click hear!"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    status.text = "Accepted!!"
                    button4.color = "blue"
                }
            }
        }
        Rectangle {
            id: button4
            color: "red"
            border.color: "black"
            width: 100;height: 30
            Text {
                id: status
                anchors.centerIn: parent
                text: "Not accept!"
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

}
