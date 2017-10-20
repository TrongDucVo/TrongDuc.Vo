import QtQuick 2.0
import QtQuick.Controls 1.2

ApplicationWindow{
    id:root
    visible: true
    width: 600
    height: 600
    title: qsTr("Demo List View")

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
    Repeater{
        model: formmau
        Rectangle{
            id:infor
            color: "brown"
            width: root.width/8
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
    width: parent.width
    y:40
    spacing: 2
    delegate: Studentrow{
        TextField{
            placeholderText: qsTr("Full Name")
            width: root.width/8
            height: 40
            font.pointSize: 12
anchors.horizontalCenter: placeholderText
        }
        width: parent.width/8
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
    x:root.width/2
    color:"white"
    anchors.left: text1.right
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
