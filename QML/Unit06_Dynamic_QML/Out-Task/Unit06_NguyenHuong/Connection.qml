import QtQuick 2.0
Item {
    width: 400; height: 300
    id: root
    Row {
        id: test
        anchors.centerIn: root
        spacing: 2
        Rectangle {
            id:action
            width: 40; height: 40
            radius: 20
            color: "blue"
            signal sendTo()
                onSendTo: console.log("Send clicked")
            MouseArea {
                id: mousearea
                anchors.fill: parent
                hoverEnabled: true
                property string notice
                acceptedButtons: Qt.AllButtons
                onEntered: {
                    information.text = "Entered"
                }
                onExited: {
                    information.text = "Exited"
                }

                onPressed: {
                    if (mouse.button == Qt.LeftButton)
                        notice = "Left Button"
                    else if (mouse.button == Qt.RightButton)
                        notice = "Right Button"
                    else if (mouse.button == Qt.MidButton)
                        notice = "Middle Button"
                    information.text = notice
                }
                onReleased:{
                    information.text = "Released"
                }
                onClicked: {
                    information.text = "Clicked"
                }
                onDoubleClicked: {
                    information.text = "Double Clicked"
                }
                onPressAndHold: {
                    information.text = "Press and hold"
                }
            }
            Component.onCompleted: {
                   mousearea.clicked.connect(sendTo)
               }
        }
        Rectangle {
            id:result
            width: 90; height: 40
            color: "yellow"
            border.color: "red"
            border.width: 4
            Text {
                id: information
                anchors.centerIn: parent

            }
        }
    }
    Rectangle {
        id: note
        width: 320; height: 20
        border.color: "blue"
        anchors.bottom: test.top
        anchors.horizontalCenter: root.horizontalCenter
        anchors.margins: 10
        Text {
            anchors.centerIn: parent
            text: "Note: Notice in rectangle| Write Send Clicked on console if click"
        }
    }
}
