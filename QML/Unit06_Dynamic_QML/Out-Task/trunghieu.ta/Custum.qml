import QtQuick 2.6

Rectangle {
    id: root_Cus
    radius: 8
    signal signal_remove()
    Text {
        id: txt
        width: win.height/12
        height: parent.height
        text: model.name
        color: "black"
        x: height/4
        y: height/4
        font.pointSize: 15
    }

    Text {
        id: txt2
        width: win.height/12
        height: parent.height
        text: model.sco
        color: "black"
        anchors.right: parent.right
        anchors.margins: width/2
        y: height/4
        //x: -40
        font.pointSize: 15
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            signal_remove()
        }
    }
}
