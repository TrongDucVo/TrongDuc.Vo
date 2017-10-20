import QtQuick 2.0

Rectangle {
    id: root
    color: "green"
    radius: 20
    Text{
        id: text
        width: 600
        height: 100
        text:  model.name
        font.pointSize: 20
        anchors.centerIn: parent
        color: "#0040FF"
    }
    Rectangle{
        id: remove1
        width:100
        height: parent.height
        radius: 80
        color: "#0040FF"
        anchors.right: root.right
        Text{
            text: "Clear all"
            anchors.centerIn: remove1
            font.bold: true
            font.pointSize: 10
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
             listmodel.clear();
        }
    }
}
}
