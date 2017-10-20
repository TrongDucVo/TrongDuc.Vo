import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Demo_Dynamic_Loader")
    Rectangle {
        id: root
        visible: true
        width: 400; height: 300
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 20
        border.color: "black"
        Loader {
            id: pageLoader
        }
    }
    Rectangle {
        id: place_of_view
        visible: true
        width: 200; height: 300
        anchors.left: root.right
        anchors.top: parent.top
        anchors.margins: 20
        border.color: "black"
        color: "#53d769"
        ListModel {
            id: myModel
            ListElement {name: "QuickStarter"; url: "qrc:/QuickStarter.qml"}
            ListElement {name: "FluidElement"; url: "qrc:/FluidElement.qml"}
            ListElement {name: "Connection"; url: "qrc:/Connection.qml"}
            ListElement {name: "Timer"; url: "qrc:/Timer.qml"}
        }
        ListView {
            id: myView
            anchors.top: parent.top
            anchors.margins: 5
            width: parent.width; height: parent.height
            spacing: 10
            model: myModel
            delegate: signal_Load
            header: Rectangle {
                id: header
                width: parent.width
                height: 30
                color: "Green"
                Text {
                    anchors.centerIn: parent
                    text: "List of lessons"
                }
            }
        }
        Component {
            id: signal_Load
            Rectangle {
                id: view
                width: 150; height: 40
                border.color: "black"
                border.width: 3
                Text {
                    anchors.centerIn: parent
                    text: model.name
                }
                Rectangle {
                    id: action
                    width: 30; height: 30
                    radius: 15
                    anchors.left: view.right
                    anchors.margins: 5
                    color: "blue"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            pageLoader.source = model.url
                        }
                    }
                }
            }
        }

    }
}
