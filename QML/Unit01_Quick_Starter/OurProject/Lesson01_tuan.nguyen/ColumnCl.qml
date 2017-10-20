import QtQuick 2.6

Rectangle {
    width:40; height: 400
    color: "red"
    MouseArea {
        anchors.fill: parent
        onClicked: console.log("Button clicked!")
    }
}
