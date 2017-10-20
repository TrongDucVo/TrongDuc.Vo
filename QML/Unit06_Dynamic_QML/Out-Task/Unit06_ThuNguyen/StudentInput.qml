//StudentInput.qml
import QtQuick 2.0

Row{
    property alias identity2: txt1.text
    property alias name2: txt2.text
    property alias math2: txt3.text
    property alias literature2: txt4.text
    property alias english2: txt5.text
    spacing: 2
    Rectangle{
        height: parent.height
        width: 250
        border.color: "green"
        TextInput {
            id: txt1
            color: "black"
            focus: true
            anchors.fill: parent
            font.pointSize: 12
        }
    }
    Rectangle{
        height: parent.height
        width: 250
        border.color: "green"
        TextInput {
            id: txt2
            color: "black"
            focus: true
            anchors.fill: parent
            font.pointSize: 12
        }
    }
    Rectangle{
        height: 30
        width: 250
        border.color: "green"
        TextInput {
            id: txt3
            color: "black"
            focus: true
            anchors.fill: parent
            font.pointSize: 12
        }
    }
    Rectangle{
        height: parent.height
        width: 250
        border.color: "green"
        TextInput {
            id: txt4
            color: "black"
            focus: true
            anchors.fill: parent
            font.pointSize: 12
        }
    }
    Rectangle{
        height: parent.height
        width: 250
        border.color: "green"
        TextInput {
            id: txt5
            color: "black"
            focus: true
            anchors.fill: parent
            font.pointSize: 12
        }
    }
}
