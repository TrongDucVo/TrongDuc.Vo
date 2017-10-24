import QtQuick 2.6

Rectangle {
    id: boxcroll
    border.color: "black"
    border.width: 3
    radius: 8

    property alias text: text_box.text

    signal click_scroll()
    Text {
        id: text_box
        text: qsTr("ComboBox")
        anchors.centerIn: parent
        font.pointSize: 12
        color: "green"
    }

    Rectangle {
        width: parent.width*0.2
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        //anchors.rightMargin: 5
        border.color: "red"
        border.width: 4
        radius: boxcroll.radius - 1

        MouseArea {
            anchors.fill: parent
            onClicked: click_scroll()
        }
    }
}
