import QtQuick 2.6


Item {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: recLeft
        height: 200
        width: 200
        anchors.centerIn: parent
        color: "red"

        Rectangle {
            height: 50
            width: 50
            anchors.right: recLeft.left
            anchors.bottom: recLeft.top
            color: "green"
            border.color: "#7769D6ff"
            border.width: 10
        }

        Rectangle {
            height: 50
            width: 50
            anchors.right: recLeft.left
            anchors.bottom: recLeft.top
            color: "green"
            border.color: "#7769D6ff"
            border.width: 10
        }

        Rectangle {
            height: 50
            width: 50
            anchors.left: recLeft.right
            anchors.bottom: recLeft.top
            color: "green"
            border.color: "#7769D6ff"
            border.width: 10
        }

        Rectangle {
            height: 50
            width: 50
            anchors.right: recLeft.left
            anchors.top: recLeft.bottom
            color: "green"
            border.color: "#7769D6ff"
            border.width: 10
        }

        Rectangle {
            height: 50
            width: 50
            anchors.left: recLeft.right
            anchors.top: recLeft.bottom
            color: "green"
            border.color: "#7769D6ff"
            border.width: 10
        }
    }


    MouseArea {
        anchors.fill: recLeft
        onClicked: {
            Qt.quit();
        }
    }

}
