
import QtQuick 2.8
import QtQuick.Window 2.2

Item {
    property  int secon: 0
    property int min: 0
    id: root
    width: 400; height: 300
    Rectangle {
        id: clock
        width: 80; height: 80
        anchors.centerIn: root
        color: "yellow"
        border.color: "red"
        border.width: 3
        Text {
            id: display
            visible: true
            anchors.centerIn: parent
            font.pixelSize: 13
            text: "Click to start"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                layout.visible = true
                display.text = min + ':'+ secon
                clock.radius = 40
                clock.color = "white"
                clock.border.color = "black"
                time.running = true
            }
        }
    }
    Timer {
        id: time
        interval: 1000; running: false; repeat: true
        onTriggered: {
            root.secon = root.secon + 1
            if(root.secon==60) {
                root.min = root.min +1;
                root.secon = 0;
            }
            display.text = min + ':'+ secon
        }
    }
    Rectangle {
        visible: if (min >= 1 || secon >= 2) { return true} else { return false }
        id: notice
        anchors.bottom: clock.top
        anchors.horizontalCenter: root.horizontalCenter
        anchors.margins: 6
        border.color: "blue"
        width: 150; height: 30
        border.width: 4
        Rectangle {
            id: button01
            anchors.bottom: good.top
            anchors.left: good.left
            anchors.margins: 8
            color: "blue"
            width: 40; height: 40
            radius: 20
            Text {
                id: oftest
                anchors.centerIn: parent
                text: "Now?"
            }
            Timer {
                id: test
                interval: 500; running: false; repeat: true
                onTriggered: {
                    button01.anchors.margins = 40
                    button01.color = "white"
                    oftest.text = Date().toString()
                }
               }

            MouseArea {
                anchors.fill: button01
                onClicked: test.running = true
            }
        }
        Rectangle {
            id: button02
            anchors.bottom: good.top
            anchors.right: good.right
            anchors.margins: 8
            color: "blue"
            width: 40; height: 40
            radius: 20
            Text {
                anchors.centerIn: parent
                text: "Quite?"
            }
            MouseArea {
                anchors.fill: button02
                onClicked: Qt.quit()
            }
        }
        Text {
            id: good
            text: "2s! You want?"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }
    Text {
        id: layout
        visible: false
        text: "This is a smart clock"
        anchors.top: clock.bottom
        anchors.horizontalCenter: clock.horizontalCenter
    }
}
