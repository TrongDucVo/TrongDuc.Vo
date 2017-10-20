import QtQuick 2.0
FocusScope {
    width: 1000; height: input.height + 20
    Rectangle {
        anchors.fill: parent
        color: "lightsteelblue"
        border.color: "gray"
    }
    property alias text: input.text
    property alias input: input
    property alias echoMode: input.echoMode
    property alias focus1: input.focus
    TextInput {
        id: input
        anchors.fill: parent
        font.pointSize: 25
        anchors.margins: 4
        layer.enabled: true
        focus: true
    }
}
