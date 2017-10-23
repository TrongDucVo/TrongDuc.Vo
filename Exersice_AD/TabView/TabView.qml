import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Window 2.0
Window {
    id:root
    width: 630
    height: 830
    Rectangle{
        id:list
        width: root.width/3
        height: 50
        color: "gray"
        border.width: 1
        border.color: "white"
        Text {
            id: text1
            text: "List"
            anchors.centerIn: parent
            font.pointSize: 15
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                list.color = "blue"
                form.color = "gray"
                empty.color = "gray"

            }
        }

    }
    Rectangle{
        id:form
        width: root.width/3
        height: 50
        color: "gray"
        anchors.left: list.right
        border.width: 1
        border.color: "white"
        Text {
            id: text2
            text: "Form"
            anchors.centerIn: parent
            font.pointSize: 15
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                list.color = "gray"
                form.color = "blue"
                empty.color = "gray"
            }
        }

    }
    Rectangle{
        id:empty
        width: root.width/3
        height: 50
        color: "gray"
        anchors.left: form.right
        border.width: 1
        border.color: "white"
        Text {
            id: text3
            text: "Empty"
            anchors.centerIn: parent
            font.pointSize: 15
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                list.color = "gray"
                form.color = "gray"
                empty.color = "blue"
            }
        }
    }
    Item{
        id:contain
        anchors.bottom: list.bottom
        ListModel{
            id:model1
            ListElement{name:""}
            ListElement{name:""}
            ListElement{name:""}
        }
        ListView{
            id:listview1
            model: model1
            width: 630
            height: 830
            spacing: 3
            delegate: forlistview
            orientation: ListView.Horizontal
        }
        Component{
            id: forlistview
            Rectangle{
                id:forcompo
                width: 630
                height: 830
                color: "#c2d6d6"
            }
        }
    }
}

