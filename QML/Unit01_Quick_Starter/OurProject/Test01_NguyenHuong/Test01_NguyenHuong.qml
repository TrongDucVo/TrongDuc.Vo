import QtQuick 2.0
import QtQuick.Window 2.2
import "Parameter.js" as Parameter

Item {
    Rectangle {
        id: button
        width: Parameter.screen_width
        height: Parameter.screen_height
        x:12;y:12
        color: "blue"
        border.color: "red"
        Text {
            anchors.centerIn: parent
            text: "Wait me!"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                status.text = "Ok! Welcome!"
            }
        }
    }
    Text {
        id: status
        x:12;y:80
        width: Parameter.text_width
        height: Parameter.text_height
        text: "Loading..."
        horizontalAlignment: Text.AlignHCenter
    }
}
