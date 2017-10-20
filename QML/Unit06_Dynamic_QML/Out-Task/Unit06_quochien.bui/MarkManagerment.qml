import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Rectangle{
    visible: true
    width:1000; height: 1000
//    title: qsTr("Mark Management")
    Text{
        x: 330
        text: "Mark Management"
        font.family: "Comic Sans MS"
        font.pointSize: 30
        color: "#B40431"
    }
    ListModel{
        id: listmodel
        ListElement{name: "Bui Quoc Hien"; mark: "9"}
        ListElement{name: "Le Thi Ngoc Cham"; mark: "9"}
        ListElement{name: "Nguyen Hoang Giang"; mark: "9"}

    }
    ListView{
        y: 100
        id: listview
        model: listmodel
        width: parent.width
        height: parent.height
        spacing: 5
        delegate: Student{
            width: parent.width
            height: 100
            onSignal_remove: {
                listmodel.remove(model.index)
            }
        }
    }
    Rectangle{
        id: input
        anchors.bottom: parent.bottom
        height:50
        width: parent.width
        Text{
            x:0
            y:0
            font.pointSize:20
            text: "Name: "
            color: "#0040FF"
        }
        TextInput{
            x:90
            y: 0
            id: textinput
            width: 400
            height: 50
            font.pointSize: 20
            focus: true
        }
        Text{
            x:500
            y:0
            font.pointSize:20
            text: "Mark: "
            color: "#0040FF"
        }
        TextInput{
            x: 600
            y: 0
            id: textinput1
            width: 100
            height: 50
            font.pointSize: 20
            focus: true
            color: "#04B404"
        }

        Button{
            id: button
            width: 50
            height: 50
            anchors.right: input.right
            text: "Add"
            onClicked: {
                listmodel.append({"name":textinput.text,"mark": textinput1.text})
                textinput.text = ""
                textinput1.text = ""
            }
        }
    }
}
