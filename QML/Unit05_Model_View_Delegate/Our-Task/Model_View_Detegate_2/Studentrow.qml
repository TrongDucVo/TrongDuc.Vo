import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle{
    id:root

    signal signal_remove(int index)
    Text {
        id: txt
        color: "black"
        text:model.name
        font.pointSize: 15
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
    }


    // xoa hang
    Rectangle{
        id:button
        width: 60
        height: 40
        color:"gray"
        anchors.left: mem3.right

        MouseArea{
            anchors.fill: parent
            onClicked: {pitch.remove(model.index)
            }

            Text {
                id: name1
                anchors.horizontalCenter: parent.horizontalCenter
                y:10
                text: "Del"
                color:"red"
                font.pointSize: 15


            }

        }



    }
    Rectangle{
        id:mem1
        width:  root.width
        height: 40
        color: "gray"
        border.color: "green"
        anchors.left: root.right
        TextField{
            placeholderText: qsTr("DoB")
            width: root.width
            height: 40
            font.pointSize: 12

        }

    }
    Rectangle{
        id:mem2
        width:  root.width
        height: 40
        color: "gray"
        border.color: "green"
        anchors.left: mem1.right
        TextField{
            placeholderText: qsTr("Sex")
            width: root.width
            height: 40
            font.pointSize: 12

        }
    }
    Rectangle{
        id:mem3
        width:  root.width
        height: 40
        color: "gray"
        border.color: "green"
        anchors.left: mem2.right
        TextField{
            placeholderText: qsTr("Mark")
            width: root.width
            height: 40
            font.pointSize: 12

        }
    }


}
