

import QtQuick 2.8
import QtQuick.Window 2.2

FocusScope {
    width: 250; height: input.height + 30
    Rectangle {
        anchors.fill: parent
        color: "#E0E0F8"
        border.color: "black"
    }
    property alias text: input.text
    property alias input: input
    TextEdit {
        id: input
        anchors.fill: parent
        anchors.margins: 10
        font.pointSize: 15
        focus: true
    }
}
