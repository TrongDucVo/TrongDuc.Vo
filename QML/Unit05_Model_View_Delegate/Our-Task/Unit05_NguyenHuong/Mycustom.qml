import QtQuick 2.0

Rectangle {
    color: "yellow"
    signal signal_remove (int index)
    signal signal_add (int index)
    Text {
        id: text
        width: 100
        height: parent.height
        text: model.name
    }
    Rectangle {
        id: add
        width: 50
        height: parent.height/2
        anchors.left: text.right
        anchors.margins: 3
        color: "blue"
        Text {
            anchors.centerIn: parent
            text: "Add"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: signal_add (model.index)
        }
    }
    Rectangle {
        id: remove
        width: 50
        height: parent.height/2
        anchors.left: add.right
        anchors.margins: 3
        color: "red"
        Text {
            anchors.centerIn: parent
            text: "Remove"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: signal_remove (model.index)
        }
    }
}
