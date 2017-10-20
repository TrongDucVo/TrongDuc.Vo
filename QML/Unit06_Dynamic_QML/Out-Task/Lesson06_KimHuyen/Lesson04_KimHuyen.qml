import QtQuick 2.0

Item {

    id : time
    property alias text: txttime.text
    Text {
        id: txttime
        text: qsTr("")

        font.bold: true
        font.italic: true
        color: "red"
        font.pointSize: 30
    }




}
