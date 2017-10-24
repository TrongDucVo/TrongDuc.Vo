//Delegate1.qml for Mycombobox
import QtQuick 2.0

Rectangle {
    id: root
    width: parent.width -3
    height: 40
    color: "#FFFFFF"

    signal signal_choose(string t)

    Text{
        id: txt
        text:modelData
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.color = "#99FFFF"
        onExited: root.color = "#FFFFFF"
        onClicked: signal_choose(model)
    }
}
