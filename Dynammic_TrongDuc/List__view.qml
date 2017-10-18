import QtQuick 2.0
import QtQuick.Controls 1.2

Item{
    id:second




    ListModel{
        id:pitch
        ListElement{name:""}
        ListElement{name:""}





    }
    ListModel{
        id:formmau
        ListElement{name:"Ho va Ten"}
        ListElement{name:"Ngay Sinh"}
        ListElement{name:"Gioi Tinh"}
        ListElement{name:"Diem"}

    }
    Row{
        id:row1
        spacing: 0
        y: 20
        Repeater{
            model: formmau
            Rectangle{
                id:infor
                color: "brown"
                width: second.width/4
                height: 40
                border.color: "green"
                Text {
                    id: text12
                    text: model.name
                    //width: parent.height
                    // height: 50
                    color: "black"
                    font.pointSize: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    y:10
                }
            }
        }
    }

    ListView{
        id:listviewxxx
        model: pitch
        height: parent.height
        width: second.width
        y:60
        spacing: 2
        delegate: Studentrow{
            TextField{
                placeholderText: qsTr("Full Name")
                width: second.width/4
                height: 40

                font.pointSize: 12
                anchors.horizontalCenter: placeholderText
            }
            width: parent.width/4
            height: 40
            color: "gray"
            border.color: "green"


            onSignal_remove: {
                pitch.remove(index)
            }
        }
    }
    //them hang
    Rectangle{
        id:add

        width: 60
        height: 40
        y:20
        color:"white"
        anchors.left: row1.right
        border.color: "black"

        MouseArea{
            anchors.fill: parent
            onClicked: {pitch.append({})

            }

            Text {
                id: name2
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Add++"
                y:10


            }

        }

    }
}
