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

    Rectangle{
        id:dayofb
        width: 120
        height: 50
        color: "violet"
        anchors.left: root.right
        Text {
            id: dob
            text: "Ngay Sinh"
             anchors.horizontalCenter: parent.horizontalCenter
             font.pointSize: 15
             y:10
        }
    }
    Rectangle{
        id:button
        width: 60
        height: parent.height
        color:"gray"
        anchors.left: dayofb.right

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


}
