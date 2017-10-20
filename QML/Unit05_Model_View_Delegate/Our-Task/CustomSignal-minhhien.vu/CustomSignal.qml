import QtQuick 2.0

Rectangle {
    width: 360
    height: 360

    Rectangle {
        id: myButton

        width: 200
        height: 120
        anchors.centerIn: parent

        property color buttonColor: "white"
        property color buttonColorPressed: "blue"
        property color buttonBorderColor: "black"
        property color buttonBorderColorPressed: "white"

        signal signalMe(string action)

        MouseArea{
            id: myButtonMouseArea
            anchors.fill: parent
            onClicked: myButton.signalMe("Clicked")
        }

        color: myButtonMouseArea.pressed? buttonColorPressed : buttonColor

        border.width: 2
        border.color: myButtonMouseArea.pressed? buttonBorderColorPressed : buttonBorderColor

        Text{
            id: buttonLabel
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
            }
            color: "black"
            text: "Button Label"
        }
    }
}
