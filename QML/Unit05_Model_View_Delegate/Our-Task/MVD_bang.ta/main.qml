import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

ApplicationWindow{
    visible: true
    width:900; height: 700
    title: qsTr("Student Management")
    Text{
        x: 330
        text: "Student Management"
        font.pointSize: 30
        color: "brown"
    }
    ListModel{
        id: listmodel
        ListElement{name: "Bui Quoc Hien"; mark: "10"}
        ListElement{name: "Ta Dang Bang"; mark: "9"}
         ListElement{name: "Nguyen Van A"; mark: "9"}

    }
    ListView{
        y: 100
        id: listview
        visible: true
        model: listmodel
        width: parent.width
        height: parent.height
        spacing: 50
        delegate: Student{
            id: root
            width: 900
            height: 100
            radius: 150
            MouseArea{
                onClicked: listmodel.append({"name": "Hoang Van B", "mark":9})
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
            font.pointSize:15
            text: "Name: "
            color: "blue"
        }
        TextInput{
            x:120
            y: 0
            id: textinput
            width: 400
            height: 50
            font.pointSize: 15
            focus: true
            color: "blue"
        }
        Text{
            x:500
            y:0
            font.pointSize:15
            text: "Mark: "
            color: "blue"
        }
        TextInput{
            x: 630
            y: 0
            id: textinput1
            width: 100
            height: 50
            font.pointSize: 15
            focus: true
            color: "blue"

        }

        Button{
            id: button
            width: 50
            height: 50
            anchors.right: input.right
            text: "Add"
            onClicked: {
                listmodel.append({"name":textinput.text,"mark": textinput1.text})
                textinput.text = " "
                textinput1.text = " "
            }
        }
    }
}
