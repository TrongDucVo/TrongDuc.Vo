import QtQuick 2.8
import QtQuick.Window 2.2
Window{
    id: win
    width: 500; height: 500
    title: qsTr("ComboBox")
    color: "#F8E0E0"
    Row{
        id: row
        x: 50; y: 50
        spacing: 10
        Rectangle{
            id: rect1
            width: 200; height: 80
            color: "#F8E0E0"
            Text{
                text: "Default State"
                font.bold: true
                font.pointSize: 15
            }
            Rectangle{
                id: rect2
                anchors.bottom: rect1.bottom
                width: 200; height: 50
                radius: 5
                border.color: "black"

                Text {
                    text: "ComboBoxItem1"
                    font.pointSize: 15
                    anchors.centerIn: rect2
                }
            }
        }
        Rectangle{
            id: rect3
            width: 200; height: 80
            color: "#F8E0E0"
            //signal signal_click(int index)
            Text{
                text: "Pressed State"
                font.bold: true
                font.pointSize: 15
            }
            MouseArea{
                anchors.fill: parent
                onClicked: rect5.visible = !rect5.visible
            }
            Rectangle{
                id: rect4
                anchors.bottom: rect3.bottom
                width: 200; height: 50
                radius: 5
                border.color: "black"
                Text {
                    id: text
                    text: "ComboBoxItem1"
                    font.pointSize: 15
                    anchors.centerIn: rect4
                }
            }
        }

    }

    Rectangle{
        id: rect5
        visible: false
        width: 200; height: parent.height
        anchors.top: row.bottom
        anchors.right: row.right
        color: "#F8E0E0"
        ListModel{
            id: listmodel
            ListElement{name: "ComboBoxItem2"}
            ListElement{name: "ComboBoxItem3"}
            ListElement{name: "ComboBoxItem4"}
            ListElement{name: "ComboBoxItem5"}
            ListElement{name: "ComboBoxItem6"}
        }
        ListView{
            id: listview
            model: listmodel
            width: 200; height: 300
            highlight: Rectangle {z: 2; opacity: 0.3; color: "#0101DF"; radius: 10}
            focus: true
            anchors.margins: 10
            spacing: 5
            delegate: Custum{
                width: 200; height: 50
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        text.text = model.name
                        listview.currentIndex = index
                    }
                }
            }
        }
    }
}
