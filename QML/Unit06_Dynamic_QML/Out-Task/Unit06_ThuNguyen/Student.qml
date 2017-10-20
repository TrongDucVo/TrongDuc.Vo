//Student.qml

import QtQuick 2.0

Row{
    property alias identity1: txt1.text
    property alias name1: txt2.text
    property alias math1: txt3.text
    property alias literature1: txt4.text
    property alias english1: txt5.text
    spacing: 2
    Rectangle{
        height: 30
        width: 250
        color: "steelblue"
        TextInput {
            id: txt1
            color: "black"
            focus: true
            font.pointSize: 12
            anchors.fill: parent
        }
    }
    Rectangle{
        height: 30
        width: 250
        color: "steelblue"
        TextInput {
            id: txt2
            color: "black"
            focus: true
            font.pointSize: 12
            anchors.fill: parent
        }
    }
    Rectangle{
        height: 30
        width: 250
        color: "steelblue"
        TextInput {
            id: txt3
            color: "black"
            focus: true
            font.pointSize: 12
            anchors.fill: parent
        }
    }
    Rectangle{
        height: 30
        width: 250
        color: "steelblue"
        TextInput {
            id: txt4
            color: "black"
            focus: true
            font.pointSize: 12
            anchors.fill: parent
        }
    }
    Rectangle{
        height: 30
        width: 250
        color: "steelblue"
        TextInput {
            id: txt5
            color: "black"
            focus: true
            font.pointSize: 12
            anchors.fill: parent
        }
    }
}
