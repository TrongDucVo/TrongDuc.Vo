import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 400
    height: 300
    title: qsTr("Combo Box")

    Rectangle {
        id: listView
        visible: false
        x: 100; y: 100
        width: 200; height: 90
        border.color: "#1279d1"
        border.width: 1
        ListModel {
            id: myModel
            ListElement { name: "Number01" }
            ListElement { name: "Number02" }
            ListElement { name: "Number03" }
            ListElement { name: "Number04" }
            ListElement { name: "Number05" }
        }
        ListView {
            id: myView
            x: 15; y: 1
            width: 200; height: 60
            spacing: 0
            model: myModel
            delegate: signalAction
        }
        Component {
            id: signalAction
            Rectangle {
                id: viewElement
                width: listView.width - 30; height: listView.height/5
                color: "white"
                Text {
                    anchors.centerIn: parent
                    text: model.name
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        color = "#1279d1"
                    }
                    onExited: {
                        color = "white"
                    }
                    onPressed: {
                        notice.text = model.name
                        console.log("Press signal!")
                    }
                }
            }
        }
    }
    Rectangle {
        id: viewNotice
        x: listView.x - 4; y: listView.y - height + 1
        height: 30; width: listView.width + height
        radius: 5
        border.color: "#788cb6"
        border.width: 2
        Text {
            id: notice
            anchors.centerIn: parent
            text: "Number"
            font.family: "ubuntu"
            font.pixelSize: 12
        }
    }
    Rectangle {
        id: button
        x: viewNotice.x + viewNotice.width - viewNotice.height
        y: viewNotice.y + 2
        width: viewNotice.height - 2; height: width - 2
        color: "#dde0e8"
        Image {
            id: button1
            source: "button.JPG"
            anchors.left: parent.left
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                state.text = "Pressed State"
                listView.visible = true
            }
        }
    }
    Text {
        id: state
        x: viewNotice.x; y:viewNotice.y - 20
        font.pixelSize: 14
        text: "Default State"
    }
}
