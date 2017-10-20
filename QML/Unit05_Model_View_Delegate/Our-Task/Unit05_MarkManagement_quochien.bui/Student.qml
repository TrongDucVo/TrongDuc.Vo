import QtQuick 2.0

Rectangle {
    id: root
    color: "#FFBF00"
    radius: 20
    signal signal_remove(int index)
    Text{
        id: text
        width: 600
        height: 100
        text: 'Name: ' + model.name + '  - Mark: ' + model.mark
        font.pointSize: 20
        anchors.centerIn: root
        color: "#0040FF"
    }
    Rectangle{
        id: remove
        width:100
        height: parent.height
        radius: 20
        color: "#0040FF"
        anchors.right: root.right
        Text{
            text: "Delete"
            anchors.centerIn: remove
            font.bold: true
            font.pointSize: 15
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                signal_remove(model.index)
        }
    }
}
}
