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

    }
    Rectangle {
        id: rec1
        height: 50
        width: 50
        y: 50
        x: 50
        color: "green"
        border.color: "#7769D6ff"
        border.width: 10

        NumberAnimation on x {
            to: 350
            duration: 2000
            loops: Animation.Infinite
        }
    }

    Rectangle {
        id: rec4
        x: 50
        y: 300
        height: 50
        width: 50
        color: "green"
        border.color: "#7769D6ff"
        border.width: 10
        NumberAnimation on x {
            to: 350
            duration: 2000
            loops: Animation.Infinite
        }
    }


    MouseArea {
        anchors.fill: recLeft
        onClicked: {
            Qt.quit();
        }
    }

}
