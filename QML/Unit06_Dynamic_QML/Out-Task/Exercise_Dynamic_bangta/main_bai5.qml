import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Rectangle {
    id: win1
    visible: true
    width: 700
    height: 900
    Rectangle{
        id: rec1
        width: 700
        height: 900
        ListModel{
            id:dataModel
            ListElement{name: "Hien"; score:"10"}
            ListElement{name: "Bang"; score:"9"}
        }
        ListView{
            id: listView
            x: 0
            y: 0
            model: dataModel
            height: win1.height
            width: win1.width
            spacing: 2
            focus: true
            delegate: ListPerson {
                Rectangle{
                    width: 150
                    height: 60
                    x: 250
                    y: 50
                    Text {
                        id: header
                        font.pointSize: 15
                        anchors.centerIn: parent
                        text: qsTr("Score Board")
                    }
                }}
        }
        Rectangle{
            id: rec2
            width: parent.width
            height: 100
            color: "green"
            anchors.bottom: parent.bottom
            Text{
                x: 0
                y: 43
                //                height: parent.height
                //                width: parent.width
                font.pointSize: 20
                text: "Name: "
            }

            TextInput{
                id: textinput1
                //                x: 50
                //                y: 2
                width: 485
                height: 48
                font.pointSize: 15
                anchors.leftMargin: 136
                anchors.left: parent.left
                KeyNavigation.tab: textinput2
            }
            Text{
                //                x:0
                //                y:50
                id: txtScore
                width: 130
                height: 48
                font.pointSize: 20
                text: "Score: "
            }
            TextInput{
                id: textinput2

                y: 60
                width: 485
                height: 48
                font.pointSize: 20

                anchors.left: txtScore.right
                KeyNavigation.tab: textinput1
            }
            Button{
                id: add
                width: 80
                height: 50
                anchors.right: parent.right
                text: "Add"
                highlighted: true
                flat: true
                onClicked: {
                    if((textinput1.text != "") && (textinput2.text != ""))
                        dataModel.append({"name":textinput1.text, "score":textinput2.text })
                    textinput1.text = ""
                    textinput2.text = ""
                }
            }
        }
    }
}
