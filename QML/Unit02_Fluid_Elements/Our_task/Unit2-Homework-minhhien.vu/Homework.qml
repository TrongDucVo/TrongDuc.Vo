import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    id: page
    visible: true
    width: 1000
    height: 500
    title: qsTr("Competition")

    Rectangle {
        width: 150
        height: 50
        id: rec1
        Text {
            id: text1
            font.pointSize: 15
            anchors.centerIn: parent
            text: qsTr("Lambogini")
        }
        anchors.horizontalCenter: page.horizontalCenter
        color: "red"
    }
    Rectangle {
        x: 0
        y: 100
        id: rec2
        width: 150
        height: 50
        Text {
            id: text2
            font.pointSize: 15
            anchors.centerIn: parent
            text: qsTr("Ferrari")
        }
        anchors.horizontalCenter: page.horizontalCenter
        color: "red"
    }
    Rectangle {
        x: 400
        y: 400
        width: 100
        height: 50
        color: "blue"
        MouseArea{
            id: mouseArea
            anchors.fill: parent
            Text {
                id: text3
                font.pointSize: 15
                anchors.centerIn: parent
                text: "Start"
            }
            onClicked: {
                state = "down"
            }
            state: ""
            states: State {
                name: "down"; /*when: mouseArea.pressed === y*/
                PropertyChanges { target: rec1; x: 660; rotation: 0; }
                PropertyChanges { target: rec2; x: 660; rotation: 0; }
            }
            transitions: Transition {
                from: ""; to: "down"; reversible: true
                ParallelAnimation {
                    NumberAnimation { target: rec1;properties: "x,rotation"; duration: 300; easing.type: Easing.InOutQuad }
                    ColorAnimation { duration: 300 }
                }
                ParallelAnimation {
                    NumberAnimation { target: rec2;properties: "x,rotation"; duration: 500; easing.type: Easing.InOutQuad }
                    ColorAnimation { duration: 500 }
                }
            }
        }
    }
    Rectangle{
        x: 550
        y: 400
        width: 100
        height: 50
        color: "red"
        MouseArea{
            id: mouseArea2
            anchors.fill: parent
            onClicked: Qt.quit()
        }
        Text {
            id: text4
            anchors.centerIn: parent
            font.pointSize: 15
            text: qsTr("Quit")
        }
    }
}

