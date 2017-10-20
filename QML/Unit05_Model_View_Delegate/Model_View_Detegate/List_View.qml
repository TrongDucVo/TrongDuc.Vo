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
    ListElement{name:"Ho va Ten"}

}
ListView{
    id:listviewxxx
    model: pitch
    height: parent.height
    width: parent.width
    spacing: 5
    delegate: Studentrow{
        width: parent.width/3
        height: 50
        color: "blue"
onSignal_remove: {
    pitch.remove(index)
    }
}
}

Rectangle{
    id:add

    width: 60
    height: 40
    x:460
    color:"white"
    anchors.left: text1.right
    border.color: "blue"

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
